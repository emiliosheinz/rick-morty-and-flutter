import 'package:flutter/material.dart';
import 'package:rick_morty_and_flutter/core/colors/app_colors.dart';

class _SlidingGradientTransform extends GradientTransform {
  const _SlidingGradientTransform({
    required this.slidePercent,
  });

  final double slidePercent;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * slidePercent, 0.0, 0.0);
  }
}

class ShimmerProvider extends StatefulWidget {
  static ShimmerProviderState? of(BuildContext context) {
    return context.findAncestorStateOfType<ShimmerProviderState>();
  }

  const ShimmerProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  ShimmerProviderState createState() => ShimmerProviderState();
}

class ShimmerProviderState extends State<ShimmerProvider>
    with SingleTickerProviderStateMixin {
  late AnimationController _shimmerController;

  final _shimmerGradient = LinearGradient(
    colors: [
      AppColors.shimmerBackground,
      AppColors.shimmerGradient,
      AppColors.shimmerBackground
    ],
    stops: [0.1, 0.3, 0.5],
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
    tileMode: TileMode.clamp,
  );

  Gradient get gradient => LinearGradient(
        colors: _shimmerGradient.colors,
        stops: _shimmerGradient.stops,
        begin: _shimmerGradient.begin,
        end: _shimmerGradient.end,
        transform: _SlidingGradientTransform(
          slidePercent: _shimmerController.value,
        ),
      );

  Listenable get shimmerChanges => _shimmerController;

  bool get isSized => (context.findRenderObject() as RenderBox).hasSize;

  Size get size => (context.findRenderObject() as RenderBox).size;

  Offset getDescendantOffset({
    required RenderBox descendant,
    Offset offset = Offset.zero,
  }) {
    final shimmerBox = context.findRenderObject() as RenderBox;
    return descendant.localToGlobal(offset, ancestor: shimmerBox);
  }

  @override
  void initState() {
    super.initState();

    _shimmerController = AnimationController.unbounded(vsync: this)
      ..repeat(
        min: -1.5,
        max: 1.5,
        period: const Duration(milliseconds: 1000),
      );
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
