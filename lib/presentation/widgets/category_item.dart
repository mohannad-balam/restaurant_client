import 'package:cached_network_image/cached_network_image.dart';
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
    final name = categoryEntity.name ?? '';
    final description = categoryEntity.description ?? '';

    return InkWell(
      // InkWell gives a visual splash on tap
      onTap: () {
        locator<AppRouter>().push(
          CategoryMenusPageRoute(
            id: categoryEntity.id.toString(),
            categoryName: name,
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
              // 1) Background image
              CachedNetworkImage(
                imageUrl: "${ApiRoutes.categoryUrl}/${categoryEntity.image}",
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                // Optional placeholder while loading
                placeholder: (context, url) => const Center(
                  child: Icon(Icons.no_photography),
                ),
                // Optional widget if image fails to load
                errorWidget: (context, url, error) => const Center(
                  child: Icon(Icons.error, color: Colors.red),
                ),
              ),

              // 2) Gradient overlay (bottom to transparent)
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black54, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),

              // 3) Text content
              Positioned(
                bottom: 10,
                left: 10,
                right: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
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
