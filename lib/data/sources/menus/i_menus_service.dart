import 'package:reservation_client/data/models/request/menu/create_menu_request.dart';
import 'package:reservation_client/data/models/response/menu/menu.dart';

abstract class IMenusService {
  Future<List<MenuModel>> getAll();
  Future<void> createMenu(CreateMenuRequest request);
  Future<void> updateMenu(CreateMenuRequest request);
  Future<void> deleteMenu(String id);
}
