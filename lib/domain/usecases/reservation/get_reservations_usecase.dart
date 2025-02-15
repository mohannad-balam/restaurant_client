import 'package:reservation_client/domain/entities/reservation/reservation_entity.dart';
import 'package:reservation_client/domain/repositories/reservation/i_reservation_repository.dart';
import '../../../core/services/injectables/locator.dart';
import '../../../core/common/usecase/usecase.dart';

class GetReservationsUsecase
    extends IUseCase<List<ReservationEntity>, dynamic> {
  @override
  Future<List<ReservationEntity>> call({params}) async {
    return await locator<IReservationRepository>().getAllReservations();
  }
}
