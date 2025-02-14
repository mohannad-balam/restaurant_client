import 'package:reservation_client/core/services/injectables/locator.dart';
import 'package:reservation_client/core/utils/helpers/mappers/category_mapper.dart';
import 'package:reservation_client/core/utils/helpers/mappers/menu_mapper.dart';
import 'package:reservation_client/data/models/request/category/category.dart';
import 'package:reservation_client/data/models/request/category/create_category_request.dart';
import 'package:reservation_client/data/models/response/menu/menu.dart';
import 'package:reservation_client/data/sources/categories/i_categories_service.dart';
import 'package:reservation_client/domain/entities/category/category_entity.dart';
import 'package:reservation_client/domain/entities/menu/menu_entity.dart';
import 'package:reservation_client/domain/repositories/categories/i_categories_repository.dart';

class CategoriesRepository extends ICategoriesRepository {
  @override
  Future<List<CategoryEntity>> getAll() async {
    try {
      List<CategoryModel> categoriesModel =
          await locator<ICategoriesService>().getAll();
      return categoriesModel
          .map((e) => CategoryMapper.toCategoryEntity(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MenuEntity>> getCategoryMenu(String id) async {
    try {
      List<MenuModel> categoryMenu =
          await locator<ICategoriesService>().getCategoryMenu(id);
      return categoryMenu.map((e) => MenuMapper.toMenuEntity(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> create(CreateCategoryRequest request) async {
    try {
      await locator<ICategoriesService>().create(request);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> delete(String id) async {
    try {
      await locator<ICategoriesService>().delete(id);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> update(CreateCategoryRequest request) async {
    try {
      await locator<ICategoriesService>().update(request);
    } catch (e) {
      rethrow;
    }
  }
}
