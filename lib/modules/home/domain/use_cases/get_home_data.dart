import 'package:dartz/dartz.dart';
import 'package:rick_morty_and_flutter/core/error/failures.dart';
import 'package:rick_morty_and_flutter/modules/home/domain/entities/home.dart';
import 'package:rick_morty_and_flutter/modules/home/domain/repositories/home.dart';

class GetHomeData {
  final HomeRepository repository;

  GetHomeData(this.repository);

  Future<Either<Failure, Home>> execute() async {
    return await repository.getHomeData();
  }
}
