import 'package:reservation_client/core/services/injectables/locator.dart';
import 'package:reservation_client/core/common/usecase/usecase.dart';
import 'package:reservation_client/domain/entities/reservation/reservation_entity.dart';
import 'package:reservation_client/domain/repositories/reservation/i_reservation_repository.dart';

class GetUserReservationUsecase
    extends IUseCase<List<ReservationEntity>, dynamic> {
  @override
  Future<List<ReservationEntity>> call({params}) async {
    return await locator<IReservationRepository>().getUserReservation();
  }
}
