import 'package:reservation_client/core/services/injectables/locator.dart';
import 'package:reservation_client/core/common/usecase/usecase.dart';
import 'package:reservation_client/data/models/request/category/create_category_request.dart';
import 'package:reservation_client/domain/repositories/categories/i_categories_repository.dart';

class UpdateCategoryUsecase extends IUseCase<void, CreateCategoryRequest> {
  @override
  Future<void> call({CreateCategoryRequest? params}) async {
    return await locator<ICategoriesRepository>().update(params!);
  }
}
