class AppException implements Exception {
  AppException([this.message, this.code]);

  final String? message;
  final String? code;

  @override
  String toString() {
    final Object? message = this.message;
    if (message == null) return 'Exception';
    return '$message';
  }
}
