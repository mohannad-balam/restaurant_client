import 'package:flutter/material.dart';
import 'package:reservation_client/core/constant/api_routes.dart';
import 'package:reservation_client/domain/entities/category/category_entity.dart';
import 'package:reservation_client/presentation/router/rourter.dart';
import 'package:reservation_client/presentation/router/rourter.gr.dart';

import '../../core/services/injectables/locator.dart';

class CategoryItem extends StatelessWidget {
  final CategoryEntity categoryEntity;
  const CategoryItem({super.key, required this.categoryEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: (){
            locator<AppRouter>().push(CategoryMenusPageRoute(id: categoryEntity.id.toString(), categoryName: categoryEntity.name.toString()));
          },
          child: ListTile(
            leading: Image.network("${ApiRoutes.categoryUrl}/${categoryEntity.image}"),
            title: Text(categoryEntity.name.toString()),
          ),
        ),
        const Divider(),
      ],
    );
  }
}