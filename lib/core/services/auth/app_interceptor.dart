import 'package:dio/dio.dart';
import '../injectables/locator.dart';
import '../localDB/local_db_service.dart';

class AppInterceptor extends Interceptor {
  String? accessToken;
  final Dio dio;
  bool isRefreshing = false;
  List<Function> failedQueue = [];

  AppInterceptor({required this.dio});
  

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String? localDBAccessToken =
        locator<LocalDBService>().getUser()?.accessToken;

    accessToken = localDBAccessToken;
    if (accessToken != null) {
      options.headers['Authorization'] = "Bearer $accessToken";
    }
    options.headers["Accept-Language"] = 'en';

    super.onRequest(options, handler);
  }
}
