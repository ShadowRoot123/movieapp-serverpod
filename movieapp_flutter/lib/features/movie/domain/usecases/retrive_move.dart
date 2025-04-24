import 'package:fpdart/fpdart.dart';
import 'package:movieapp_client/movieapp_client.dart';
import 'package:movieapp_flutter/core/error/failure.dart';
import 'package:movieapp_flutter/core/usecases/usecase.dart';
import 'package:movieapp_flutter/features/movie/domain/repository/move_repository.dart';

class RetriveMoveUsecase implements UseCase<Movie, RetriveMoveParams> {
  final MovieRepository repository;

  RetriveMoveUsecase(this.repository);

  @override
  Future<Either<Failure, Movie>> call(RetriveMoveParams params) async {
    return await repository.retrive(params.id);
  }
}

class RetriveMoveParams {
  final int id;

  RetriveMoveParams({required this.id});
}
