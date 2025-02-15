import 'package:reservation_client/core/constant/api_routes.dart';
import 'package:reservation_client/core/enums/http_methods.dart';
import 'package:reservation_client/core/services/http/http_service.dart';
import 'package:reservation_client/core/services/injectables/locator.dart';
import 'package:reservation_client/data/models/request/menu/create_menu_request.dart';
import 'package:reservation_client/data/models/response/menu/menu.dart';
import 'package:reservation_client/data/sources/menus/i_menus_service.dart';

class MenusService extends IMenusService {
  @override
  Future<List<MenuModel>> getAll() async {
    try {
      List<dynamic> menus = await locator<HttpService>()
          .request(HttpMethods.GET, ApiRoutes.menus, {});
      return menus.map((e) => MenuModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> createMenu(CreateMenuRequest request) async {
    try {
      await locator<HttpService>()
          .request(HttpMethods.POST, ApiRoutes.createMenu, request.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteMenu(String id) async {
    try {
      await locator<HttpService>()
          .request(HttpMethods.DELETE, ApiRoutes.deleteMenu(id), {});
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateMenu(CreateMenuRequest request) async {
    try {
      await locator<HttpService>().request(HttpMethods.PUT,
          ApiRoutes.updateMenu(request.id.toString()), request.toJson());
    } catch (e) {
      rethrow;
    }
  }
}
