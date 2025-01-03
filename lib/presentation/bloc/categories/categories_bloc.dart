import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reservation_client/core/services/injectables/locator.dart';
import 'package:reservation_client/domain/entities/category/category_entity.dart';
import 'package:reservation_client/domain/usecases/categories/get_categories_usecase.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesInitial()) {
    on<GetCategoriesEvent>((event, emit) async{
      try{
        emit(CategoriesLoading());
        List<CategoryEntity> categories = await locator<GetCategoriesUsecase>().call();
        emit(CategoriesLoaded(categories: categories));
      }catch(e){
        emit(CategoriesError(message: e.toString()));
      }
    });
  }
}
