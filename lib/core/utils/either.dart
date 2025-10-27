/// Represents a value of one of two possible types (a disjoint union).
/// Instances of [Either] are either an instance of [Left] or [Right].
/// A common use of [Either] is as an alternative to [Option] for dealing
/// with possible missing values. In this usage, [Left] is used for failure
/// and [Right] is used for success.
abstract class Either<L, R> {
  const Either();

  /// Represents the left side of [Either] class which by convention is a "Failure".
  bool get isLeft => this is Left<L, R>;

  /// Represents the right side of [Either] class which by convention is a "Success"
  bool get isRight => this is Right<L, R>;

  /// Get [Left] value, may throw an exception when the value is [Right]
  L get left {
    if (this is Left<L, R>) {
      return (this as Left<L, R>).value;
    }
    throw Exception('Illegal use. You should check isLeft before calling');
  }

  /// Get [Right] value, may throw an exception when the value is [Left]
  R get right {
    if (this is Right<L, R>) {
      return (this as Right<L, R>).value;
    }
    throw Exception('Illegal use. You should check isRight before calling');
  }

  /// Transform values of [Left] and [Right]
  Either<L2, R2> fold<L2, R2>(L2 Function(L left) fnL, R2 Function(R right) fnR) {
    if (isLeft) {
      return Left(fnL(left));
    }
    return Right(fnR(right));
  }
}

class Left<L, R> extends Either<L, R> {
  final L value;
  const Left(this.value);
}

class Right<L, R> extends Either<L, R> {
  final R value;
  const Right(this.value);
}
