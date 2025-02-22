import 'package:reservation_client/data/models/response/menu/menu.dart';

import '../../models/response/category/category.dart';

abstract class ICategoriesService {
  Future<List<CategoryModel>> getAll();
  Future<List<MenuModel>> getCategoryMenu(String id);
}
