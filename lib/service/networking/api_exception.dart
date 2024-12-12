
import '../../utils/constant/string_constants.dart';

abstract class APIException implements Exception {
  final String message;
  APIException(this.message);

  @override
  String toString() => message;
}

class InternalErrorException extends APIException {
  InternalErrorException([String? message])
      : super(message ?? StringConstant.internalErrorExceptionMessage);
}

class TimeoutException extends APIException {
  TimeoutException([String? message])
      : super(message ?? StringConstant.timeOutExceptionMessage);
}

class NoVehicleDataException extends APIException {
  NoVehicleDataException([String? message])
      : super(message ?? StringConstant.internalErrorExceptionMessage);
}

class NetworkException extends APIException {
  NetworkException([String? message])
      : super(message ?? StringConstant.networkExceptionMessage);
}

class BadRequestException extends APIException {
  BadRequestException([String? message])
      : super(message ?? StringConstant.badRequestExceptionMessage);
}

class UnauthorisedException extends APIException {
  UnauthorisedException([String? message])
      : super(message ?? StringConstant.unauthorisedExceptionMessage);
}

class NotFoundException extends APIException {
  NotFoundException([String? message])
      : super(message ?? StringConstant.notFoundExceptionMessage);
}

class NullDataException extends APIException {
  NullDataException([String? message])
      : super(message ?? StringConstant.notFoundExceptionMessage);
}

class UploadDocsException extends APIException {
  UploadDocsException([String? message])
      : super(message ?? StringConstant.notFoundExceptionMessage);
}

class FutureDateException extends APIException {
  FutureDateException([String? message])
      : super(message ?? StringConstant.futureDateException);
}

class AppUpdateException extends APIException {
  AppUpdateException({String? message}) : super(message ?? StringConstant.appUpdateException);
}

class HdfcFormatException extends APIException {
  HdfcFormatException([String? message]) : super(message ?? StringConstant.formatException);
}

class HdfcServiceUnavailableException extends APIException {
  HdfcServiceUnavailableException([String? message])
      : super(message ?? StringConstant.serviceTemporarilyUnavailable);
}
