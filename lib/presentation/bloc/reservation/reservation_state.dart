part of 'reservation_bloc.dart';

sealed class ReservationState extends Equatable {
  const ReservationState();
  
  @override
  List<Object> get props => [];
}

final class ReservationInitial extends ReservationState {}

class CreateReservationLoading extends ReservationState{}

class CreateReservationLoaded extends ReservationState{
  final String creationMessage;

  const CreateReservationLoaded({required this.creationMessage});
}

class CreateReservationError extends ReservationState{
  final String message;

  const CreateReservationError({required this.message});
}
