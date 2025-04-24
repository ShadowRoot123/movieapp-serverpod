import 'package:fpdart/fpdart.dart';
import 'package:movieapp_client/movieapp_client.dart';
import 'package:movieapp_flutter/core/error/failure.dart';
import 'package:movieapp_flutter/core/usecases/usecase.dart';
import 'package:movieapp_flutter/features/movie/domain/repository/move_repository.dart';

class ListMoviesUseCase implements UseCase<List<Movie>, NoParams> {
  final MovieRepository repository;

  ListMoviesUseCase(this.repository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParams params) async {
    return await repository.list();
  }
}
