import 'package:reservation_client/data/models/request/tables/create_table_request.dart';
import 'package:reservation_client/data/models/response/table/table_model.dart';

abstract class ITableService {
  Future<List<TableModel>> getAvailableTables();
  Future<void> createTable(CreateTableRequest request);
  Future<void> updateTable(CreateTableRequest request);
  Future<void> deleteTable(String id);
}
