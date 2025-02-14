import 'package:reservation_client/core/services/injectables/locator.dart';
import 'package:reservation_client/core/common/usecase/usecase.dart';
import 'package:reservation_client/domain/repositories/categories/i_categories_repository.dart';

class DeleteCategoryUsecase extends IUseCase<void, String> {
  @override
  Future<void> call({String? params}) async {
    return await locator<ICategoriesRepository>().delete(params!);
  }
}
