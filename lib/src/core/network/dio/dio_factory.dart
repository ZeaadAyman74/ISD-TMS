import 'package:dio/dio.dart';
import 'package:isd_tms/src/core/network/constants/api_constants.dart';
import 'package:isd_tms/src/core/network/constants/end_points.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'dio_interceptor.dart';

class DioFactory {
  DioFactory._();
  static Dio? _dio;

  static Dio getDio() {
    if (_dio == null) {
      _dio = Dio();
      _dio!.options = BaseOptions(
        baseUrl: EndPoints.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          ApiConstants.contentType: ApiConstants.applicationJson,
          ApiConstants.accept: ApiConstants.applicationJson,
        },
      );
      _dio!.interceptors.addAll([
        DioInterceptor(),
        PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseHeader: true,
        ),
      ]);
    }
    return _dio!;
  }
}
