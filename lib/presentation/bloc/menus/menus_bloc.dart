import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reservation_client/core/services/injectables/locator.dart';
import 'package:reservation_client/domain/entities/menu/menu_entity.dart';
import 'package:reservation_client/domain/usecases/menus/get_menus_usecase.dart';

part 'menus_event.dart';
part 'menus_state.dart';

class MenusBloc extends Bloc<MenusEvent, MenusState> {
  MenusBloc() : super(MenusInitial()) {
    on<GetMenusEvent>((event, emit) async{
      try{
        emit(MenusLoading());
        List<MenuEntity> menus = await locator<GetMenusUsecase>().call();
        emit(MenusLoaded(menus: menus));
      }catch(e){
        emit(MenusError(message: e.toString()));
      }
    });
  }
}
