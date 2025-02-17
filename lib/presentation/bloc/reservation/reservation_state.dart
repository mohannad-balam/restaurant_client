part of 'reservation_bloc.dart';

sealed class ReservationState extends Equatable {
  const ReservationState();

  @override
  List<Object> get props => [];
}

final class ReservationInitial extends ReservationState {}

class ReservationsLoading extends ReservationState {}

class ReservationsLoaded extends ReservationState {
  final List<ReservationEntity> reservations;

  const ReservationsLoaded({required this.reservations});
}

class ReservationsError extends ReservationState {
  final String message;

  const ReservationsError({required this.message});
}
