class Failure {
  const Failure({required this.errorMessage});

  final String errorMessage;

  @override
  String toString() => errorMessage;
}