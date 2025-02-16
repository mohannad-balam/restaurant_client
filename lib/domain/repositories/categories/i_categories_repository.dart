import 'package:dio/dio.dart';
import 'package:reservation_client/domain/entities/category/category_entity.dart';
import 'package:reservation_client/domain/entities/menu/menu_entity.dart';

abstract class ICategoriesRepository {
  Future<List<CategoryEntity>> getAll();
  Future<List<MenuEntity>> getCategoryMenu(String id);
  Future<void> create(FormData request);
  Future<void> update(FormData request);
  Future<void> delete(String id);
}
