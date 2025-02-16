import 'package:dio/dio.dart';
import 'package:reservation_client/domain/entities/menu/menu_entity.dart';

abstract class IMenusRepository {
  Future<List<MenuEntity>> getAll();
  Future<void> createMenu(FormData request);
  Future<void> updateMenu(FormData request);
  Future<void> deleteMenu(String id);
}
