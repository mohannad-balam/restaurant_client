import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_client/core/services/injectables/locator.dart';
import 'package:reservation_client/core/theme/app_colors.dart';
import 'package:reservation_client/domain/entities/table/table_entity.dart';
import 'package:reservation_client/presentation/bloc/tables/tables_bloc.dart';
import 'package:reservation_client/presentation/router/rourter.dart';
import 'package:reservation_client/presentation/router/rourter.gr.dart';

class TableItem extends StatelessWidget {
  final TableEntity tableEntity;

  const TableItem({
    super.key,
    required this.tableEntity,
  });

  Color getLocationColor(String status) {
    return status == 'front'
        ? AppColors.successColor
        : status == 'inside'
            ? AppColors.secondColor
            : AppColors.warningColor;
  }

  Color getStatusColor(String status) {
    return status == 'available'
        ? AppColors.successColor
        : status == 'pending'
            ? Colors.amber
            : AppColors.warningColor;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    tableEntity.name!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkBackroundContinarColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    tableEntity.location!,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: getLocationColor(tableEntity.location!),
                    ),
                  ),
                ],
              ),
            ),
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Text(
                "${tableEntity.guestNumber.toString()} guests",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                tableEntity.status.toString(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: getStatusColor(tableEntity.status.toString()),
                ),
              ),
            ]),
            const SizedBox(width: 10),
            PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'edit') {
                  locator<AppRouter>()
                      .push(EditTablePageRoute(tableEntity: tableEntity));
                } else if (value == 'delete') {
                  BlocProvider.of<TablesBloc>(context)
                      .add(DeleteTableEvent(id: tableEntity.id.toString()));
                }
              },
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem(
                  value: 'edit',
                  child: Row(
                    children: [
                      Icon(Icons.edit, color: Colors.blue),
                      SizedBox(width: 8),
                      Text('Edit'),
                    ],
                  ),
                ),
                const PopupMenuItem(
                  value: 'delete',
                  child: Row(
                    children: [
                      Icon(Icons.delete, color: Colors.red),
                      SizedBox(width: 8),
                      Text('Delete'),
                    ],
                  ),
                ),
              ],
              icon: const Icon(Icons.more_vert, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
