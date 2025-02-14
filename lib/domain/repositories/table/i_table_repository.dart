import 'package:reservation_client/domain/entities/table/table_entity.dart';

import '../../../data/models/request/tables/create_table_request.dart';

abstract class ITableRepository {
  Future<List<TableEntity>> getAvailableTables();
  Future<void> createTable(CreateTableRequest request);
  Future<void> updateTable(CreateTableRequest request);
  Future<void> deleteTable(String id);
}
