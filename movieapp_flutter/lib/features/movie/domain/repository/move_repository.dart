import 'package:fpdart/fpdart.dart';
import 'package:movieapp_client/movieapp_client.dart';
import 'package:movieapp_flutter/core/error/failure.dart';

abstract interface class MovieRepository {
  Future<Either<Failure, List<Movie>>> list();
  Future<Either<Failure, Movie>> retrive(int id);
  Future<Either<Failure, Movie>> save(Movie move);
  Future<Either<Failure, void>> delete(int id);
}
