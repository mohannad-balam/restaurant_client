import 'package:reservation_client/domain/repositories/reservation/i_reservation_repository.dart';
import '../../../core/services/injectables/locator.dart';
import '../../../core/common/usecase/usecase.dart';

class DeleteReservationUsecase extends IUseCase<void, String> {
  @override
  Future<void> call({String? params}) async {
    return await locator<IReservationRepository>().deleteReservation(params!);
  }
}
