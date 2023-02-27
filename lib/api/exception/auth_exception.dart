class AuthException implements Exception {
  AuthException([this.reason]);

  final dynamic reason;

  @override
  String toString() {
    final Object? message = reason;
    if (message == null) return 'Exception';
    return '$message';
  }
}
