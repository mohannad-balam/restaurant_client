import 'package:flutter/material.dart';
import 'package:reservation_client/core/constant/api_routes.dart';

import '../../domain/entities/menu/menu_entity.dart';

class MenuItem extends StatelessWidget {
  final MenuEntity menuEntity;
  const MenuItem({super.key, required this.menuEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: (){
            // locator<AppRouter>().push(route);
          },
          child: ListTile(
            leading: Image.network("${ApiRoutes.menuUrl}/${menuEntity.image}"),
            title: Text(menuEntity.name.toString()),
            subtitle: Text(menuEntity.description.toString()),
            trailing: Text(menuEntity.price.toString()),
          ),
        ),
        const Divider(),
      ],
    );
  }
}