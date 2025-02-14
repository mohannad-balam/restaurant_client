import 'package:reservation_client/domain/entities/category/category_entity.dart';
import 'package:reservation_client/domain/entities/menu/menu_entity.dart';

import '../../../data/models/request/category/create_category_request.dart';

abstract class ICategoriesRepository {
  Future<List<CategoryEntity>> getAll();
  Future<List<MenuEntity>> getCategoryMenu(String id);
  Future<void> create(CreateCategoryRequest request);
  Future<void> update(CreateCategoryRequest request);
  Future<void> delete(String id);
}
