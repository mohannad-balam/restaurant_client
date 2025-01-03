import 'package:reservation_client/core/services/injectables/locator.dart';
import 'package:reservation_client/core/usecase/usecase.dart';
import 'package:reservation_client/domain/entities/menu/menu_entity.dart';
import 'package:reservation_client/domain/repositories/menus/i_menus_repository.dart';

class GetMenusUsecase extends IUseCase<List<MenuEntity>,dynamic>{
  @override
  Future<List<MenuEntity>> call({params}) async{
    return await locator<IMenusRepository>().getAll();
  }
}