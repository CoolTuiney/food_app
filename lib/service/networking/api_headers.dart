import 'package:food_app/service/networking/api_requests.dart';

abstract class APIHeaders {
  static Future<Map<String, String>?> getHeaders(APIRequest request) async {
    Map<String, String>? headers;

    if (request.isHeadersRequired) {
      headers = {
        if (request.isContentTypeRequired)
          'Content-Type': _getContentType(request),
      };
    }

    request.headers = headers;
    return headers;
  }

  static String _getContentType(APIRequest req) {
    if ((req.files?.isNotEmpty) ?? false) {
      return 'multipart/form-data';
    }

    return 'application/json';
  }
}
