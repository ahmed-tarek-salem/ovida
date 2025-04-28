import 'package:dio/dio.dart';
import 'package:ovida/src/core/extensions/hardcoded.dart';

import '../shared/models/app_error_model.dart';
import 'app_logger.dart';

class ErrorHandler {
  static AppError handleError(Object? error) {
    appLogger.e(error.toString());
    if (error.runtimeType == DioException) {
      switch ((error as DioException).type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return AppError('Connection Timeout'.hardCoded, ErrorType.network);
        case DioExceptionType.badResponse:
          return AppError.serverErrorParse(error);
        case DioExceptionType.cancel:
          return AppError('Request Cancelled'.hardCoded, ErrorType.network);
        case DioExceptionType.unknown:
        default:
          return AppError('Unexpected Error'.hardCoded, ErrorType.unknown);
      }
    } else {
      return AppError(error.toString(), ErrorType.unknown);
    }
  }
}
