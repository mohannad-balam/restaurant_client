import 'package:reservation_client/data/sources/categories/categories_service.dart';
import 'package:reservation_client/data/sources/categories/i_categories_service.dart';
import 'package:reservation_client/data/sources/menus/i_menus_service.dart';
import 'package:reservation_client/data/sources/menus/menus_service.dart';
import 'package:reservation_client/domain/repositories/categories/categories_repository.dart';
import 'package:reservation_client/domain/repositories/categories/i_categories_repository.dart';
import 'package:reservation_client/domain/repositories/menus/i_menus_repository.dart';
import 'package:reservation_client/domain/repositories/menus/menus_repository.dart';
import 'package:reservation_client/domain/usecases/categories/get_categories_usecase.dart';
import 'package:reservation_client/domain/usecases/menus/get_menus_usecase.dart';

import '../../../data/sources/auth/auth_service.dart';
import '../../../data/sources/auth/i_auth_service.dart';
import '../../../domain/repositories/auth/auth_repository.dart';
import '../../../domain/repositories/auth/i_auth_repository.dart';
import '../../../domain/usecases/auth/login_usecase.dart';
import '../../../domain/usecases/auth/register_usecase.dart';

import '../../../domain/usecases/categories/get_category_menu_usecase.dart';
import '../../../presentation/router/rourter.dart';
import '../http/http_service.dart';
import '../localDB/local_db_service.dart';
import 'package:get_it/get_it.dart';
import '../../utils/helpers/encrypt_helper.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  await _setupServives();
  await _setupSharedPreferences();
  await _setupHttpService();
  await _setupSources();
  await _setupRepositories();
  await _setupUsecases();
  // await  _checkVersion();
}

Future<void> _setupServives() async {
  locator.registerSingleton(AppRouter());
  locator.registerSingleton(EncryptionHelper());
}

Future<void> _setupHttpService() async {
  final HttpService instance = HttpService();
  await instance.init();
  locator.registerSingleton(instance);
}

Future<void> _setupSharedPreferences() async {
  final LocalDBService instance = LocalDBService();
  await instance.init();
  locator.registerSingleton(instance);
}

Future<void> _setupSources() async {
  locator.registerSingleton<IAuthService>(AuthService());
  locator.registerSingleton<ICategoriesService>(CategoriesService());
  locator.registerSingleton<IMenusService>(MenusService());
}

Future<void> _setupRepositories() async {
  locator.registerSingleton<IAuthRepository>(AuthRepository());
  locator.registerSingleton<ICategoriesRepository>(CategoriesRepository());
  locator.registerSingleton<IMenusRepository>(MenusRepository());
}

Future<void> _setupUsecases() async {
  locator.registerSingleton<LoginUsecase>(LoginUsecase());
  locator.registerSingleton<RegisterUsecase>(RegisterUsecase());

  locator.registerSingleton<GetCategoriesUsecase>(GetCategoriesUsecase());

  locator.registerSingleton<GetMenusUsecase>(GetMenusUsecase());

  locator.registerSingleton<GetCategoryMenuUsecase>(GetCategoryMenuUsecase());
}
