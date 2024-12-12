class APIRequest {
  final String apiPath;
  final dynamic savePath;
  final Map<String, dynamic>? body;
  Map<String, String>? headers;
  final Map<String, dynamic>? queryParams;
  final List<String>? files;
  final String? xApiKey;
  final String? fileName;
  final bool isFiles;
  final bool isXApiKeyRequired;
  final bool isHeadersRequired;
  final bool isEncryptionApplied;
  final bool isContentTypeRequired;
  final bool isAuthorizationRequired;
  final bool isRefreshTokenRequired;
  final bool isJsonDecode;
  final bool isSnackBar;

  APIRequest({
    required this.apiPath,
    this.savePath,
    this.xApiKey,
    this.body,
    this.headers,
    this.queryParams,
    this.files,
    this.fileName,
    this.isFiles = false,
    this.isHeadersRequired = true,
    this.isXApiKeyRequired = false,
    this.isEncryptionApplied = true,
    this.isContentTypeRequired = true,
    this.isAuthorizationRequired = true,
    this.isRefreshTokenRequired = false,
    this.isJsonDecode = false,
    this.isSnackBar = true,
  });
}
