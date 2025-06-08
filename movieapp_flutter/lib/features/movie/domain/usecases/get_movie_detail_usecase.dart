import 'package:fpdart/fpdart.dart';
import 'package:movieapp_client/movieapp_client.dart';
import 'package:movieapp_flutter/core/error/failure.dart';
import 'package:movieapp_flutter/core/usecases/usecase.dart';
import 'package:movieapp_flutter/features/movie/domain/repository/movie_detail_repository.dart';

class GetMovieDetailUseCase implements UseCase<MovieDetail?, int> {
  final MovieDetailRepository repository;

  GetMovieDetailUseCase(this.repository);

  @override
  Future<Either<Failure, MovieDetail?>> call(int movieId) {
    return repository.getByMovieId(movieId);
  }
}
