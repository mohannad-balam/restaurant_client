import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_client/core/services/injectables/locator.dart';
import 'package:reservation_client/presentation/bloc/reservation/reservation_bloc.dart';
import 'package:reservation_client/presentation/router/rourter.dart';
import 'package:reservation_client/presentation/router/rourter.gr.dart';

import '../../core/theme/app_colors.dart';
import '../../domain/entities/reservation/reservation_entity.dart';

class ReservationItem extends StatelessWidget {
  final ReservationEntity reservation;
  const ReservationItem({
    super.key,
    required this.reservation,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        title: Text(
          "${reservation.firstName} ${reservation.lastName}",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Email: ${reservation.email}"),
            Text("Phone: ${reservation.telNumber}"),
            Text("Date: ${reservation.resDate}"),
            Text(
              "Guests: ${reservation.guestNumber}",
              style: const TextStyle(color: AppColors.mainColor),
            ),
          ],
        ),
        leading: CircleAvatar(
          backgroundColor: AppColors.mainColor,
          child: Text(
            reservation.firstName![0].toUpperCase(),
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'edit') {
              locator<AppRouter>()
                  .push(EditReservationPageRoute(reservation: reservation));
            } else if (value == 'delete') {
              BlocProvider.of<ReservationBloc>(context)
                  .add(DeleteReservationEvent(id: reservation.id.toString()));
            }
          },
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'edit',
              child: ListTile(
                leading: Icon(Icons.edit, color: Colors.blue),
                title: Text("Edit"),
              ),
            ),
            const PopupMenuItem(
              value: 'delete',
              child: ListTile(
                leading: Icon(Icons.delete, color: Colors.red),
                title: Text("Delete"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
