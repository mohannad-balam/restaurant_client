// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i19;
import 'package:flutter/material.dart' as _i20;
import 'package:reservation_client/domain/entities/category/category_entity.dart'
    as _i21;
import 'package:reservation_client/domain/entities/reservation/reservation_entity.dart'
    as _i22;
import 'package:reservation_client/domain/entities/table/table_entity.dart'
    as _i23;
import 'package:reservation_client/presentation/pages/auth/login_page.dart'
    as _i12;
import 'package:reservation_client/presentation/pages/auth/register_page.dart'
    as _i14;
import 'package:reservation_client/presentation/pages/auth/user_info_page.dart'
    as _i18;
import 'package:reservation_client/presentation/pages/categories/add_category_page.dart'
    as _i1;
import 'package:reservation_client/presentation/pages/categories/categories_page.dart'
    as _i3;
import 'package:reservation_client/presentation/pages/categories/edit_category.dart'
    as _i7;
import 'package:reservation_client/presentation/pages/common/category_menu_page.dart'
    as _i4;
import 'package:reservation_client/presentation/pages/common/confirmed_page.dart'
    as _i5;
import 'package:reservation_client/presentation/pages/common/init_page.dart'
    as _i11;
import 'package:reservation_client/presentation/pages/common/start_app_page.dart'
    as _i16;
import 'package:reservation_client/presentation/pages/home/home_page.dart'
    as _i10;
import 'package:reservation_client/presentation/pages/menus/menus_page.dart'
    as _i13;
import 'package:reservation_client/presentation/pages/reservation/create_reservation_page.dart'
    as _i6;
import 'package:reservation_client/presentation/pages/reservation/edit_reservation_page.dart'
    as _i8;
import 'package:reservation_client/presentation/pages/reservation/reservations_page.dart'
    as _i15;
import 'package:reservation_client/presentation/pages/tables/add_table_page.dart'
    as _i2;
import 'package:reservation_client/presentation/pages/tables/edit_table_page.dart'
    as _i9;
import 'package:reservation_client/presentation/pages/tables/tables_page.dart'
    as _i17;

