import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:reservation_client/domain/entities/table/table_entity.dart';
import '../../../core/services/injectables/locator.dart';
import '../../../core/utils/helpers/helpers.dart';
import '../../../domain/usecases/tables/get_available_tables_usecase.dart';

part 'tables_event.dart';
part 'tables_state.dart';

class TablesBloc extends Bloc<TablesEvent, TablesState> {
  TablesBloc() : super(TablesInitial()) {
    on<GetAvailableTablesEvent>((event, emit) async{
      BuildContext buildContext = HelpUtils.getContext();
      try{
        emit(TablesLoading());
        buildContext.loaderOverlay.show();
        List<TableEntity> tables = await locator<GetAvailableTablesUsecase>().call();
        emit(TablesLoaded(tables: tables));
        buildContext.loaderOverlay.hide();
      }catch(e){
        buildContext.loaderOverlay.hide();
        emit(TablesError(message: e.toString()));
      }
    });
  }
}
