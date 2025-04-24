import 'package:fpdart/fpdart.dart';
import 'package:movieapp_client/movieapp_client.dart';
import 'package:movieapp_flutter/core/error/exception.dart';
import 'package:movieapp_flutter/core/error/failure.dart';
import 'package:movieapp_flutter/features/movie/data/datasources/move_datasource.dart';
import 'package:movieapp_flutter/features/movie/domain/repository/move_repository.dart';

class MoveRepositoryImpl implements MovieRepository {
  final MovieDatasource datasource;

  MoveRepositoryImpl(this.datasource);
  @override
  Future<Either<Failure, List<Movie>>> list() async {
    try {
      return right(await datasource.list());
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Movie>> retrive(int id) async {
    try {
      return right(await datasource.retrive(id));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
