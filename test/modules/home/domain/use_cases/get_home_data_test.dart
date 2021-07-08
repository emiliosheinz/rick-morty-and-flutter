import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rick_morty_and_flutter/modules/home/domain/entities/home.dart';
import 'package:rick_morty_and_flutter/modules/home/domain/repositories/home.dart';
import 'package:rick_morty_and_flutter/modules/home/domain/use_cases/get_home_data.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  late GetHomeData useCase;
  late MockHomeRepository mockHomeRepository;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    useCase = GetHomeData(mockHomeRepository);
  });

  final tHomeData = Home(characters: ['Rick', 'Morty']);
  test(
    'should get the data from repository',
    () async {
      when(mockHomeRepository.getHomeData())
          .thenAnswer((_) async => Right(tHomeData));

      // final result = await useCase.execute();

      // expect(result, Right(tHomeData));
      // verify(mockHomeRepository.getHomeData());
      // verifyNoMoreInteractions(mockHomeRepository);
    },
  );
}
