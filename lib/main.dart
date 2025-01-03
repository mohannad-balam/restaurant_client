import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_client/core/services/injectables/locator.dart';
import 'package:reservation_client/presentation/bloc/auth/auth_bloc.dart';
import 'package:reservation_client/presentation/bloc/categories/categories_bloc.dart';
import 'package:reservation_client/presentation/bloc/menus/menus_bloc.dart';
import 'package:reservation_client/presentation/bloc/mutual/category_menu_bloc.dart';
import 'package:reservation_client/presentation/router/rourter.dart';
import 'package:loader_overlay/loader_overlay.dart';

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
      ],
      child: GlobalLoaderOverlay(
        child: MaterialApp.router(
          title: 'Reservation Client',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routerConfig: locator<AppRouter>().config(),
        ),
      ),
    );
  }
}