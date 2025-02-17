import 'package:reservation_client/core/services/injectables/locator.dart';
import 'package:reservation_client/core/utils/helpers/mappers/reservation_mapper.dart';
import 'package:reservation_client/data/models/request/reservation/reservation_request.dart';
import 'package:reservation_client/data/models/response/reservation/reservation.dart';
import 'package:reservation_client/data/sources/reservation/i_reservation_service.dart';
import 'package:reservation_client/domain/entities/reservation/reservation_entity.dart';
import 'package:reservation_client/domain/repositories/reservation/i_reservation_repository.dart';

class ReservationRepository extends IReservationRepository {
  @override
  Future<void> createReservation(ReservationRequest reservationRequest) async {
    try {
      await locator<IReservationService>()
          .createReservation(reservationRequest);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ReservationEntity>> getUserReservation() async {
    try {
      List<ReservationModel> reservations =
          await locator<IReservationService>().getUserReservation();
      return reservations
          .map((e) => ReservationMapper.toReservationEntity(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteUserReservation(String id) async {
    try {
      await locator<IReservationService>().deleteUserReservation(id);
    } catch (e) {
      rethrow;
    }
  }
}
