part of 'reservation_bloc.dart';

sealed class ReservationEvent extends Equatable {
  const ReservationEvent();

  @override
  List<Object> get props => [];
}

class CreateReservationEvent extends ReservationEvent{
  final ReservationRequest reservationRequest;

  const CreateReservationEvent({required this.reservationRequest});
}
