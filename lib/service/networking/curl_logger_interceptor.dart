// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class CurlLoggerInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (kDebugMode) {
      final curlCommand = await _generateCurlCommand(options);
      log(curlCommand, name: 'CURL');
    }
    handler.next(options); // continue
  }

  Future<String> _generateCurlCommand(RequestOptions options) async {
    final curl = StringBuffer('curl');

    // Method
    curl.write(' --method ${options.method}');

    // Headers
    options.headers.forEach((key, value) {
      if (key == Headers.contentTypeHeader) {
        value = (value as String).split(';')[0];
      }
      curl.write(' --header "$key: $value"');
    });

    // Data
    if (options.data != null) {
      // Encoded Body
      if (options.data is Map) {
        options.data.forEach((key, value) {
          curl.write(' --data-urlencode "$key=$value"');
        });
      } else if (options.data is FormData) {
        options.data.fields.forEach((field) {
          curl.write(' --data-urlencode "${field.key}=${field.value}"');
        });
      } else {
        curl.write(' --data "${options.data}"');
      }
    }

    // URL
    curl.write(' --location "${options.uri.toString()}"');

    return curl.toString();
  }
}
