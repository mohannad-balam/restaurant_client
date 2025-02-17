import 'package:fk_user_agent/fk_user_agent.dart';
import 'package:reservation_client/core/services/interceptors/logging_interceptor.dart';
import '../../../core/enums/http_methods.dart';
import '../../../core/enums/platforms.dart';
import '../auth/app_interceptor.dart';
import '../../utils/helpers/helpers.dart';
import 'package:dio/dio.dart';

/// Helper service that abstracts away common HTTP Requests
class HttpService {
  final _dio = Dio();

  Future<void> init() async {
    if (HelpUtils.checkPlatform([PlatformsEnum.Android, PlatformsEnum.IOS])) {
      await FkUserAgent.init();

      _dio.options.headers['User-Agent'] = FkUserAgent.userAgent!;
    }

    _dio.interceptors.add(
      LoggerInterceptor(),
    );
    _dio.interceptors.add(
      AppInterceptor(
        dio: _dio,
      ),
    );
  }

  Future<dynamic> request(
      HttpMethods httpMethod, String route, Map<String, dynamic>? parameters,
      [Map<String, dynamic> headers = const {}]) async {
    late Response response;

    headers.forEach((key, value) => _dio.options.headers[key] = value);
    _dio.options.headers['content-Type'] = 'application/json';

    try {
      if (httpMethod == HttpMethods.GET) {
        response = await _dio.get(
          route,
          data: parameters,
          queryParameters: parameters,
        );
      } else if (httpMethod == HttpMethods.POST) {
        response = await _dio.post(
          route,
          data: parameters,
          queryParameters: parameters,
        );
      } else if (httpMethod == HttpMethods.PUT) {
        response = await _dio.put(
          route,
          data: parameters,
          queryParameters: parameters,
        );
      } else if (httpMethod == HttpMethods.DELETE) {
        response = await _dio.delete(
          route,
        );
      }
    } on DioException {
      rethrow;
    }
    return response.data;
  }

  void dispose() {
    _dio.close(force: true);
  }
}
