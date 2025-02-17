import 'package:reservation_client/core/services/injectables/locator.dart';
import 'package:reservation_client/core/common/usecase/usecase.dart';
import 'package:reservation_client/domain/repositories/reservation/i_reservation_repository.dart';

class DeleteUserReservationUsecase extends IUseCase<void, String> {
  @override
  Future<void> call({String? params}) async {
    return await locator<IReservationRepository>()
        .deleteUserReservation(params!);
  }
}
