import 'package:reservation_client/presentation/router/rourter.gr.dart';
import 'package:auto_route/auto_route.dart';

import '../../core/common/guards/auth_guard.dart';

@AutoRouterConfig(replaceInRouteName: 'Page')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: InitPageRoute.page,
          path: '/init-page',
        ),
        AutoRoute(
          page: StartAppPageRoute.page,
          path: '/start-app-page',
        ),
        AutoRoute(
          page: HomePageRoute.page,
          path: '/home-page',
          guards: [AuthGuard()],
        ),
        AutoRoute(
          page: LoginPageRoute.page,
          path: '/login-page',
        ),
        AutoRoute(
          page: RegisterPageRoute.page,
          path: '/register-page',
        ),
        AutoRoute(
          page: CategoriesPageRoute.page,
          path: '/categories-page',
          guards: [AuthGuard()],
        ),
        AutoRoute(
          page: MenusPageRoute.page,
          path: '/menus-page',
          guards: [AuthGuard()],
        ),
        AutoRoute(
          page: CategoryMenusPageRoute.page,
          path: '/category-menu-page',
          guards: [AuthGuard()],
        ),
        AutoRoute(
          page: UserProfilePageRoute.page,
          path: '/user-profile-page',
          guards: [AuthGuard()],
        ),
        AutoRoute(
          page: CreateReservationPageRoute.page,
          path: '/create-reservation-page',
          guards: [AuthGuard()],
        ),
        AutoRoute(
          page: ConfirmedPageRoute.page,
          path: '/confirmed-page',
          guards: [AuthGuard()],
        ),
        AutoRoute(
          page: AddCategoryPageRoute.page,
          path: '/add-category-page',
          guards: [AuthGuard()],
        ),
      ];
}
