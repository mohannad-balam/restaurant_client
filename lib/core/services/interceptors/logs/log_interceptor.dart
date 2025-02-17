import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../../utils/helpers/helpers.dart';
import '../../injectables/locator.dart';
import 'package:logger/logger.dart';

class LoggerInterceptor extends Interceptor {
  final _logger = locator<Logger>();
  LoggerInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      final String lastSegment =
          HelpUtils.urlLastSegment(options.path).toUpperCase();
      _logger.w(
          '====================================== REQUEST FOR $lastSegment ==========================================');
      _logger.i("Method: ${options.method}");
      _logger.i("Request URL: ${options.uri}");
      _logger.i("Request Headers: ${options.headers}");
      _logger.i("Request Query Parameters: ${options.queryParameters}");
      _logger.i("Request Body: ${options.data}");
      _logger.i("Request Timeout: ${options.connectTimeout} ms");
      _logger.w(
          '==================================== END REQUEST FOR $lastSegment ========================================');
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      final String lastSegment =
          HelpUtils.urlLastSegment(response.realUri.toString()).toUpperCase();
      _logger.w(
          '====================================== RESPONSE FOR $lastSegment ==========================================');
      _logger.i("Status Code: ${response.statusCode}");
      _logger.i("URL: ${response.requestOptions.uri}");
      _logger.i("Headers: ${response.headers}");
      _logger.i("Response Data: ${response.data}");
      _logger.w(
          '==================================== END RESPONSE FOR $lastSegment ========================================');
    }

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (kDebugMode) {
      final String lastSegment =
          HelpUtils.urlLastSegment(err.requestOptions.path).toUpperCase();
      _logger.w(
          '====================================== ERROR FOR $lastSegment ==========================================');
      _logger.e("Error Message: ${err.message}");
      _logger.e("URL: ${err.requestOptions.uri}");
      _logger.e("Error Status Code: ${err.response?.statusCode}");
      _logger.e("Error Data: ${err.response?.data}");
      _logger.e("Headers: ${err.requestOptions.headers}");
      _logger.e(
          '==================================== END ERROR FOR $lastSegment ========================================');
    }

    super.onError(err, handler);
  }
}
