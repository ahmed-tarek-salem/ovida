import 'package:dio/dio.dart';

import '../../utilities/app_logger.dart';

class CustomLoggerInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    appLogger.d("Method: ${options.method} -- ${options.uri}");
    // Log the request body if it's a regular request
    if (options.data != null && options.data is Map) {
      appLogger.d("Body: ${options.data}");
    } else if (options.data != null) {
      appLogger.d("Body: ${options.data.toString()}");
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    appLogger.d(
        "Response of: ${Uri.decodeComponent(response.requestOptions.uri.toString())}");
    if (response.data != null) {
      appLogger.d("Body: ${response.data}");
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    appLogger.e("Error in request to: ${err.requestOptions.uri}");
    if (err.response?.data != null) {
      appLogger.e("Error Body: ${err.response?.data}");
    }
    super.onError(err, handler);
  }
}
