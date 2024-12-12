// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:io';

import 'package:dio/dio.dart';

import '../../utils/constant/string_constants.dart';
import 'api_exception.dart';
import 'api_requests.dart';

Future<T?> handleResponse<T>(APIRequest request, Function() body) async {
  try {
    final response = await body() as Response;

    final statusCode = response.statusCode ?? 0;
    if (statusCode >= 401 && statusCode <= 403) {
      throw UnauthorisedException(_errDecoder(response));
    }

    if (response.statusMessage?.toLowerCase().contains('socketexception') ??
        false) {
      throw NetworkException();
    }

    switch (response.statusCode) {
      case 200:
      case 201:
      case 202:
        return response.data as T;
      case 204:
        break;
      case 400:
      case 422:
        throw BadRequestException(_errDecoder(response));
      case 401:
      case 403:
        throw UnauthorisedException(_errDecoder(response));
      case 404:
        throw NotFoundException(_errDecoder(response));
      case 500:
      default:
        throw InternalErrorException(_errDecoder(response));
    }
  } catch (_) {
    throw _catchError(_);
  }

  return null;
}

String _catchError(Object? exp) {
  try {
    if (exp is DioException) {
      if (exp.response != null) {
        if ((exp.response?.statusCode ?? 0) >= 401 &&
            (exp.response?.statusCode ?? 0) <= 403) {
          return StringConstant.unauthorisedExceptionMessage;
        }

        return ((exp.response?.data?["msg"]) ??
                (exp.response?.data?["message"]) ??
                StringConstant.internalErrorExceptionMessage)
            .toString();
      } else if (exp.error != null) {
        if (exp.error is SocketException) {
          return StringConstant.networkExceptionMessage;
        }
        return (exp.error ?? StringConstant.internalErrorExceptionMessage)
            .toString();
      } else if (exp.message?.isNotEmpty ?? false) {
        if ((((exp.message ?? '').toString()).toLowerCase())
            .contains('the request connection took longer than')) {
          return StringConstant.timeOutExceptionMessage;
        }
        return exp.message ?? StringConstant.internalErrorExceptionMessage;
      }
    }
  } catch (_) {}

  return StringConstant.internalErrorExceptionMessage;
}

String _errDecoder(Response response) {
  try {
    if (response.data == 'null' ||
        response.data == '' ||
        response.data == null) {
      return "No Response";
    } else if ((response.data as Map<String, dynamic>?) != null) {
      return _mapTypeOfErrorDecoder(response);
    } else if ((response.statusMessage == null) == false) {
      return response.statusMessage!;
    } else {
      return response.statusMessage ??
          StringConstant.internalErrorExceptionMessage;
    }
  } catch (_) {}

  return StringConstant.internalErrorExceptionMessage;
}

String _mapTypeOfErrorDecoder(Response response) {
  try {
    if (response.data != null) {
      final body = response.data as Map<String, dynamic>?;

      if (body != null && body.isNotEmpty) {
        if (body.containsKey("message") && body["message"] != null) {
          final bdy = body["message"] as String?;

          if (bdy != null && bdy.isNotEmpty) {
            return bdy;
          }
        } else if (body.containsKey("error") && body["error"] != null) {
          final _err = body["error"] as String?;

          if (_err != null && _err.isNotEmpty && _err.toLowerCase() != 'null') {
            return _err;
          }
        } else if (body.containsKey("exception") && body["exception"] != null) {
          final expObj = body["exception"] as Map<String, dynamic>?;

          if (expObj != null &&
              expObj.isNotEmpty &&
              expObj.containsKey('error') &&
              expObj['error'] != null) {
            final err = expObj["error"] as Map<String, dynamic>?;

            if (err != null &&
                err.isNotEmpty &&
                err.containsKey('description') &&
                err['description'] != null) {
              final desc = err['description'] as String?;

              if (desc != null && desc.isNotEmpty) {
                return desc;
              }
            }
          }
        } else if (body.containsKey("data") && body["data"] != null) {
          final bodyData = body["data"] as Map<String, dynamic>?;

          if (bodyData != null &&
              bodyData.isNotEmpty &&
              bodyData.containsKey("message") &&
              bodyData["message"] != null) {
            final msg = bodyData["message"] as String?;

            if (msg != null && msg.isNotEmpty && msg.toLowerCase() != 'null') {
              return msg;
            }
          }
        }
      }
    }
  } catch (_) {}

  return StringConstant.internalErrorExceptionMessage;
}
