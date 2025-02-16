import 'package:dio/dio.dart';
import 'package:reservation_client/data/models/response/menu/menu.dart';

abstract class IMenusService {
  Future<List<MenuModel>> getAll();
  Future<void> createMenu(FormData request);
  Future<void> updateMenu(FormData request);
  Future<void> deleteMenu(String id);
}
