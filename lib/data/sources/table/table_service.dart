import 'package:reservation_client/core/constant/api_routes.dart';
import 'package:reservation_client/core/enums/http_methods.dart';
import 'package:reservation_client/core/services/http/http_service.dart';
import 'package:reservation_client/core/services/injectables/locator.dart';
import 'package:reservation_client/data/models/request/tables/create_table_request.dart';
import 'package:reservation_client/data/models/response/table/table_model.dart';
import 'package:reservation_client/data/sources/table/i_table_service.dart';

class TableService extends ITableService {
  @override
  Future<List<TableModel>> getAvailableTables() async {
    try {
      List<dynamic> tables = await locator<HttpService>()
          .request(HttpMethods.GET, ApiRoutes.tables, {}, null);
      return tables.map((e) => TableModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> createTable(CreateTableRequest request) async {
    try {
      await locator<HttpService>().request(
          HttpMethods.POST, ApiRoutes.createTable, request.toJson(), null);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteTable(String id) async {
    try {
      await locator<HttpService>()
          .request(HttpMethods.DELETE, ApiRoutes.deleteTable(id), {}, null);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateTable(CreateTableRequest request) async {
    try {
      await locator<HttpService>().request(HttpMethods.PUT,
          ApiRoutes.updateTable(request.id.toString()), request.toJson(), null);
    } catch (e) {
      rethrow;
    }
  }
}
