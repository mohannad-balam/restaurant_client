import 'package:reservation_client/domain/entities/menu/menu_entity.dart';

abstract class IMenusRepository {
  Future<List<MenuEntity>> getAll();
}