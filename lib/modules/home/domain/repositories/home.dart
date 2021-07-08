import 'package:dartz/dartz.dart';
import 'package:rick_morty_and_flutter/core/error/failures.dart';
import 'package:rick_morty_and_flutter/modules/home/domain/entities/home.dart';

abstract class HomeRepository {
  Future<Either<Failure, Home>> getHomeData();
}
