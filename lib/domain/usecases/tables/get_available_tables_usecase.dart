import 'package:reservation_client/core/services/injectables/locator.dart';
import 'package:reservation_client/core/common/usecase/usecase.dart';
import 'package:reservation_client/domain/entities/table/table_entity.dart';
import 'package:reservation_client/domain/repositories/table/i_table_repository.dart';

class GetAvailableTablesUsecase extends IUseCase<List<TableEntity>,dynamic>{
  @override
  Future<List<TableEntity>> call({params}) async{
    return await locator<ITableRepository>().getAvailableTables();
  }
}