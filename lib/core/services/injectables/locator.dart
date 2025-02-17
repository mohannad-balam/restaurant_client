import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:reservation_client/data/sources/categories/categories_service.dart';
import 'package:reservation_client/data/sources/categories/i_categories_service.dart';
import 'package:reservation_client/data/sources/menus/i_menus_service.dart';
import 'package:reservation_client/data/sources/menus/menus_service.dart';
import 'package:reservation_client/data/sources/reservation/i_reservation_service.dart';
import 'package:reservation_client/data/sources/reservation/reservation_service.dart';
import 'package:reservation_client/data/sources/table/i_table_service.dart';
import 'package:reservation_client/data/sources/table/table_service.dart';
import 'package:reservation_client/domain/repositories/categories/categories_repository.dart';
import 'package:reservation_client/domain/repositories/categories/i_categories_repository.dart';
import 'package:reservation_client/domain/repositories/menus/i_menus_repository.dart';
import 'package:reservation_client/domain/repositories/menus/menus_repository.dart';
import 'package:reservation_client/domain/repositories/reservation/i_reservation_repository.dart';
import 'package:reservation_client/domain/repositories/reservation/reservation_repository.dart';
import 'package:reservation_client/domain/repositories/table/i_table_repository.dart';
import 'package:reservation_client/domain/repositories/table/table_repository.dart';
import 'package:reservation_client/domain/usecases/auth/get_user_info_usecase.dart';
import 'package:reservation_client/domain/usecases/categories/add_category_usecase.dart';
import 'package:reservation_client/domain/usecases/categories/get_categories_usecase.dart';
import 'package:reservation_client/domain/usecases/menus/create_menu_usecase.dart';
import 'package:reservation_client/domain/usecases/menus/delete_menu_usecase.dart';
import 'package:reservation_client/domain/usecases/menus/get_menus_usecase.dart';
import 'package:reservation_client/domain/usecases/menus/update_menu_usecase.dart';
import 'package:reservation_client/domain/usecases/reservation/create_reservation_usecase.dart';
import 'package:reservation_client/domain/usecases/reservation/delete_reservation_usecase.dart';
import 'package:reservation_client/domain/usecases/reservation/get_reservations_usecase.dart';
import 'package:reservation_client/domain/usecases/reservation/update_reservation_usecase.dart';
import 'package:reservation_client/domain/usecases/tables/add_table_usecase.dart';
import 'package:reservation_client/domain/usecases/tables/delete_table_usecase.dart';
import 'package:reservation_client/domain/usecases/tables/get_available_tables_usecase.dart';
import 'package:reservation_client/domain/usecases/tables/update_table_usecase.dart';

import '../../../data/sources/auth/auth_service.dart';
import '../../../data/sources/auth/i_auth_service.dart';
import '../../../domain/repositories/auth/auth_repository.dart';
import '../../../domain/repositories/auth/i_auth_repository.dart';
import '../../../domain/usecases/auth/login_usecase.dart';

import '../../../domain/usecases/categories/delete_category_usecase.dart';
import '../../../domain/usecases/categories/get_category_menu_usecase.dart';
import '../../../domain/usecases/categories/update_category_usecase.dart';
import '../../../presentation/router/rourter.dart';
import '../app_logger.dart';
import '../http/http_service.dart';
import '../localDB/local_db_service.dart';
import 'package:get_it/get_it.dart';

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
  locator.registerSingleton(Logger(printer: CustomPrinter()));
  locator.registerLazySingleton(() => ImagePicker());
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
  locator.registerLazySingleton<IAuthService>(() => AuthService());
  locator.registerLazySingleton<ICategoriesService>(() => CategoriesService());
  locator.registerLazySingleton<IMenusService>(() => MenusService());
  locator
      .registerLazySingleton<IReservationService>(() => ReservationService());
  locator.registerLazySingleton<ITableService>(() => TableService());
}

Future<void> _setupRepositories() async {
  locator.registerLazySingleton<IAuthRepository>(() => AuthRepository());
  locator.registerLazySingleton<ICategoriesRepository>(
      () => CategoriesRepository());
  locator.registerLazySingleton<IMenusRepository>(() => MenusRepository());
  locator.registerLazySingleton<IReservationRepository>(
      () => ReservationRepository());
  locator.registerLazySingleton<ITableRepository>(() => TableRepository());
}

Future<void> _setupUsecases() async {
  locator.registerLazySingleton<LoginUsecase>(() => LoginUsecase());

  locator.registerLazySingleton<GetCategoriesUsecase>(
      () => GetCategoriesUsecase());

  locator.registerLazySingleton<GetMenusUsecase>(() => GetMenusUsecase());

  locator.registerLazySingleton<GetCategoryMenuUsecase>(
      () => GetCategoryMenuUsecase());

  locator.registerLazySingleton<CreateReservationUsecase>(
      () => CreateReservationUsecase());

  locator.registerLazySingleton<GetUserInfoUsecase>(() => GetUserInfoUsecase());

  locator.registerLazySingleton<GetAvailableTablesUsecase>(
      () => GetAvailableTablesUsecase());

  ///categories
  locator.registerLazySingleton<CreateCategoryUsecase>(
      () => CreateCategoryUsecase());
  locator.registerLazySingleton<DeleteCategoryUsecase>(
      () => DeleteCategoryUsecase());
  locator.registerLazySingleton<UpdateCategoryUsecase>(
      () => UpdateCategoryUsecase());

  ///tables
  locator.registerLazySingleton<AddTableUsecase>(() => AddTableUsecase());
  locator.registerLazySingleton<DeleteTableUsecase>(() => DeleteTableUsecase());
  locator.registerLazySingleton<UpdateTableUsecase>(() => UpdateTableUsecase());

  ///tables
  locator.registerLazySingleton<GetReservationsUsecase>(
      () => GetReservationsUsecase());
  locator.registerLazySingleton<DeleteReservationUsecase>(
      () => DeleteReservationUsecase());
  locator.registerLazySingleton<UpdateReservationUsecase>(
      () => UpdateReservationUsecase());

  ///menus
  locator.registerLazySingleton<CreateMenuUsecase>(() => CreateMenuUsecase());
  locator.registerLazySingleton<UpdateMenuUsecase>(() => UpdateMenuUsecase());
  locator.registerLazySingleton<DeleteMenuUsecase>(() => DeleteMenuUsecase());
}
