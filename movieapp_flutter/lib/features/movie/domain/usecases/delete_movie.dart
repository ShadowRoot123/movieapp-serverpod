import 'package:fpdart/fpdart.dart';
import 'package:movieapp_flutter/core/error/failure.dart';
import 'package:movieapp_flutter/core/usecases/usecase.dart';
import 'package:movieapp_flutter/features/movie/domain/repository/move_repository.dart';

class DeleteMoveUsecase implements UseCase<void, DeleteMoveParams> {
  final MovieRepository repository;

  DeleteMoveUsecase(this.repository);

  @override
  Future<Either<Failure, void>> call(DeleteMoveParams params) async {
    return await repository.delete(params.id);
  }
}

class DeleteMoveParams {
  final int id;

  DeleteMoveParams({required this.id});
}
