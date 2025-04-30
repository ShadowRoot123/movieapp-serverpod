import 'package:fpdart/fpdart.dart';
import 'package:movieapp_client/movieapp_client.dart';
import 'package:movieapp_flutter/core/error/failure.dart';
import 'package:movieapp_flutter/core/usecases/usecase.dart';
import 'package:movieapp_flutter/features/movie/domain/repository/move_repository.dart';

class SaveMoveUsecase implements UseCase<Movie, SaveMoveParams> {
  final MovieRepository repository;

  SaveMoveUsecase(this.repository);

  @override
  Future<Either<Failure, Movie>> call(SaveMoveParams params) async {
    return await repository.save(params.movie);
  }
}

class SaveMoveParams {
  final Movie movie;

  SaveMoveParams({required this.movie});
}
