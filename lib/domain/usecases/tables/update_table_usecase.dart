import 'package:reservation_client/core/services/injectables/locator.dart';
import 'package:reservation_client/core/common/usecase/usecase.dart';
import 'package:reservation_client/data/models/request/tables/create_table_request.dart';
import 'package:reservation_client/domain/repositories/table/i_table_repository.dart';

class UpdateTableUsecase extends IUseCase<void, CreateTableRequest> {
  @override
  Future<void> call({CreateTableRequest? params}) async {
    return await locator<ITableRepository>().updateTable(params!);
  }
}
