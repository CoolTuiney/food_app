import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:food_app/service/networking/api_requests.dart';

import '../../utils/constant/end_point.dart';
import 'api_response_handler.dart';
import 'api_headers.dart';

class ApiService {
  final Dio dio;

  ApiService()
      : dio = Dio(
          BaseOptions(
            baseUrl: EndPoint.localHost,
            connectTimeout: const Duration(seconds: 30),
            receiveTimeout: const Duration(seconds: 30),
          ),
        ) {}

  Future<T?> getRequest<T>(APIRequest request) async => await handleResponse(
        request,
        () async => await dio.get<T>(
          request.apiPath,
          queryParameters: request.queryParams,
          options: Options(
            headers: await APIHeaders.getHeaders(request),
          ),
        ),
      );

  Future<T?> postRequest<T>(APIRequest request) async => await handleResponse(
        request,
        () async => await dio.post<T>(
          request.apiPath,
          data: request.body,
          queryParameters: request.queryParams,
          options: Options(
            headers: await APIHeaders.getHeaders(request),
          ),
        ),
      );

  Future<T?> putRequest<T>(APIRequest request) async => await handleResponse(
        request,
        () async => await dio.put<T>(
          request.apiPath,
          data: request.body,
          queryParameters: request.queryParams,
          options: Options(
            headers: await APIHeaders.getHeaders(request),
          ),
        ),
      );

  Future<T?> patchRequest<T>(APIRequest request) async => await handleResponse(
        request,
        () async => await dio.patch<T>(
          request.apiPath,
          data: request.body,
          queryParameters: request.queryParams,
          options: Options(
            headers: await APIHeaders.getHeaders(request),
          ),
        ),
      );

  Future<T?> getDataFromJsonFile<T>(APIRequest request) async =>
      await handleResponse(
        request,
        () async {
          if (request.fileName?.isNotEmpty ?? false) {
            final response = await rootBundle.loadString(request.fileName!);

            return Response(
              statusCode: 200,
              data: await jsonDecode(response),
              requestOptions: RequestOptions(),
              statusMessage: 'success',
            );
          }

          return Response(
            statusCode: 500,
            data: request.body,
            requestOptions: RequestOptions(),
            statusMessage: 'failed',
          );
        },
      );
}
