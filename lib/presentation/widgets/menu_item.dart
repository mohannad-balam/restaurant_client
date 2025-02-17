import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:reservation_client/core/theme/app_colors.dart';
import 'package:reservation_client/domain/entities/menu/menu_entity.dart';

import '../../core/constant/api_routes.dart';

class MenuItem extends StatelessWidget {
  final MenuEntity menuEntity;

  const MenuItem({
    Key? key,
    required this.menuEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentTheme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 3,
      child: InkWell(
        onTap: () {
          // TODO: Optionally navigate to a details page or handle a tap event.
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              // Menu Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: "${ApiRoutes.menuUrl}/${menuEntity.image}",
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      Container(color: Colors.grey[200]),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.image_not_supported,
                    size: 48,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(width: 12),

              // Menu Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Menu Name
                    Text(
                      menuEntity.name ?? '',
                      style: currentTheme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.mainColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),

                    // Menu Description
                    Text(
                      menuEntity.description ?? '',
                      style: currentTheme.textTheme.bodyMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),

                    // Menu Price
                    Text(
                      "${menuEntity.price ?? 0} D.L",
                      style: currentTheme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.mainColor,
                      ),
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
