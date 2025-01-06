import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:reservation_client/core/services/injectables/locator.dart';
import 'package:reservation_client/data/models/request/reservation/reservation_request.dart';
import 'package:reservation_client/presentation/router/rourter.dart';
import 'package:reservation_client/presentation/router/rourter.gr.dart';

import '../../../core/utils/helpers/helpers.dart';
import '../../../domain/usecases/reservation/create_reservation_usecase.dart';
part 'reservation_event.dart';
part 'reservation_state.dart';

class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  ReservationBloc() : super(ReservationInitial()) {
    on<CreateReservationEvent>((event, emit) async{
      BuildContext buildContext = HelpUtils.getContext();
      try{
        buildContext.loaderOverlay.show();
        await locator<CreateReservationUsecase>().call(params: event.reservationRequest);
        buildContext.loaderOverlay.hide();
        locator<AppRouter>().replace(const ConfirmedPageRoute());
      }catch(e){
        buildContext.loaderOverlay.hide();
        emit(CreateReservationError(message: e.toString()));
      }
    });
  }
}
