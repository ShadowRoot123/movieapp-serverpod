import 'package:movieapp_client/movieapp_client.dart';
import 'package:movieapp_flutter/core/error/exception.dart';
import 'package:movieapp_flutter/features/auth/data/models/user_model.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

abstract interface class AuthDataSource {
  UserModel? currentUser();

  Future<UserModel> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<void> logout();
}

class AuthDatasourceImpl implements AuthDataSource {
  final Client client;
  final SessionManager sessionManager;

  AuthDatasourceImpl(this.client, this.sessionManager);

  @override
  Future<UserModel> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final result =
          await client.modules.auth.email.authenticate(email, password);

      if (!result.success) {
        throw ServerException(result.failReason.toString());
      }
      if (result.userInfo == null) {
        throw ServerException("User not found");
      }
      if (result.key == null || result.keyId == null) {
        throw ServerException("Key or keyid not found");
      }
      if (result.userInfo!.id == null) {
        throw ServerException("User id not found");
      }

      await sessionManager.registerSignedInUser(
          result.userInfo!, result.keyId!, result.key!);

      return UserModel(
          id: result.userInfo!.id!,
          username: result.userInfo!.userName!,
          email: result.userInfo!.email!);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  UserModel? currentUser() {
    final user = sessionManager.signedInUser;
    if (user != null && user.id != null && user.email != null) {
      return UserModel(
          id: user.id!, username: user.userName!, email: user.email!);
    }
    return null;
  }

  @override
  Future<void> logout() async {
    try {
      await sessionManager.signOutAllDevices();
    } catch (e) {
      throw ServerException("Logout failed: ${e.toString()}");
    }
  }
}
