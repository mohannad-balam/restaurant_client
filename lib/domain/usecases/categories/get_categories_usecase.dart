import 'package:reservation_client/core/services/injectables/locator.dart';
import 'package:reservation_client/core/usecase/usecase.dart';
import 'package:reservation_client/domain/entities/category/category_entity.dart';
import 'package:reservation_client/domain/repositories/categories/i_categories_repository.dart';

class GetCategoriesUsecase extends IUseCase<List<CategoryEntity>,dynamic>{
  @override
  Future<List<CategoryEntity>> call({params}) async{
    return await locator<ICategoriesRepository>().getAll();
  }
}