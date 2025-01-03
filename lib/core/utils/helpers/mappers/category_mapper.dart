import 'package:reservation_client/data/models/request/category/category.dart';
import 'package:reservation_client/domain/entities/category/category_entity.dart';

class CategoryMapper {

  static CategoryEntity toCategoryEntity(CategoryModel categoryModel){
    return CategoryEntity(
      id: categoryModel.id,
      name: categoryModel.name,
      description: categoryModel.description,
      image: categoryModel.image,
    );
  }

}