import 'package:dio/dio.dart';

class DioInterceptor extends QueuedInterceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Accept'] = 'application/json';
    options.headers['content-type'] = 'application/json';
    options.baseUrl = "https://fakestoreapi.com";
    super.onRequest(options, handler);
  }
}
