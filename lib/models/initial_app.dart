class InitailApp {
  final String appName;
  final String appVersion;
  final String apiGateway;

  InitailApp({
    required this.appName,
    required this.appVersion,
    required this.apiGateway,
  });
}

class ApiResponse {
  dynamic status;
  dynamic data;
  dynamic message;

  ApiResponse({
    this.status,
    this.data,
    this.message,
  });

  factory ApiResponse.fromJson(dynamic json) {
    return ApiResponse(
      status: json['status'],
      data: json['data'],
      message: json['message'],
    );
  }
}
