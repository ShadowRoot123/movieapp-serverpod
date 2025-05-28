import 'package:movieapp_client/movieapp_client.dart';
import 'package:movieapp_flutter/core/error/exception.dart';

abstract interface class MovieDatasource {
  Future<List<Movie>> list();
  Future<Movie> retrive(int id);
  Future<Movie> save(Movie movie);
  Future<void> delete(int id);
}

class MoveDatasourceImpl implements MovieDatasource {
  final Client client;
  // final SessionManager sessionManager;

  MoveDatasourceImpl(this.client);

  @override
  Future<List<Movie>> list() async {
    try {
      return await client.movie.list();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<Movie> retrive(int id) async {
    try {
      final result = await client.movie.retrive(id);
      if (result == null) {
        throw ServerException("Movie not found");
      }
      return result;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<Movie> save(Movie movie) async {
    try {
      final result = await client.movie.save(movie);
      if (result == null) {
        throw ServerException("Movie not found");
      }
      return result;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> delete(int id) {
    try {
      return client.movie.delete(id);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
