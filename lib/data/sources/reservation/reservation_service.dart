import 'package:reservation_client/core/constant/api_routes.dart';
import 'package:reservation_client/core/enums/http_methods.dart';
import 'package:reservation_client/core/services/http/http_service.dart';
import 'package:reservation_client/core/services/injectables/locator.dart';
import 'package:reservation_client/data/models/request/reservation/reservation_request.dart';
import 'package:reservation_client/data/sources/reservation/i_reservation_service.dart';

class ReservationService extends IReservationService {
  @override
  Future<void> createReservation(ReservationRequest reservationRequest) async {
    try {
      await locator<HttpService>().request(
        HttpMethods.POST,
        ApiRoutes.createReservation,
        reservationRequest.toJson(),
      );
    } catch (e) {
      rethrow;
    }
  }
}
