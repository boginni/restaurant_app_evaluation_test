

abstract class Failure implements Exception {
  const Failure(this.stackTrace);

  final StackTrace stackTrace;

  bool get isFatal;
}

class SerializationFailure extends Failure {
  const SerializationFailure(this.error, StackTrace stackTrace)
      : super(stackTrace);

  final Exception error;

  @override
  bool get isFatal => true;
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure(super.stackTrace);

  @override
  bool get isFatal => true;
}

class UnknownFailure extends Failure {
  const UnknownFailure(this.message, super.stackTrace);

  final dynamic message;

  @override
  bool get isFatal => true;

  @override
  String toString() {
    final Object? message = this.message;

    if (message == null) {
      return 'UnknownFailure';
    }

    return 'UnknownFailure: $message';
  }
}
