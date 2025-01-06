// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;
import 'package:reservation_client/presentation/pages/auth/login_page.dart'
    as _i7;
import 'package:reservation_client/presentation/pages/auth/register_page.dart'
    as _i9;
import 'package:reservation_client/presentation/pages/auth/user_info_page.dart'
    as _i11;
import 'package:reservation_client/presentation/pages/categories/categories_page.dart'
    as _i1;
import 'package:reservation_client/presentation/pages/common/category_menu_page.dart'
    as _i2;
import 'package:reservation_client/presentation/pages/common/confirmed_page.dart'
    as _i3;
import 'package:reservation_client/presentation/pages/common/init_page.dart'
    as _i6;
import 'package:reservation_client/presentation/pages/common/start_app_page.dart'
    as _i10;
import 'package:reservation_client/presentation/pages/home/home_page.dart'
    as _i5;
import 'package:reservation_client/presentation/pages/menus/menus_page.dart'
    as _i8;
import 'package:reservation_client/presentation/pages/reservation/create_reservation_page.dart'
    as _i4;

abstract class $AppRouter extends _i12.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    CategoriesPageRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CategoriesPage(),
      );
    },
    CategoryMenusPageRoute.name: (routeData) {
      final args = routeData.argsAs<CategoryMenusPageRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.CategoryMenusPage(
          key: args.key,
          id: args.id,
          categoryName: args.categoryName,
        ),
      );
    },
    ConfirmedPageRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ConfirmedPage(),
      );
    },
    CreateReservationPageRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.CreateReservationPage(),
      );
    },
    HomePageRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomePage(),
      );
    },
    InitPageRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.InitPage(),
      );
    },
    LoginPageRoute.name: (routeData) {
      final args = routeData.argsAs<LoginPageRouteArgs>(
          orElse: () => const LoginPageRouteArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.LoginPage(key: args.key),
      );
    },
    MenusPageRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.MenusPage(),
      );
    },
    RegisterPageRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterPageRouteArgs>(
          orElse: () => const RegisterPageRouteArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.RegisterPage(key: args.key),
      );
    },
    StartAppPageRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.StartAppPage(),
      );
    },
    UserProfilePageRoute.name: (routeData) {
      final args = routeData.argsAs<UserProfilePageRouteArgs>(
          orElse: () => const UserProfilePageRouteArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.UserProfilePage(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.CategoriesPage]
class CategoriesPageRoute extends _i12.PageRouteInfo<void> {
  const CategoriesPageRoute({List<_i12.PageRouteInfo>? children})
      : super(
          CategoriesPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoriesPageRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CategoryMenusPage]
class CategoryMenusPageRoute
    extends _i12.PageRouteInfo<CategoryMenusPageRouteArgs> {
  CategoryMenusPageRoute({
    _i13.Key? key,
    required String id,
    required String categoryName,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          CategoryMenusPageRoute.name,
          args: CategoryMenusPageRouteArgs(
            key: key,
            id: id,
            categoryName: categoryName,
          ),
          initialChildren: children,
        );

  static const String name = 'CategoryMenusPageRoute';

  static const _i12.PageInfo<CategoryMenusPageRouteArgs> page =
      _i12.PageInfo<CategoryMenusPageRouteArgs>(name);
}

class CategoryMenusPageRouteArgs {
  const CategoryMenusPageRouteArgs({
    this.key,
    required this.id,
    required this.categoryName,
  });

  final _i13.Key? key;

  final String id;

  final String categoryName;

  @override
  String toString() {
    return 'CategoryMenusPageRouteArgs{key: $key, id: $id, categoryName: $categoryName}';
  }
}

/// generated route for
/// [_i3.ConfirmedPage]
class ConfirmedPageRoute extends _i12.PageRouteInfo<void> {
  const ConfirmedPageRoute({List<_i12.PageRouteInfo>? children})
      : super(
          ConfirmedPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ConfirmedPageRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i4.CreateReservationPage]
class CreateReservationPageRoute extends _i12.PageRouteInfo<void> {
  const CreateReservationPageRoute({List<_i12.PageRouteInfo>? children})
      : super(
          CreateReservationPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateReservationPageRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i5.HomePage]
class HomePageRoute extends _i12.PageRouteInfo<void> {
  const HomePageRoute({List<_i12.PageRouteInfo>? children})
      : super(
          HomePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomePageRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i6.InitPage]
class InitPageRoute extends _i12.PageRouteInfo<void> {
  const InitPageRoute({List<_i12.PageRouteInfo>? children})
      : super(
          InitPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'InitPageRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i7.LoginPage]
class LoginPageRoute extends _i12.PageRouteInfo<LoginPageRouteArgs> {
  LoginPageRoute({
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          LoginPageRoute.name,
          args: LoginPageRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginPageRoute';

  static const _i12.PageInfo<LoginPageRouteArgs> page =
      _i12.PageInfo<LoginPageRouteArgs>(name);
}

class LoginPageRouteArgs {
  const LoginPageRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'LoginPageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i8.MenusPage]
class MenusPageRoute extends _i12.PageRouteInfo<void> {
  const MenusPageRoute({List<_i12.PageRouteInfo>? children})
      : super(
          MenusPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'MenusPageRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i9.RegisterPage]
class RegisterPageRoute extends _i12.PageRouteInfo<RegisterPageRouteArgs> {
  RegisterPageRoute({
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          RegisterPageRoute.name,
          args: RegisterPageRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'RegisterPageRoute';

  static const _i12.PageInfo<RegisterPageRouteArgs> page =
      _i12.PageInfo<RegisterPageRouteArgs>(name);
}

class RegisterPageRouteArgs {
  const RegisterPageRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'RegisterPageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i10.StartAppPage]
class StartAppPageRoute extends _i12.PageRouteInfo<void> {
  const StartAppPageRoute({List<_i12.PageRouteInfo>? children})
      : super(
          StartAppPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'StartAppPageRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i11.UserProfilePage]
class UserProfilePageRoute
    extends _i12.PageRouteInfo<UserProfilePageRouteArgs> {
  UserProfilePageRoute({
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          UserProfilePageRoute.name,
          args: UserProfilePageRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'UserProfilePageRoute';

  static const _i12.PageInfo<UserProfilePageRouteArgs> page =
      _i12.PageInfo<UserProfilePageRouteArgs>(name);
}

class UserProfilePageRouteArgs {
  const UserProfilePageRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'UserProfilePageRouteArgs{key: $key}';
  }
}
