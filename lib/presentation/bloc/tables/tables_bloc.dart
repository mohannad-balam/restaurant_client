import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:reservation_client/data/models/request/tables/create_table_request.dart';
import 'package:reservation_client/domain/entities/table/table_entity.dart';
import 'package:reservation_client/domain/usecases/tables/add_table_usecase.dart';
import 'package:reservation_client/domain/usecases/tables/delete_table_usecase.dart';
import 'package:reservation_client/domain/usecases/tables/update_table_usecase.dart';
import 'package:reservation_client/presentation/router/rourter.dart';
import '../../../core/services/injectables/locator.dart';
import '../../../core/utils/helpers/helpers.dart';
import '../../../domain/usecases/tables/get_available_tables_usecase.dart';
import '../../widgets/custom_snackbar.dart';

part 'tables_event.dart';
part 'tables_state.dart';

class TablesBloc extends Bloc<TablesEvent, TablesState> {
  TablesBloc() : super(TablesInitial()) {
    on<GetAvailableTablesEvent>((event, emit) async {
      try {
        emit(TablesLoading());
        List<TableEntity> tables =
            await locator<GetAvailableTablesUsecase>().call();
        emit(TablesLoaded(tables: tables));
      } catch (e) {
        mySnackBar(e.toString(), false);
        emit(TablesError(message: e.toString()));
      }
    });
    on<CreateTableEvent>((event, emit) async {
      BuildContext buildContext = HelpUtils.getContext();
      try {
        buildContext.loaderOverlay.show();
        await locator<AddTableUsecase>().call(params: event.request);
        buildContext.loaderOverlay.hide();
        locator<AppRouter>().maybePop();
        mySnackBar("Added Successfully", true);
        add(GetAvailableTablesEvent());
      } catch (e) {
        buildContext.loaderOverlay.hide();
        mySnackBar(e.toString(), false);
        emit(TablesError(message: e.toString()));
      }
    });
    on<DeleteTableEvent>((event, emit) async {
      BuildContext buildContext = HelpUtils.getContext();
      try {
        buildContext.loaderOverlay.show();
        await locator<DeleteTableUsecase>().call(params: event.id);
        buildContext.loaderOverlay.hide();
        mySnackBar("Deleted Successfully", true);
        add(GetAvailableTablesEvent());
      } catch (e) {
        buildContext.loaderOverlay.hide();
        mySnackBar(e.toString(), false);
        emit(TablesError(message: e.toString()));
      }
    });
    on<UpdateTableEvent>((event, emit) async {
      BuildContext buildContext = HelpUtils.getContext();
      try {
        buildContext.loaderOverlay.show();
        await locator<UpdateTableUsecase>().call(params: event.request);
        buildContext.loaderOverlay.hide();
        locator<AppRouter>().maybePop();
        mySnackBar("Updated Successfully", true);
        add(GetAvailableTablesEvent());
      } catch (e) {
        buildContext.loaderOverlay.hide();
        mySnackBar(e.toString(), false);
        emit(TablesError(message: e.toString()));
      }
    });
  }
}
