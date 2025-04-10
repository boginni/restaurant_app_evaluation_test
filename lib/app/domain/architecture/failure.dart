abstract class Failure implements Exception {
  const Failure(this.stackTrace);

  final StackTrace stackTrace;

  bool get isFatal;
}

class SerializationFailure extends Failure {
  const SerializationFailure(this.error, StackTrace stackTrace) : super(stackTrace);

  final Exception error;

  @override
  bool get isFatal => true;
}

class UnknownFailure extends Failure {
  factory UnknownFailure() {
    return UnknownFailure._(StackTrace.current);
  }

  const UnknownFailure._(super.stackTrace);

  @override
  bool get isFatal => true;
}
