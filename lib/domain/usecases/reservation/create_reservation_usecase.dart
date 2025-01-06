import 'package:reservation_client/data/models/request/reservation/reservation_request.dart';
import 'package:reservation_client/domain/repositories/reservation/i_reservation_repository.dart';
import '../../../core/services/injectables/locator.dart';
import '../../../core/common/usecase/usecase.dart';

class CreateReservationUsecase extends IUseCase<void, ReservationRequest> {
  @override
  Future<void> call({ReservationRequest? params}) async {
    return await locator<IReservationRepository>().createReservation(params!);
  }
}
