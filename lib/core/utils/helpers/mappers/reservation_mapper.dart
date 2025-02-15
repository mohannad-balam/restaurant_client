import 'package:reservation_client/data/models/response/reservation/reservation.dart';
import 'package:reservation_client/domain/entities/reservation/reservation_entity.dart';

class ReservationMapper {
  static ReservationEntity toMenuEntity(ReservationModel reservationModel) {
    return ReservationEntity(
      id: reservationModel.id,
      firstName: reservationModel.firstName,
      lastName: reservationModel.lastName,
      email: reservationModel.email,
      telNumber: reservationModel.telNumber,
      resDate: reservationModel.resDate,
      tableId: reservationModel.tableId,
      guestNumber: reservationModel.guestNumber,
    );
  }
}
