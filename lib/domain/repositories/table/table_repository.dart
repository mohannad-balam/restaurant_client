import 'package:reservation_client/core/services/injectables/locator.dart';
import 'package:reservation_client/core/utils/helpers/mappers/table_mapper.dart';
import 'package:reservation_client/data/models/request/tables/create_table_request.dart';
import 'package:reservation_client/data/models/response/table/table_model.dart';
import 'package:reservation_client/data/sources/table/i_table_service.dart';
import 'package:reservation_client/domain/entities/table/table_entity.dart';
import 'package:reservation_client/domain/repositories/table/i_table_repository.dart';

class TableRepository extends ITableRepository {
  @override
  Future<List<TableEntity>> getAvailableTables() async {
    try {
      List<TableModel> tables =
          await locator<ITableService>().getAvailableTables();
      return tables.map((e) => TableMapper.toTableEntity(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> createTable(CreateTableRequest request) async {
    try {
      await locator<ITableService>().createTable(request);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteTable(String id) async {
    try {
      await locator<ITableService>().deleteTable(id);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateTable(CreateTableRequest request) async {
    try {
      await locator<ITableService>().updateTable(request);
    } catch (e) {
      rethrow;
    }
  }
}
