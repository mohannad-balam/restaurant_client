import 'package:reservation_client/domain/entities/category/category_entity.dart';

import '../../../../data/models/response/category/category.dart';

class CategoryMapper {
  static CategoryEntity toCategoryEntity(CategoryModel categoryModel) {
    return CategoryEntity(
      id: categoryModel.id,
      name: categoryModel.name,
      description: categoryModel.description,
      image: categoryModel.image?.split('/').last,
    );
  }
}
