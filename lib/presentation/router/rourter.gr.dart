// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/material.dart' as _i15;
import 'package:reservation_client/domain/entities/category/category_entity.dart'
    as _i16;
import 'package:reservation_client/presentation/pages/auth/login_page.dart'
    as _i9;
import 'package:reservation_client/presentation/pages/auth/register_page.dart'
    as _i11;
import 'package:reservation_client/presentation/pages/auth/user_info_page.dart'
    as _i13;
import 'package:reservation_client/presentation/pages/categories/add_category_page.dart'
    as _i1;
import 'package:reservation_client/presentation/pages/categories/categories_page.dart'
    as _i2;
import 'package:reservation_client/presentation/pages/categories/edit_category.dart'
    as _i6;
import 'package:reservation_client/presentation/pages/common/category_menu_page.dart'
    as _i3;
import 'package:reservation_client/presentation/pages/common/confirmed_page.dart'
    as _i4;
import 'package:reservation_client/presentation/pages/common/init_page.dart'
    as _i8;
import 'package:reservation_client/presentation/pages/common/start_app_page.dart'
    as _i12;
import 'package:reservation_client/presentation/pages/home/home_page.dart'
    as _i7;
import 'package:reservation_client/presentation/pages/menus/menus_page.dart'
    as _i10;
import 'package:reservation_client/presentation/pages/reservation/create_reservation_page.dart'
    as _i5;

