import 'package:reservation_client/data/models/request/reservation/reservation_request.dart';
import 'package:reservation_client/data/models/response/reservation/reservation.dart';

abstract class IReservationService {
  Future<List<ReservationModel>> getAllReservations();
  Future<void> createReservation(ReservationRequest reservationRequest);
  Future<void> updateReservation(ReservationRequest reservationRequest);
  Future<void> deleteReservation(String id);
}
