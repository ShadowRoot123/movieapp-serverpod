import 'package:fpdart/fpdart.dart';
import 'package:movieapp_client/movieapp_client.dart';
import 'package:movieapp_flutter/core/error/exception.dart';
import 'package:movieapp_flutter/core/error/failure.dart';
import 'package:movieapp_flutter/features/movie/data/datasources/movie_detail_datasource.dart';
import 'package:movieapp_flutter/features/movie/domain/repository/movie_detail_repository.dart';

class MovieDetailRepositoryImpl implements MovieDetailRepository {
  final MovieDetailDatasource datasource;

  MovieDetailRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, MovieDetail?>> getByMovieId(int movieId) async {
    try {
      final detail = await datasource.getByMovieId(movieId);
      return right(detail);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> save(MovieDetail detail) async {
    try {
      final saved = await datasource.save(detail);
      return right(saved);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> deleteByMovieId(int movieId) async {
    try {
      await datasource.deleteByMovieId(movieId);
      return right(null);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
