import 'package:reservation_client/core/services/injectables/locator.dart';
import 'package:reservation_client/core/utils/helpers/mappers/menu_mapper.dart';
import 'package:reservation_client/data/models/request/menu/create_menu_request.dart';
import 'package:reservation_client/data/models/response/menu/menu.dart';
import 'package:reservation_client/data/sources/menus/i_menus_service.dart';
import 'package:reservation_client/domain/entities/menu/menu_entity.dart';
import 'package:reservation_client/domain/repositories/menus/i_menus_repository.dart';

class MenusRepository extends IMenusRepository {
  @override
  Future<List<MenuEntity>> getAll() async {
    List<MenuModel> menus = await locator<IMenusService>().getAll();
    return menus.map((e) => MenuMapper.toMenuEntity(e)).toList();
  }

  @override
  Future<void> createMenu(CreateMenuRequest request) async {
    try {
      await locator<IMenusService>().createMenu(request);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteMenu(String id) async {
    try {
      await locator<IMenusService>().deleteMenu(id);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateMenu(CreateMenuRequest request) async {
    try {
      await locator<IMenusService>().updateMenu(request);
    } catch (e) {
      rethrow;
    }
  }
}
