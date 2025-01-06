// ignore_for_file: use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:reservation_client/domain/usecases/auth/get_user_info_usecase.dart';
import 'package:reservation_client/presentation/router/rourter.dart';
import 'package:reservation_client/presentation/router/rourter.gr.dart';
import '../../../core/services/injectables/locator.dart';
import '../../../core/utils/helpers/helpers.dart';
import '../../../data/models/request/auth/login_request.dart';
import '../../../data/models/request/auth/register_request.dart';
import '../../../data/models/response/user.dart';
import '../../../domain/usecases/auth/login_usecase.dart';
import '../../../domain/usecases/auth/register_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../../core/services/localDB/local_db_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<RegisterEvent>((event, emit) async {
      BuildContext buildContext = HelpUtils.getContext();
      try {
        buildContext.loaderOverlay.show();
        emit(AuthLoading());
        await locator<RegisterUsecase>()
            .call(params: event.registerRequest);
        emit(AuthLoggedIn());
        buildContext.loaderOverlay.hide();
        locator<AppRouter>().replace(const HomePageRoute());
      } catch (e) {
        buildContext.loaderOverlay.hide();
        rethrow;
      }
    });

    on<LoginEvent>((event, emit) async {
      BuildContext buildContext = HelpUtils.getContext();
      try {
        buildContext.loaderOverlay.show();
        LoginResponse loginResponse =
            await locator<LoginUsecase>().call(params: event.loginRequest);
        if (kDebugMode) {
          print(loginResponse.accessToken);
        }
        await locator<LocalDBService>()
            .saveToDisk(LoginResponse.key(), loginResponse.toJson());
        emit(AuthLoggedIn());
        buildContext.loaderOverlay.hide();
        locator<AppRouter>().replace(const HomePageRoute());
      } catch (e) {
        buildContext.loaderOverlay.hide();
        rethrow;
      }
    });

    on<LogoutEvent>((event, emit) async {
      BuildContext buildContext = HelpUtils.getContext();
      try {
        buildContext.loaderOverlay.show();
        await Future.delayed(const Duration(seconds: 2));
        locator<LocalDBService>().remove(LoginResponse.key());
        buildContext.loaderOverlay.hide();
        locator<AppRouter>().replaceAll([const StartAppPageRoute()]);
      } catch (e) {
        buildContext.loaderOverlay.hide();
        rethrow;
      }
    });


    on<GetUserInfoEvent>((event, emit) async {
      BuildContext buildContext = HelpUtils.getContext();
      try {
        emit(AuthLoading());
        buildContext.loaderOverlay.show();
        User user = await locator<GetUserInfoUsecase>().call();
        emit(UserInfoLoaded(user: user));
        buildContext.loaderOverlay.hide();
      } catch (e) {
        buildContext.loaderOverlay.hide();
        emit(AuthError(message: e.toString()));
      }
    });
  }

  
}
