import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:reservation_client/core/services/injectables/locator.dart';
import 'package:reservation_client/core/utils/helpers/helpers.dart';
import 'package:reservation_client/domain/entities/category/category_entity.dart';
import 'package:reservation_client/domain/usecases/categories/add_category_usecase.dart';
import 'package:reservation_client/domain/usecases/categories/delete_category_usecase.dart';
import 'package:reservation_client/domain/usecases/categories/get_categories_usecase.dart';
import 'package:reservation_client/domain/usecases/categories/update_category_usecase.dart';
import 'package:reservation_client/presentation/router/rourter.dart';

import '../../../core/constant/strings.dart';
import '../../widgets/my_snackbar.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesInitial()) {
    on<GetCategoriesEvent>((event, emit) async {
      try {
        emit(CategoriesLoading());
        List<CategoryEntity> categories =
            await locator<GetCategoriesUsecase>().call();
        emit(CategoriesLoaded(categories: categories));
      } catch (e) {
        emit(CategoriesError(message: e.toString()));
      }
    });

    on<CreateCategoryEvent>((event, emit) async {
      BuildContext buildContext = HelpUtils.getContext();
      try {
        buildContext.loaderOverlay.show();
        await locator<CreateCategoryUsecase>().call(params: event.request);
        buildContext.loaderOverlay.hide();
        locator<AppRouter>().maybePop();
        mySnackBar(Strings.successMessage, success: true);
        add(const GetCategoriesEvent());
      } catch (e) {
        buildContext.loaderOverlay.hide();
        mySnackBar(e.toString(), error: true);
        emit(CategoriesError(message: e.toString()));
      }
    });

    on<UpdateCategoryEvent>((event, emit) async {
      BuildContext buildContext = HelpUtils.getContext();
      try {
        buildContext.loaderOverlay.show();
        await locator<UpdateCategoryUsecase>().call(params: event.request);
        buildContext.loaderOverlay.hide();
        locator<AppRouter>().maybePop();
        mySnackBar(Strings.successMessage, success: true);
        add(const GetCategoriesEvent());
      } catch (e) {
        buildContext.loaderOverlay.hide();
        mySnackBar(e.toString(), error: true);
        emit(CategoriesError(message: e.toString()));
      }
    });

    on<DeleteCategoryEvent>((event, emit) async {
      BuildContext buildContext = HelpUtils.getContext();
      try {
        buildContext.loaderOverlay.show();
        await locator<DeleteCategoryUsecase>().call(params: event.id);
        buildContext.loaderOverlay.hide();
        mySnackBar(Strings.successMessage, success: true);
        add(const GetCategoriesEvent());
      } catch (e) {
        buildContext.loaderOverlay.hide();
        mySnackBar(e.toString(), error: true);
        emit(CategoriesError(message: e.toString()));
      }
    });
  }
}
