// ignore_for_file: use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:reservation_client/domain/usecases/auth/get_user_info_usecase.dart';
import 'package:reservation_client/presentation/router/rourter.dart';
import 'package:reservation_client/presentation/router/rourter.gr.dart';
import 'package:reservation_client/presentation/widgets/custom_snackbar.dart';
import '../../../core/services/injectables/locator.dart';
import '../../../core/utils/helpers/helpers.dart';
import '../../../data/models/request/auth/login_request.dart';
import '../../../data/models/request/auth/register_request.dart';
import '../../../data/models/response/user.dart';
import '../../../domain/usecases/auth/login_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../../core/services/localDB/local_db_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
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
        mySnackBar("Logged in Successfully!", true);
        locator<AppRouter>().replace(const HomePageRoute());
      } catch (e) {
        buildContext.loaderOverlay.hide();
        mySnackBar(e.toString(), false);
        rethrow;
      }
    });

    on<LogoutEvent>((event, emit) async {
      BuildContext buildContext = HelpUtils.getContext();
      try {
        buildContext.loaderOverlay.show();
        await Future.delayed(const Duration(seconds: 2));
        await locator<LocalDBService>().remove(LoginResponse.key());
        await locator<LocalDBService>().remove(User.key());
        await mySnackBar("Logged out Successfully!", true);
        buildContext.loaderOverlay.hide();
        locator<AppRouter>().replaceAll([const StartAppPageRoute()]);
      } catch (e) {
        mySnackBar(e.toString(), false);
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
        await locator<LocalDBService>().saveToDisk(User.key(), user.toJson());
        emit(UserInfoLoaded(user: user));
        buildContext.loaderOverlay.hide();
      } catch (e) {
        buildContext.loaderOverlay.hide();
        emit(AuthError(message: e.toString()));
      }
    });
  }
}
