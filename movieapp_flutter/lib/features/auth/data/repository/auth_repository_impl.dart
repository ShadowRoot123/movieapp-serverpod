import 'package:fpdart/src/either.dart';
import 'package:movieapp_flutter/core/entities/user.dart';
import 'package:movieapp_flutter/core/error/exception.dart';
import 'package:movieapp_flutter/core/error/failure.dart';
import 'package:movieapp_flutter/features/auth/data/datasources/auth_datasource.dart';
import 'package:movieapp_flutter/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl(this.authDataSource);

  @override
  Future<Either<Failure, User>> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final result = await authDataSource.loginWithEmailAndPassword(
          email: email, password: password);

      return right(result);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Either<Failure, User> currentUser() {
    final user = authDataSource.currentUser();

    if (user == null) {
      return left(Failure("User not found"));
    }
    return right(user);
  }

  @override
  Future<Either<Failure, User>> confirmRegistration(
      {required String email, required String verificationCode}) async {
    try {
      final user = await authDataSource.confirmRegistration(
          email: email, verificationCode: verificationCode);

      return right(user);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> registerWithEmailAndPassword(
      {required String email,
      required String password,
      required String username}) async {
    try {
      final result = await authDataSource.registerWithEmailAndPassword(
        email: email,
        password: password,
        username: username,
      );

      if (result) {
        return right(true);
      } else {
        return left(Failure("Registration failed"));
      }
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await authDataSource.logout();
      return right(null);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
