import 'package:reservation_client/presentation/router/rourter.gr.dart';
import 'package:auto_route/auto_route.dart';

@AutoRouterConfig(replaceInRouteName: 'Page')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
            initial: true,
            page: InitPageRoute.page,
            path: '/init-page',
            // guards: [AuthGuard()],
          ),
        AutoRoute(
            page: StartAppPageRoute.page,
            path: '/start-app-page',
            // guards: [AuthGuard()],
          ),
        AutoRoute(
            page: HomePageRoute.page,
            path: '/home-page',
            // guards: [AuthGuard()],
          ),
        AutoRoute(
            page: LoginPageRoute.page,
            path: '/login-page',
            // guards: [AuthGuard()],
          ),
        AutoRoute(
            page: RegisterPageRoute.page,
            path: '/register-page',
            // guards: [AuthGuard()],
          ),
      ];
}
