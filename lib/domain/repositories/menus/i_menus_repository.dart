import 'package:reservation_client/domain/entities/menu/menu_entity.dart';

import '../../../data/models/request/menu/create_menu_request.dart';

abstract class IMenusRepository {
  Future<List<MenuEntity>> getAll();
  Future<void> createMenu(CreateMenuRequest request);
  Future<void> updateMenu(CreateMenuRequest request);
  Future<void> deleteMenu(String id);
}
