import 'package:fpdart/fpdart.dart';
import 'package:movieapp_flutter/core/error/failure.dart';
import 'package:movieapp_flutter/core/usecases/usecase.dart';
import 'package:movieapp_flutter/features/movie/domain/repository/movie_detail_repository.dart';

class DeleteMovieDetailUseCase implements UseCase<void, int> {
  final MovieDetailRepository repository;

  DeleteMovieDetailUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(int movieId) {
    return repository.deleteByMovieId(movieId);
  }
}
