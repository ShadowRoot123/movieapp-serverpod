class ServerException implements Exception {
  final String message;

  ServerException([this.message = "A problem occurred with the server."]);

  @override
  String toString() {
    return 'ServerException: $message';
  }
}
