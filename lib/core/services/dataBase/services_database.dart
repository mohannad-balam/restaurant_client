// import 'package:dio/dio.dart';
// import '../localDB/local_db_service.dart';
// import '../injectables/locator.dart';

// class ServicesDataBaseInterceptor extends Interceptor {
//   String? accessToken;
//   final Dio dio;
//   bool isRefreshing = false;
//   List<Function> failedQueue = [];

//   ServicesDataBaseInterceptor({required this.dio});

//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     String? localDBAccessToken =
//         locator<LocalDBService>().getUser()?.accessToken;
//     String? localLanguage = locator<LocalDBService>().getSettings().local;

//     accessToken = localDBAccessToken;
//     if (accessToken != null) {
//       options.headers['Authorization'] = "Bearer $accessToken";
//     }
//     options.headers["Accept-Language"] = localLanguage;

//     super.onRequest(options, handler);
//   }
// }
