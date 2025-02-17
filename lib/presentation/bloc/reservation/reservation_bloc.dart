import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:reservation_client/core/services/injectables/locator.dart';
import 'package:reservation_client/data/models/request/reservation/reservation_request.dart';
import 'package:reservation_client/domain/entities/reservation/reservation_entity.dart';
import 'package:reservation_client/domain/usecases/reservation/delete_user_reservation_usecase.dart';
import 'package:reservation_client/domain/usecases/reservation/get_user_reservation_usecase.dart';
import 'package:reservation_client/presentation/router/rourter.dart';
import 'package:reservation_client/presentation/router/rourter.gr.dart';

import '../../../core/utils/helpers/helpers.dart';
import '../../../domain/usecases/reservation/create_reservation_usecase.dart';
import '../../widgets/snack_bar/my_snack_bar.dart';
part 'reservation_event.dart';
part 'reservation_state.dart';

class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  ReservationBloc() : super(ReservationInitial()) {
    on<CreateReservationEvent>((event, emit) async {
      BuildContext buildContext = HelpUtils.getContext();
      try {
        buildContext.loaderOverlay.show();
        await locator<CreateReservationUsecase>()
            .call(params: event.reservationRequest)
            .then((onValue) {
          buildContext.loaderOverlay.hide();
          locator<AppRouter>().replace(const ConfirmedPageRoute());
        });
      } on DioException catch (e) {
        buildContext.loaderOverlay.hide();
        mySnackBar(e.response?.data, error: true);
        emit(ReservationsError(message: e.toString()));
      }
    });
    on<GetUserReservationsEvent>((event, emit) async {
      try {
        emit(ReservationsLoading());
        List<ReservationEntity> reservations =
            await locator<GetUserReservationUsecase>().call();
        emit(ReservationsLoaded(reservations: reservations));
      } catch (e) {
        mySnackBar(e.toString(), error: true);
        emit(ReservationsError(message: e.toString()));
      }
    });
    on<DeleteReservationEvent>((event, emit) async {
      BuildContext context = HelpUtils.getContext();
      try {
        context.loaderOverlay.show();
        await locator<DeleteUserReservationUsecase>().call(params: event.id);
        context.loaderOverlay.hide();
        add(const GetUserReservationsEvent());
        mySnackBar("Deleted Successfully!", success: true);
      } catch (e) {
        context.loaderOverlay.hide();
        mySnackBar(e.toString(), error: true);
      }
    });
  }
}
