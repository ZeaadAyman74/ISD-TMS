import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:isd_tms/src/core/helpers/hive/hive_utils.dart';
import 'package:isd_tms/src/core/helpers/shared_pref/shared_pref_utils.dart';
import 'package:isd_tms/src/core/network/constants/api_constants.dart';
import 'package:isd_tms/src/core/router/router.main.dart';

class DioInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = HiveUtils.token;
    if (token != null && token.isNotEmpty) {
      options.headers[ApiConstants.authorization] =
          '${ApiConstants.bearer} $token';
    }
    options.headers[ApiConstants.accept] = ApiConstants.applicationJson;
    options.headers[ApiConstants.contentType] = ApiConstants.applicationJson;
    options.queryParameters['lang']=SharedPrefUtils.locale;
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('Response: ${response.statusCode} ${response.requestOptions.uri}');
    super.onResponse(response, handler);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      await _performLogout();
    }
    super.onError(err, handler);
  }

  Future<void> _performLogout() async {
    await HiveUtils.resetUserCache();
    AppRouter.navigatorKey.currentState?.pushNamedAndRemoveUntil(
      Routes.login,
      (route) => false,
    );
  }
}
