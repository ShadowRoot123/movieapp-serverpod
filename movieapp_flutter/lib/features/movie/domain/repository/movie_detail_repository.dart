import 'package:fpdart/fpdart.dart';
import 'package:movieapp_client/movieapp_client.dart';
import 'package:movieapp_flutter/core/error/failure.dart';

abstract interface class MovieDetailRepository {
  Future<Either<Failure, MovieDetail?>> getByMovieId(int movieId);
  Future<Either<Failure, MovieDetail>> save(MovieDetail detail);
  Future<Either<Failure, void>> deleteByMovieId(int movieId);
}
