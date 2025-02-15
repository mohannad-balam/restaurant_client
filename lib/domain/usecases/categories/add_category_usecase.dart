import 'package:dio/dio.dart';
import 'package:reservation_client/core/services/injectables/locator.dart';
import 'package:reservation_client/core/common/usecase/usecase.dart';
import 'package:reservation_client/data/models/request/category/create_category_request.dart';
import 'package:reservation_client/domain/repositories/categories/i_categories_repository.dart';

class CreateCategoryUsecase extends IUseCase<void, FormData> {
  @override
  Future<void> call({FormData? params}) async {
    return await locator<ICategoriesRepository>().create(params!);
  }
}
