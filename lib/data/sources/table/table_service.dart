import 'package:reservation_client/core/constant/api_routes.dart';
import 'package:reservation_client/core/enums/http_methods.dart';
import 'package:reservation_client/core/services/http/http_service.dart';
import 'package:reservation_client/core/services/injectables/locator.dart';
import 'package:reservation_client/data/models/response/table/table_model.dart';
import 'package:reservation_client/data/sources/table/i_table_service.dart';

class TableService extends ITableService{
  @override
  Future<List<TableModel>> getAvailableTables() async{
    try{
      List<dynamic> tables = await locator<HttpService>().request(HttpMethods.GET, ApiRoutes.getAvailableTables, {});
      return tables.map((e) => TableModel.fromJson(e)).toList();
    }catch(e){
      rethrow;
    }
  }
  
}