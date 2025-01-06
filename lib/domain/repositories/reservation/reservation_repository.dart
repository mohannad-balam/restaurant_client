import 'package:reservation_client/core/services/injectables/locator.dart';
import 'package:reservation_client/data/models/request/reservation/reservation_request.dart';
import 'package:reservation_client/data/sources/reservation/i_reservation_service.dart';
import 'package:reservation_client/domain/repositories/reservation/i_reservation_repository.dart';

class ReservationRepository extends IReservationRepository{
  @override
  Future<void> createReservation(ReservationRequest reservationRequest) async{
    try{
      await locator<IReservationService>().createReservation(reservationRequest);
    }catch(e){
      rethrow;
    }
  }
  
}