import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_client/core/enums/theme_enum.dart';
import 'package:reservation_client/core/services/injectables/locator.dart';
import 'package:reservation_client/presentation/bloc/auth/auth_bloc.dart';
import 'package:reservation_client/presentation/bloc/categories/categories_bloc.dart';
import 'package:reservation_client/presentation/bloc/menus/menus_bloc.dart';
import 'package:reservation_client/presentation/bloc/mutual/category_menu_bloc.dart';
import 'package:reservation_client/presentation/bloc/reservation/reservation_bloc.dart';
import 'package:reservation_client/presentation/bloc/tables/tables_bloc.dart';
import 'package:reservation_client/presentation/router/rourter.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:screentasia/screentasia.dart';

import 'core/theme/app_themes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => CategoriesBloc(),
        ),
        BlocProvider(
          create: (context) => MenusBloc(),
        ),
        BlocProvider(
          create: (context) => CategoryMenuBloc(),
        ),
        BlocProvider(
          create: (context) => TablesBloc(),
        ),
        BlocProvider(
          create: (context) => ReservationBloc(),
        ),
      ],
      child: ScreentasiaInit(
        useInheritedMediaQuery: true,
        builder:(context, child) => GlobalLoaderOverlay(
          child: MaterialApp.router(
            title: 'Reservation Client',
            debugShowCheckedModeBanner: false,
            theme: AppThemes.themes[ThemeEnum.light],
            themeMode: ThemeMode.light,
            darkTheme: AppThemes.themes[ThemeEnum.dark],
            routerConfig: locator<AppRouter>().config(),
          ),
        ),
      ),
    );
  }
}