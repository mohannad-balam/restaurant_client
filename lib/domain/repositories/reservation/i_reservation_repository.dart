import 'package:reservation_client/data/models/request/reservation/reservation_request.dart';

abstract class IReservationRepository {
  Future<void> createReservation(ReservationRequest reservationRequest);
}