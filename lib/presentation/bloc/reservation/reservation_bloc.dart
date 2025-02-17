import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:reservation_client/core/constant/strings.dart';
import 'package:reservation_client/core/services/injectables/locator.dart';
import 'package:reservation_client/data/models/request/reservation/reservation_request.dart';
import 'package:reservation_client/domain/entities/reservation/reservation_entity.dart';
import 'package:reservation_client/domain/usecases/reservation/delete_reservation_usecase.dart';
import 'package:reservation_client/domain/usecases/reservation/get_reservations_usecase.dart';
import 'package:reservation_client/domain/usecases/reservation/update_reservation_usecase.dart';
import 'package:reservation_client/presentation/router/rourter.dart';
import 'package:reservation_client/presentation/widgets/my_snackbar.dart';
import '../../../core/utils/helpers/helpers.dart';
import '../../../domain/usecases/reservation/create_reservation_usecase.dart';
part 'reservation_event.dart';
part 'reservation_state.dart';

class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  ReservationBloc() : super(ReservationInitial()) {
    on<CreateReservationEvent>((event, emit) async {
      BuildContext buildContext = HelpUtils.getContext();
      try {
        buildContext.loaderOverlay.show();
        await locator<CreateReservationUsecase>()
            .call(params: event.reservationRequest);
        buildContext.loaderOverlay.hide();
        locator<AppRouter>().maybePop();
        add(const GetReservationsEvent());
      } catch (e) {
        buildContext.loaderOverlay.hide();
        mySnackBar(e.toString(), error: true);
        emit(CreateReservationError(message: e.toString()));
      }
    });
    on<GetReservationsEvent>((event, emit) async {
      try {
        emit(ReservationsLoading());
        List<ReservationEntity> reservations =
            await locator<GetReservationsUsecase>().call();
        emit(ReservationsLoaded(reservations: reservations));
      } catch (e) {
        mySnackBar(e.toString(), error: true);
        emit(CreateReservationError(message: e.toString()));
      }
    });
    on<DeleteReservationEvent>((event, emit) async {
      BuildContext buildContext = HelpUtils.getContext();
      try {
        buildContext.loaderOverlay.show();
        await locator<DeleteReservationUsecase>().call(params: event.id);
        buildContext.loaderOverlay.hide();
        mySnackBar(Strings.successMessage, success: true);
        add(const GetReservationsEvent());
      } catch (e) {
        buildContext.loaderOverlay.hide();
        mySnackBar(e.toString(), error: true);
        emit(CreateReservationError(message: e.toString()));
      }
    });
    on<UpdateReservationEvent>((event, emit) async {
      BuildContext buildContext = HelpUtils.getContext();
      try {
        buildContext.loaderOverlay.show();
        await locator<UpdateReservationUsecase>()
            .call(params: event.reservationRequest);
        buildContext.loaderOverlay.hide();
        locator<AppRouter>().maybePop();
        mySnackBar(Strings.successMessage, success: true);
        add(const GetReservationsEvent());
      } catch (e) {
        buildContext.loaderOverlay.hide();
        mySnackBar(e.toString(), error: true);
        emit(CreateReservationError(message: e.toString()));
      }
    });
  }
}
