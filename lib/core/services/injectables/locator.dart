import '../../../data/sources/auth/auth_service.dart';
import '../../../data/sources/auth/i_auth_service.dart';
import '../../../domain/repositories/auth/auth_repository.dart';
import '../../../domain/repositories/auth/i_auth_repository.dart';
import '../../../domain/usecases/auth/login_usecase.dart';
import '../../../domain/usecases/auth/register_usecase.dart';

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
}

Future<void> _setupRepositories() async {
  locator.registerSingleton<IAuthRepository>(AuthRepository());
}

Future<void> _setupUsecases() async {
  locator.registerSingleton<LoginUsecase>(LoginUsecase());
  locator.registerSingleton<RegisterUsecase>(RegisterUsecase());
}
