import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reservation_client/domain/entities/menu/menu_entity.dart';

import '../../../core/services/injectables/locator.dart';
import '../../../domain/usecases/categories/get_category_menu_usecase.dart';

part 'category_menu_event.dart';
part 'category_menu_state.dart';

class CategoryMenuBloc extends Bloc<CategoryMenuEvent, CategoryMenuState> {
  CategoryMenuBloc() : super(CategoryMenuInitial()) {
    on<GetCategoryMenu>((event, emit) async {
      try {
        emit(CategoryMenuLoading());
        List<MenuEntity> categoryMenu =
            await locator<GetCategoryMenuUsecase>().call(params: event.id);
        emit(CategoryMenuLoaded(categoryMenu: categoryMenu));
      } catch (e) {
        emit(CategoryMenuError(message: e.toString()));
      }
    });
  }
}
