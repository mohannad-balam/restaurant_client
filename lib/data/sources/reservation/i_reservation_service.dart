import 'package:reservation_client/data/models/request/reservation/reservation_request.dart';
import 'package:reservation_client/data/models/response/reservation/reservation.dart';

abstract class IReservationService {
  Future<List<ReservationModel>> getUserReservation();
  Future<void> createReservation(ReservationRequest reservationRequest);
  Future<void> deleteUserReservation(String id);
}
