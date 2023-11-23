import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:store_project/common/network/dio_interceptor.dart';

class DioClient {
  final _dio = Dio();

  DioClient() {
    _dio.interceptors.add(PrettyDioLogger());
    _dio.interceptors.add(DioInterceptor());
  }

  Dio get dio => _dio;
}
