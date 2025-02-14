import 'package:reservation_client/core/services/injectables/locator.dart';
import 'package:reservation_client/core/common/usecase/usecase.dart';
import 'package:reservation_client/domain/repositories/table/i_table_repository.dart';

class DeleteTableUsecase extends IUseCase<void, String> {
  @override
  Future<void> call({String? params}) async {
    return await locator<ITableRepository>().deleteTable(params!);
  }
}
