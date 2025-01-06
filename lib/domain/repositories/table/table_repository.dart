import 'package:reservation_client/core/services/injectables/locator.dart';
import 'package:reservation_client/core/utils/helpers/mappers/table_mapper.dart';
import 'package:reservation_client/data/models/response/table/table_model.dart';
import 'package:reservation_client/data/sources/table/i_table_service.dart';
import 'package:reservation_client/domain/entities/table/table_entity.dart';
import 'package:reservation_client/domain/repositories/table/i_table_repository.dart';

class TableRepository extends ITableRepository{
  @override
  Future<List<TableEntity>> getAvailableTables() async{
    try{
      List<TableModel> tables = await locator<ITableService>().getAvailableTables();
      return tables.map((e) => TableMapper.toTableEntity(e)).toList();
    }catch(e){
      rethrow;
    }

  }
  
}