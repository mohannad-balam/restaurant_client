import 'package:dio/dio.dart';
import 'package:reservation_client/core/services/injectables/locator.dart';
import 'package:reservation_client/core/common/usecase/usecase.dart';
import 'package:reservation_client/domain/repositories/menus/i_menus_repository.dart';

class CreateMenuUsecase extends IUseCase<void, FormData> {
  @override
  Future<void> call({FormData? params}) async {
    return await locator<IMenusRepository>().createMenu(params!);
  }
}
