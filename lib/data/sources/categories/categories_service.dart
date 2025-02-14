import 'package:reservation_client/core/constant/api_routes.dart';
import 'package:reservation_client/core/enums/http_methods.dart';
import 'package:reservation_client/core/services/http/http_service.dart';
import 'package:reservation_client/core/services/injectables/locator.dart';
import 'package:reservation_client/data/models/request/category/create_category_request.dart';
import 'package:reservation_client/data/models/response/menu/menu.dart';
import 'package:reservation_client/data/sources/categories/i_categories_service.dart';

import '../../models/request/category/category.dart';

class CategoriesService extends ICategoriesService {
  @override
  Future<List<CategoryModel>> getAll() async {
    try {
      List<dynamic> response = await locator<HttpService>()
          .request(HttpMethods.GET, ApiRoutes.categories, {});
      return response.map((e) => CategoryModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MenuModel>> getCategoryMenu(String id) async {
    try {
      List<dynamic> response = await locator<HttpService>()
          .request(HttpMethods.GET, ApiRoutes.menusCategory(id), {});
      return response.map((e) => MenuModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> create(CreateCategoryRequest request) async {
    try {
      await locator<HttpService>().request(
          HttpMethods.POST, ApiRoutes.createCategory, request.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> delete(String id) async {
    try {
      await locator<HttpService>()
          .request(HttpMethods.DELETE, ApiRoutes.deleteCategory(id), {});
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> update(CreateCategoryRequest request) async {
    try {
      await locator<HttpService>().request(HttpMethods.PUT,
          ApiRoutes.updateCategory(request.id.toString()), request.toJson());
    } catch (e) {
      rethrow;
    }
  }
}
