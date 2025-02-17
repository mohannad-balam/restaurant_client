import 'package:reservation_client/data/models/response/reservation/reservation.dart';
import 'package:reservation_client/domain/entities/reservation/reservation_entity.dart';

class ReservationMapper {
  static ReservationEntity toReservationEntity(ReservationModel model) {
    return ReservationEntity(
      id: model.id,
      firstName: model.firstName,
      lastName: model.lastName,
      email: model.email,
      telNumber: model.telNumber,
      resDate: model.resDate,
      tableId: model.tableId,
      guestNumber: model.guestNumber,
      table: model.table,
    );
  }
}
