import 'package:reservation_client/core/services/injectables/locator.dart';
import 'package:reservation_client/core/common/usecase/usecase.dart';
import 'package:reservation_client/domain/repositories/menus/i_menus_repository.dart';

class DeleteMenuUsecase extends IUseCase<void, String> {
  @override
  Future<void> call({String? params}) async {
    return await locator<IMenusRepository>().deleteMenu(params!);
  }
}
