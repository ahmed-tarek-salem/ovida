import 'package:dio/dio.dart';

import '../../utilities/app_logger.dart';
import 'custom_logger_interceptor.dart';

class NetworkService {
  NetworkService() {
    _init();
  }
  static final baseOptions = BaseOptions(
    baseUrl: 'https://clusterapp.net/api',
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
  );
  final Dio _dio = Dio(baseOptions);

  _init() {
    _dio.options.headers['Accept'] = 'application/json';
    _dio.options.headers['Accept-Language'] = "en";
    _dio.interceptors.add(CustomLoggerInterceptor());
  }

  void setToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
    appLogger.d("Token set to network service as $token");
  }

  void clearToken() {
    _dio.options.headers.remove('Authorization');
  }

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    return _dio.get(path, queryParameters: queryParameters);
  }

  Future<Response<T>> post<T>(String path, {Object? data}) async {
    return _dio.post<T>(path, data: data);
  }
}
