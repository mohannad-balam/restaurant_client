import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_client/core/constant/strings.dart';
import 'package:reservation_client/domain/entities/category/category_entity.dart';
import 'package:reservation_client/presentation/bloc/categories/categories_bloc.dart';

import '../../core/constant/api_routes.dart';
import '../../core/services/injectables/locator.dart';
import '../router/rourter.dart';
import '../router/rourter.gr.dart';

class CategoryItem extends StatefulWidget {
  final CategoryEntity categoryEntity;

  const CategoryItem({super.key, required this.categoryEntity});

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  void initState() {
    super.initState();
    debugPrint("image => ${widget.categoryEntity.image}");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        locator<AppRouter>().push(
          CategoryMenusPageRoute(
            id: widget.categoryEntity.id.toString(),
            categoryName: widget.categoryEntity.name.toString(),
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
              CachedNetworkImage(
                imageUrl:
                    "${ApiRoutes.categoryUrl}/${widget.categoryEntity.image}",
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
                    if (value == Strings.edit) {
                      locator<AppRouter>().push(
                        EditCategoryPageRoute(
                            categoryEntity: widget.categoryEntity),
                      );
                    } else if (value == Strings.delete) {
                      BlocProvider.of<CategoriesBloc>(context).add(
                          DeleteCategoryEvent(
                              id: widget.categoryEntity.id.toString()));
                    }
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: Strings.edit,
                      child: Text(Strings.edit),
                    ),
                    const PopupMenuItem(
                      value: Strings.delete,
                      child: Text(Strings.delete),
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
                      widget.categoryEntity.name!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      widget.categoryEntity.description!,
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
