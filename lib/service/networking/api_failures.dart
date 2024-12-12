abstract class APIFailure {
  String message;
  APIFailure(this.message);
}

class InternalErrorFailure extends APIFailure {
  InternalErrorFailure(super.message);
}

class NetworkFailure extends APIFailure {
  NetworkFailure(super.message);
}

class BadRequestFailure extends APIFailure {
  BadRequestFailure(super.message);
}

class UnauthorisedFailure extends APIFailure {
  UnauthorisedFailure(super.message);
}

class NotFoundFailure extends APIFailure {
  NotFoundFailure(super.message);
}

class NullDataFailure extends APIFailure {
  NullDataFailure(super.message);
}
