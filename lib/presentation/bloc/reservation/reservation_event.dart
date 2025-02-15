part of 'reservation_bloc.dart';

sealed class ReservationEvent extends Equatable {
  const ReservationEvent();

  @override
  List<Object> get props => [];
}

class GetReservationsEvent extends ReservationEvent {
  const GetReservationsEvent();
}

class CreateReservationEvent extends ReservationEvent {
  final ReservationRequest reservationRequest;

  const CreateReservationEvent({required this.reservationRequest});
}

class DeleteReservationEvent extends ReservationEvent {
  final String id;

  const DeleteReservationEvent({required this.id});
}

class UpdateReservationEvent extends ReservationEvent {
  final ReservationRequest reservationRequest;

  const UpdateReservationEvent({required this.reservationRequest});
}
