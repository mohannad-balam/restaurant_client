import 'package:flutter/material.dart';
import 'package:reservation_client/domain/entities/category/category_entity.dart';

import '../../core/constant/api_routes.dart';
import '../../core/services/injectables/locator.dart';
import '../router/rourter.dart';
import '../router/rourter.gr.dart';

class CategoryItem extends StatelessWidget {
  final CategoryEntity categoryEntity;

  const CategoryItem({super.key, required this.categoryEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        locator<AppRouter>().push(
          CategoryMenusPageRoute(
            id: categoryEntity.id.toString(),
            categoryName: categoryEntity.name.toString(),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            children: [
              Image.network(
                "${ApiRoutes.categoryUrl}/${categoryEntity.image}",
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'edit') {
                      // locator<AppRouter>().push(
                      //   // EditCategoryPageRoute(id: categoryEntity.id.toString()),
                      // );
                    } else if (value == 'delete') {}
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'edit',
                      child: Text('Edit'),
                    ),
                    const PopupMenuItem(
                      value: 'delete',
                      child: Text('Delete'),
                    ),
                  ],
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                right: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      categoryEntity.name!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      categoryEntity.description!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
