import 'package:reservation_client/data/models/request/reservation/reservation_request.dart';

abstract class IReservationService {
  Future<void> createReservation(ReservationRequest reservationRequest);
}