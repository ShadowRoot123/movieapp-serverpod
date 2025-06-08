import 'package:fpdart/fpdart.dart';
import 'package:movieapp_client/movieapp_client.dart';
import 'package:movieapp_flutter/core/error/failure.dart';
import 'package:movieapp_flutter/core/usecases/usecase.dart';
import 'package:movieapp_flutter/features/movie/domain/repository/movie_detail_repository.dart';

class SaveMovieDetailUseCase
    implements UseCase<MovieDetail, SaveMovieDetailParams> {
  final MovieDetailRepository repository;

  SaveMovieDetailUseCase(this.repository);

  @override
  Future<Either<Failure, MovieDetail>> call(SaveMovieDetailParams params) {
    return repository.save(params.movieDetail);
  }
}

class SaveMovieDetailParams {
  final MovieDetail movieDetail;

  SaveMovieDetailParams({required this.movieDetail});
}
