import 'package:reservation_client/data/models/response/table/table_model.dart';

abstract class ITableService {
  Future<List<TableModel>> getAvailableTables();
}