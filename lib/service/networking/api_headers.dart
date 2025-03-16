import 'package:food_app/service/networking/api_requests.dart';

import '../shared_pref.dart';

abstract class APIHeaders {
  static Future<Map<String, String>?> getHeaders(APIRequest request) async {
    Map<String, String>? headers;
    final mob = await SharedPref.getString(SharedPref.userLogin);
    if (request.isHeadersRequired) {
      headers = {
        if (request.isContentTypeRequired)
          'Content-Type': _getContentType(request),
        'p1': '$mob',
        'p2': 'android',
        'p3': '1.1',
        ...?request.headers
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
