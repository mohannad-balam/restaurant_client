import 'package:reservation_client/data/models/response/table/table_model.dart';
import 'package:reservation_client/domain/entities/table/table_entity.dart';

class TableMapper {

  static TableEntity toTableEntity(TableModel tableModel){
    return TableEntity(
      id: tableModel.id,
      name: tableModel.name,
      guestNumber: tableModel.guestNumber,
      location: tableModel.location,
    );
  }

}