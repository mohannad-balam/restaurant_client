import 'package:reservation_client/data/models/request/reservation/reservation_request.dart';
import 'package:reservation_client/domain/entities/reservation/reservation_entity.dart';

abstract class IReservationRepository {
  Future<List<ReservationEntity>> getUserReservation();
  Future<void> createReservation(ReservationRequest reservationRequest);
  Future<void> deleteUserReservation(String id);
}