abstract class $AppRouter extends _i14.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    AddCategoryPageRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddCategoryPage(),
      );
    },
    CategoriesPageRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CategoriesPage(),
      );
    },
    CategoryMenusPageRoute.name: (routeData) {
      final args = routeData.argsAs<CategoryMenusPageRouteArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.CategoryMenusPage(
          key: args.key,
          id: args.id,
          categoryName: args.categoryName,
        ),
      );
    },
    ConfirmedPageRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ConfirmedPage(),
      );
    },
    CreateReservationPageRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.CreateReservationPage(),
      );
    },
    EditCategoryPageRoute.name: (routeData) {
      final args = routeData.argsAs<EditCategoryPageRouteArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.EditCategoryPage(
          key: args.key,
          categoryEntity: args.categoryEntity,
        ),
      );
    },
    HomePageRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.HomePage(),
      );
    },
    InitPageRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.InitPage(),
      );
    },
    LoginPageRoute.name: (routeData) {
      final args = routeData.argsAs<LoginPageRouteArgs>(
          orElse: () => const LoginPageRouteArgs());
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.LoginPage(key: args.key),
      );
    },
    MenusPageRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.MenusPage(),
      );
    },
    RegisterPageRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterPageRouteArgs>(
          orElse: () => const RegisterPageRouteArgs());
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.RegisterPage(key: args.key),
      );
    },
    StartAppPageRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.StartAppPage(),
      );
    },
    UserProfilePageRoute.name: (routeData) {
      final args = routeData.argsAs<UserProfilePageRouteArgs>(
          orElse: () => const UserProfilePageRouteArgs());
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.UserProfilePage(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.AddCategoryPage]
class AddCategoryPageRoute extends _i14.PageRouteInfo<void> {
  const AddCategoryPageRoute({List<_i14.PageRouteInfo>? children})
      : super(
          AddCategoryPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddCategoryPageRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CategoriesPage]
class CategoriesPageRoute extends _i14.PageRouteInfo<void> {
  const CategoriesPageRoute({List<_i14.PageRouteInfo>? children})
      : super(
          CategoriesPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoriesPageRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i3.CategoryMenusPage]
class CategoryMenusPageRoute
    extends _i14.PageRouteInfo<CategoryMenusPageRouteArgs> {
  CategoryMenusPageRoute({
    _i15.Key? key,
    required String id,
    required String categoryName,
    List<_i14.PageRouteInfo>? children,
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

  static const _i14.PageInfo<CategoryMenusPageRouteArgs> page =
      _i14.PageInfo<CategoryMenusPageRouteArgs>(name);
}

class CategoryMenusPageRouteArgs {
  const CategoryMenusPageRouteArgs({
    this.key,
    required this.id,
    required this.categoryName,
  });

  final _i15.Key? key;

  final String id;

  final String categoryName;

  @override
  String toString() {
    return 'CategoryMenusPageRouteArgs{key: $key, id: $id, categoryName: $categoryName}';
  }
}

/// generated route for
/// [_i4.ConfirmedPage]
class ConfirmedPageRoute extends _i14.PageRouteInfo<void> {
  const ConfirmedPageRoute({List<_i14.PageRouteInfo>? children})
      : super(
          ConfirmedPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ConfirmedPageRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i5.CreateReservationPage]
class CreateReservationPageRoute extends _i14.PageRouteInfo<void> {
  const CreateReservationPageRoute({List<_i14.PageRouteInfo>? children})
      : super(
          CreateReservationPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateReservationPageRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i6.EditCategoryPage]
class EditCategoryPageRoute
    extends _i14.PageRouteInfo<EditCategoryPageRouteArgs> {
  EditCategoryPageRoute({
    _i15.Key? key,
    required _i16.CategoryEntity categoryEntity,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          EditCategoryPageRoute.name,
          args: EditCategoryPageRouteArgs(
            key: key,
            categoryEntity: categoryEntity,
          ),
          initialChildren: children,
        );

  static const String name = 'EditCategoryPageRoute';

  static const _i14.PageInfo<EditCategoryPageRouteArgs> page =
      _i14.PageInfo<EditCategoryPageRouteArgs>(name);
}

class EditCategoryPageRouteArgs {
  const EditCategoryPageRouteArgs({
    this.key,
    required this.categoryEntity,
  });

  final _i15.Key? key;

  final _i16.CategoryEntity categoryEntity;

  @override
  String toString() {
    return 'EditCategoryPageRouteArgs{key: $key, categoryEntity: $categoryEntity}';
  }
}

/// generated route for
/// [_i7.HomePage]
class HomePageRoute extends _i14.PageRouteInfo<void> {
  const HomePageRoute({List<_i14.PageRouteInfo>? children})
      : super(
          HomePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomePageRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i8.InitPage]
class InitPageRoute extends _i14.PageRouteInfo<void> {
  const InitPageRoute({List<_i14.PageRouteInfo>? children})
      : super(
          InitPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'InitPageRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i9.LoginPage]
class LoginPageRoute extends _i14.PageRouteInfo<LoginPageRouteArgs> {
  LoginPageRoute({
    _i15.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          LoginPageRoute.name,
          args: LoginPageRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginPageRoute';

  static const _i14.PageInfo<LoginPageRouteArgs> page =
      _i14.PageInfo<LoginPageRouteArgs>(name);
}

class LoginPageRouteArgs {
  const LoginPageRouteArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'LoginPageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i10.MenusPage]
class MenusPageRoute extends _i14.PageRouteInfo<void> {
  const MenusPageRoute({List<_i14.PageRouteInfo>? children})
      : super(
          MenusPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'MenusPageRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i11.RegisterPage]
class RegisterPageRoute extends _i14.PageRouteInfo<RegisterPageRouteArgs> {
  RegisterPageRoute({
    _i15.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          RegisterPageRoute.name,
          args: RegisterPageRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'RegisterPageRoute';

  static const _i14.PageInfo<RegisterPageRouteArgs> page =
      _i14.PageInfo<RegisterPageRouteArgs>(name);
}

class RegisterPageRouteArgs {
  const RegisterPageRouteArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'RegisterPageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i12.StartAppPage]
class StartAppPageRoute extends _i14.PageRouteInfo<void> {
  const StartAppPageRoute({List<_i14.PageRouteInfo>? children})
      : super(
          StartAppPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'StartAppPageRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i13.UserProfilePage]
class UserProfilePageRoute
    extends _i14.PageRouteInfo<UserProfilePageRouteArgs> {
  UserProfilePageRoute({
    _i15.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          UserProfilePageRoute.name,
          args: UserProfilePageRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'UserProfilePageRoute';

  static const _i14.PageInfo<UserProfilePageRouteArgs> page =
      _i14.PageInfo<UserProfilePageRouteArgs>(name);
}

class UserProfilePageRouteArgs {
  const UserProfilePageRouteArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'UserProfilePageRouteArgs{key: $key}';
  }
}
