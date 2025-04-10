import 'either.dart';
import 'failure.dart';

class Response<T> extends Either<T, Failure> {
  Response.left(super.left) : super.left();

  Response.right(super.right) : super.right();
}
