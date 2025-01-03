import 'package:reservation_client/data/models/response/menu/menu.dart';

abstract class IMenusService {
  Future<List<MenuModel>> getAll();
}