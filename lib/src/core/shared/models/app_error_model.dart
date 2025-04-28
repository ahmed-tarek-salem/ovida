import 'package:dio/dio.dart';

class AppError {
  final String message;
  final ErrorType type;
  final int? statusCode;

  AppError(this.message, this.type, {this.statusCode});

  @override
  String toString() =>
      'AppError(message: $message, type: $type, statusCode: $statusCode)';

  /// This consructor is used when the error comes from server (bad response).
  ///
  /// Here you can update it to handle server errors, according to the error model
  /// comes from back end.
  factory AppError.serverErrorParse(DioException error) {
    final serverMessage = error.response?.data['message'];
    return AppError("Server error: $serverMessage", ErrorType.server,
        statusCode: error.response?.statusCode);
  }
}

enum ErrorType {
  network,
  server,
  validation,
  unknown,
}
