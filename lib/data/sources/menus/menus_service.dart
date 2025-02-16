import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:reservation_client/core/constant/api_routes.dart';
import 'package:reservation_client/core/enums/http_methods.dart';
import 'package:reservation_client/core/services/http/http_service.dart';
import 'package:reservation_client/core/services/injectables/locator.dart';
import 'package:reservation_client/data/models/response/menu/menu.dart';
import 'package:reservation_client/data/sources/menus/i_menus_service.dart';

class MenusService extends IMenusService {
  @override
  Future<List<MenuModel>> getAll() async {
    try {
      List<dynamic> menus = await locator<HttpService>()
          .request(HttpMethods.GET, ApiRoutes.menus, {}, null);
      return menus.map((e) => MenuModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> createMenu(FormData request) async {
    try {
      await locator<HttpService>()
          .request(HttpMethods.POST, ApiRoutes.createMenu, {}, request);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteMenu(String id) async {
    try {
      await locator<HttpService>()
          .request(HttpMethods.DELETE, ApiRoutes.deleteMenu(id), {}, null);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateMenu(FormData request) async {
    try {
      String id = request.fields[0].value;
      request.fields.removeAt(0);
      debugPrint(request.fields.toString());
      await locator<HttpService>()
          .request(HttpMethods.POST, ApiRoutes.updateMenu(id), {}, request);
    } catch (e) {
      rethrow;
    }
  }
}
