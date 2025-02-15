import 'package:dio/dio.dart';
import 'package:reservation_client/data/models/request/category/create_category_request.dart';
import 'package:reservation_client/data/models/response/menu/menu.dart';
import '../../models/response/category/category.dart';

abstract class ICategoriesService {
  Future<List<CategoryModel>> getAll();
  Future<List<MenuModel>> getCategoryMenu(String id);
  Future<void> create(FormData request);
  Future<void> update(CreateCategoryRequest request);
  Future<void> delete(String id);
}
