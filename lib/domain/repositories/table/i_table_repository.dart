import 'package:reservation_client/domain/entities/table/table_entity.dart';

abstract class ITableRepository {
  Future<List<TableEntity>> getAvailableTables();
}