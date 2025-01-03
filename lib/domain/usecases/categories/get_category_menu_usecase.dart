import 'package:reservation_client/core/services/injectables/locator.dart';
import 'package:reservation_client/core/usecase/usecase.dart';
import 'package:reservation_client/domain/entities/menu/menu_entity.dart';

import '../../repositories/categories/i_categories_repository.dart';

class GetCategoryMenuUsecase extends IUseCase<List<MenuEntity>,String>{
  @override
  Future<List<MenuEntity>> call({String? params}) async{
    return await locator<ICategoriesRepository>().getCategoryMenu(params!);
  }
}