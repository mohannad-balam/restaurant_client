import 'package:reservation_client/data/models/response/menu/menu.dart';
import 'package:reservation_client/domain/entities/menu/menu_entity.dart';

class MenuMapper {
  static MenuEntity toMenuEntity(MenuModel menuModel) {
    return MenuEntity(
        id: menuModel.id,
        name: menuModel.name,
        description: menuModel.description,
        image: menuModel.image?.split('/').last,
        price: menuModel.price);
  }
}
