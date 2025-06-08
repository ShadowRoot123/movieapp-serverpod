import 'package:movieapp_client/movieapp_client.dart';
import 'package:movieapp_flutter/core/error/exception.dart';

abstract interface class MovieDetailDatasource {
  Future<MovieDetail?> getByMovieId(int movieId);
  Future<MovieDetail> save(MovieDetail detail);
  Future<void> deleteByMovieId(int movieId);
}

class MovieDetailDatasourceImpl implements MovieDetailDatasource {
  final Client client;

  MovieDetailDatasourceImpl(this.client);

  @override
  Future<MovieDetail?> getByMovieId(int movieId) async {
    try {
      return await client.movieDetail.getByMovieId(movieId);
    } catch (e) {
      throw ServerException('Failed to fetch movie detail: ${e.toString()}');
    }
  }

  @override
  Future<MovieDetail> save(MovieDetail detail) async {
    try {
      final result = await client.movieDetail.save(detail);
      return result;
    } catch (e) {
      throw ServerException('Failed to save movie detail: ${e.toString()}');
    }
  }

  @override
  Future<void> deleteByMovieId(int movieId) async {
    try {
      await client.movieDetail.deleteByMovieId(movieId);
    } catch (e) {
      throw ServerException('Failed to delete movie detail: ${e.toString()}');
    }
  }
}
