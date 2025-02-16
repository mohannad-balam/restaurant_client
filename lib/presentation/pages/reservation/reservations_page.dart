import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_client/core/services/injectables/locator.dart';
import 'package:reservation_client/core/theme/app_colors.dart';
import 'package:reservation_client/presentation/router/rourter.dart';
import 'package:reservation_client/presentation/router/rourter.gr.dart';

import '../../bloc/reservation/reservation_bloc.dart';
import '../../widgets/reservation_item.dart';

@RoutePage()
class ReservationsPage extends StatefulWidget {
  const ReservationsPage({super.key});

  @override
  State<ReservationsPage> createState() => _ReservationsPageState();
}

class _ReservationsPageState extends State<ReservationsPage> {
  @override
  void initState() {
    super.initState();
    context.read<ReservationBloc>().add((const GetReservationsEvent()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Reservations")),
      body: BlocBuilder<ReservationBloc, ReservationState>(
        builder: (context, state) {
          if (state is ReservationsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ReservationsLoaded) {
            return ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: state.reservations.length,
              itemBuilder: (context, index) {
                final reservation = state.reservations[index];
                return ReservationItem(reservation: reservation);
              },
            );
          } else if (state is ReservationsError) {
            return Center(child: Text("Error: ${state.message}"));
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          locator<AppRouter>().push(const CreateReservationPageRoute());
        },
        child: const Icon(
          Icons.add,
          color: AppColors.secondeyTextColor,
        ),
      ),
    );
  }
}
