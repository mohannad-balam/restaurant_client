import 'package:reservation_client/core/services/injectables/locator.dart';
import 'package:reservation_client/core/common/usecase/usecase.dart';
import 'package:reservation_client/data/models/request/menu/create_menu_request.dart';
import 'package:reservation_client/domain/repositories/menus/i_menus_repository.dart';

class CreateMenuUsecase extends IUseCase<void, CreateMenuRequest> {
  @override
  Future<void> call({CreateMenuRequest? params}) async {
    return await locator<IMenusRepository>().createMenu(params!);
  }
}
