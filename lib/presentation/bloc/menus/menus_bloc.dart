import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:reservation_client/core/services/injectables/locator.dart';
import 'package:reservation_client/core/utils/helpers/helpers.dart';
import 'package:reservation_client/domain/entities/menu/menu_entity.dart';
import 'package:reservation_client/domain/usecases/menus/create_menu_usecase.dart';
import 'package:reservation_client/domain/usecases/menus/delete_menu_usecase.dart';
import 'package:reservation_client/domain/usecases/menus/get_menus_usecase.dart';
import 'package:reservation_client/domain/usecases/menus/update_menu_usecase.dart';
import 'package:reservation_client/presentation/router/rourter.dart';

import '../../../core/constant/strings.dart';
import '../../widgets/my_snackbar.dart';
part 'menus_event.dart';
part 'menus_state.dart';

class MenusBloc extends Bloc<MenusEvent, MenusState> {
  MenusBloc() : super(MenusInitial()) {
    on<GetMenusEvent>((event, emit) async {
      try {
        emit(MenusLoading());
        List<MenuEntity> menus = await locator<GetMenusUsecase>().call();
        emit(MenusLoaded(menus: menus));
      } catch (e) {
        mySnackBar(e.toString(), error: true);
        emit(MenusError(message: e.toString()));
      }
    });
    on<CreateMenuEvent>((event, emit) async {
      BuildContext context = HelpUtils.getContext();
      try {
        context.loaderOverlay.show();
        await locator<CreateMenuUsecase>().call(
          params: event.request,
        );
        context.loaderOverlay.hide();
        locator<AppRouter>().maybePop();
        mySnackBar(Strings.successMessage, success: true);
        add(GetMenusEvent());
      } catch (e) {
        context.loaderOverlay.hide();
        mySnackBar(e.toString(), error: true);
        emit(MenusError(message: e.toString()));
      }
    });
    on<DeleteMenuEvent>((event, emit) async {
      BuildContext context = HelpUtils.getContext();
      try {
        context.loaderOverlay.show();
        await locator<DeleteMenuUsecase>().call(
          params: event.id,
        );
        context.loaderOverlay.hide();
        mySnackBar(Strings.successMessage, success: true);
        add(GetMenusEvent());
      } catch (e) {
        context.loaderOverlay.hide();
        mySnackBar(e.toString(), error: true);
        emit(MenusError(message: e.toString()));
      }
    });
    on<UpdateMenuEvent>((event, emit) async {
      BuildContext context = HelpUtils.getContext();
      try {
        context.loaderOverlay.show();
        await locator<UpdateMenuUsecase>().call(
          params: event.request,
        );
        context.loaderOverlay.hide();
        mySnackBar(Strings.successMessage, success: true);
        locator<AppRouter>().maybePop();
        add(GetMenusEvent());
      } catch (e) {
        context.loaderOverlay.hide();
        mySnackBar(e.toString(), error: true);
        emit(MenusError(message: e.toString()));
      }
    });
  }
}