abstract class $AppRouter extends _i19.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i19.PageFactory> pagesMap = {
    AddCategoryPageRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddCategoryPage(),
      );
    },
    AddTablePageRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AddTablePage(),
      );
    },
    CategoriesPageRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.CategoriesPage(),
      );
    },
    CategoryMenusPageRoute.name: (routeData) {
      final args = routeData.argsAs<CategoryMenusPageRouteArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.CategoryMenusPage(
          key: args.key,
          id: args.id,
          categoryName: args.categoryName,
        ),
      );
    },
    ConfirmedPageRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ConfirmedPage(),
      );
    },
    CreateReservationPageRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.CreateReservationPage(),
      );
    },
    EditCategoryPageRoute.name: (routeData) {
      final args = routeData.argsAs<EditCategoryPageRouteArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.EditCategoryPage(
          key: args.key,
          categoryEntity: args.categoryEntity,
        ),
      );
    },
    EditReservationPageRoute.name: (routeData) {
      final args = routeData.argsAs<EditReservationPageRouteArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.EditReservationPage(
          key: args.key,
          reservation: args.reservation,
        ),
      );
    },
    EditTablePageRoute.name: (routeData) {
      final args = routeData.argsAs<EditTablePageRouteArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.EditTablePage(
          key: args.key,
          tableEntity: args.tableEntity,
        ),
      );
    },
    HomePageRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.HomePage(),
      );
    },
    InitPageRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.InitPage(),
      );
    },
    LoginPageRoute.name: (routeData) {
      final args = routeData.argsAs<LoginPageRouteArgs>(
          orElse: () => const LoginPageRouteArgs());
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.LoginPage(key: args.key),
      );
    },
    MenusPageRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.MenusPage(),
      );
    },
    RegisterPageRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterPageRouteArgs>(
          orElse: () => const RegisterPageRouteArgs());
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.RegisterPage(key: args.key),
      );
    },
    ReservationsPageRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.ReservationsPage(),
      );
    },
    StartAppPageRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.StartAppPage(),
      );
    },
    TablesPageRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.TablesPage(),
      );
    },
    UserProfilePageRoute.name: (routeData) {
      final args = routeData.argsAs<UserProfilePageRouteArgs>(
          orElse: () => const UserProfilePageRouteArgs());
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.UserProfilePage(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.AddCategoryPage]
class AddCategoryPageRoute extends _i19.PageRouteInfo<void> {
  const AddCategoryPageRoute({List<_i19.PageRouteInfo>? children})
      : super(
          AddCategoryPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddCategoryPageRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AddTablePage]
class AddTablePageRoute extends _i19.PageRouteInfo<void> {
  const AddTablePageRoute({List<_i19.PageRouteInfo>? children})
      : super(
          AddTablePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddTablePageRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i3.CategoriesPage]
class CategoriesPageRoute extends _i19.PageRouteInfo<void> {
  const CategoriesPageRoute({List<_i19.PageRouteInfo>? children})
      : super(
          CategoriesPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoriesPageRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i4.CategoryMenusPage]
class CategoryMenusPageRoute
    extends _i19.PageRouteInfo<CategoryMenusPageRouteArgs> {
  CategoryMenusPageRoute({
    _i20.Key? key,
    required String id,
    required String categoryName,
    List<_i19.PageRouteInfo>? children,
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

  static const _i19.PageInfo<CategoryMenusPageRouteArgs> page =
      _i19.PageInfo<CategoryMenusPageRouteArgs>(name);
}

class CategoryMenusPageRouteArgs {
  const CategoryMenusPageRouteArgs({
    this.key,
    required this.id,
    required this.categoryName,
  });

  final _i20.Key? key;

  final String id;

  final String categoryName;

  @override
  String toString() {
    return 'CategoryMenusPageRouteArgs{key: $key, id: $id, categoryName: $categoryName}';
  }
}

/// generated route for
/// [_i5.ConfirmedPage]
class ConfirmedPageRoute extends _i19.PageRouteInfo<void> {
  const ConfirmedPageRoute({List<_i19.PageRouteInfo>? children})
      : super(
          ConfirmedPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ConfirmedPageRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i6.CreateReservationPage]
class CreateReservationPageRoute extends _i19.PageRouteInfo<void> {
  const CreateReservationPageRoute({List<_i19.PageRouteInfo>? children})
      : super(
          CreateReservationPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateReservationPageRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i7.EditCategoryPage]
class EditCategoryPageRoute
    extends _i19.PageRouteInfo<EditCategoryPageRouteArgs> {
  EditCategoryPageRoute({
    _i20.Key? key,
    required _i21.CategoryEntity categoryEntity,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          EditCategoryPageRoute.name,
          args: EditCategoryPageRouteArgs(
            key: key,
            categoryEntity: categoryEntity,
          ),
          initialChildren: children,
        );

  static const String name = 'EditCategoryPageRoute';

  static const _i19.PageInfo<EditCategoryPageRouteArgs> page =
      _i19.PageInfo<EditCategoryPageRouteArgs>(name);
}

class EditCategoryPageRouteArgs {
  const EditCategoryPageRouteArgs({
    this.key,
    required this.categoryEntity,
  });

  final _i20.Key? key;

  final _i21.CategoryEntity categoryEntity;

  @override
  String toString() {
    return 'EditCategoryPageRouteArgs{key: $key, categoryEntity: $categoryEntity}';
  }
}

/// generated route for
/// [_i8.EditReservationPage]
class EditReservationPageRoute
    extends _i19.PageRouteInfo<EditReservationPageRouteArgs> {
  EditReservationPageRoute({
    _i20.Key? key,
    required _i22.ReservationEntity reservation,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          EditReservationPageRoute.name,
          args: EditReservationPageRouteArgs(
            key: key,
            reservation: reservation,
          ),
          initialChildren: children,
        );

  static const String name = 'EditReservationPageRoute';

  static const _i19.PageInfo<EditReservationPageRouteArgs> page =
      _i19.PageInfo<EditReservationPageRouteArgs>(name);
}

class EditReservationPageRouteArgs {
  const EditReservationPageRouteArgs({
    this.key,
    required this.reservation,
  });

  final _i20.Key? key;

  final _i22.ReservationEntity reservation;

  @override
  String toString() {
    return 'EditReservationPageRouteArgs{key: $key, reservation: $reservation}';
  }
}

/// generated route for
/// [_i9.EditTablePage]
class EditTablePageRoute extends _i19.PageRouteInfo<EditTablePageRouteArgs> {
  EditTablePageRoute({
    _i20.Key? key,
    required _i23.TableEntity tableEntity,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          EditTablePageRoute.name,
          args: EditTablePageRouteArgs(
            key: key,
            tableEntity: tableEntity,
          ),
          initialChildren: children,
        );

  static const String name = 'EditTablePageRoute';

  static const _i19.PageInfo<EditTablePageRouteArgs> page =
      _i19.PageInfo<EditTablePageRouteArgs>(name);
}

class EditTablePageRouteArgs {
  const EditTablePageRouteArgs({
    this.key,
    required this.tableEntity,
  });

  final _i20.Key? key;

  final _i23.TableEntity tableEntity;

  @override
  String toString() {
    return 'EditTablePageRouteArgs{key: $key, tableEntity: $tableEntity}';
  }
}

/// generated route for
/// [_i10.HomePage]
class HomePageRoute extends _i19.PageRouteInfo<void> {
  const HomePageRoute({List<_i19.PageRouteInfo>? children})
      : super(
          HomePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomePageRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i11.InitPage]
class InitPageRoute extends _i19.PageRouteInfo<void> {
  const InitPageRoute({List<_i19.PageRouteInfo>? children})
      : super(
          InitPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'InitPageRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i12.LoginPage]
class LoginPageRoute extends _i19.PageRouteInfo<LoginPageRouteArgs> {
  LoginPageRoute({
    _i20.Key? key,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          LoginPageRoute.name,
          args: LoginPageRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginPageRoute';

  static const _i19.PageInfo<LoginPageRouteArgs> page =
      _i19.PageInfo<LoginPageRouteArgs>(name);
}

class LoginPageRouteArgs {
  const LoginPageRouteArgs({this.key});

  final _i20.Key? key;

  @override
  String toString() {
    return 'LoginPageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i13.MenusPage]
class MenusPageRoute extends _i19.PageRouteInfo<void> {
  const MenusPageRoute({List<_i19.PageRouteInfo>? children})
      : super(
          MenusPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'MenusPageRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i14.RegisterPage]
class RegisterPageRoute extends _i19.PageRouteInfo<RegisterPageRouteArgs> {
  RegisterPageRoute({
    _i20.Key? key,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          RegisterPageRoute.name,
          args: RegisterPageRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'RegisterPageRoute';

  static const _i19.PageInfo<RegisterPageRouteArgs> page =
      _i19.PageInfo<RegisterPageRouteArgs>(name);
}

class RegisterPageRouteArgs {
  const RegisterPageRouteArgs({this.key});

  final _i20.Key? key;

  @override
  String toString() {
    return 'RegisterPageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i15.ReservationsPage]
class ReservationsPageRoute extends _i19.PageRouteInfo<void> {
  const ReservationsPageRoute({List<_i19.PageRouteInfo>? children})
      : super(
          ReservationsPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReservationsPageRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i16.StartAppPage]
class StartAppPageRoute extends _i19.PageRouteInfo<void> {
  const StartAppPageRoute({List<_i19.PageRouteInfo>? children})
      : super(
          StartAppPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'StartAppPageRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i17.TablesPage]
class TablesPageRoute extends _i19.PageRouteInfo<void> {
  const TablesPageRoute({List<_i19.PageRouteInfo>? children})
      : super(
          TablesPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'TablesPageRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i18.UserProfilePage]
class UserProfilePageRoute
    extends _i19.PageRouteInfo<UserProfilePageRouteArgs> {
  UserProfilePageRoute({
    _i20.Key? key,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          UserProfilePageRoute.name,
          args: UserProfilePageRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'UserProfilePageRoute';

  static const _i19.PageInfo<UserProfilePageRouteArgs> page =
      _i19.PageInfo<UserProfilePageRouteArgs>(name);
}

class UserProfilePageRouteArgs {
  const UserProfilePageRouteArgs({this.key});

  final _i20.Key? key;

  @override
  String toString() {
    return 'UserProfilePageRouteArgs{key: $key}';
  }
}
