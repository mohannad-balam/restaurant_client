part of 'tables_bloc.dart';

sealed class TablesEvent extends Equatable {
  const TablesEvent();

  @override
  List<Object> get props => [];
}

class GetAvailableTablesEvent extends TablesEvent {}

class CreateTableEvent extends TablesEvent {
  final CreateTableRequest request;

  const CreateTableEvent({required this.request});
}

class UpdateTableEvent extends TablesEvent {
  final CreateTableRequest request;

  const UpdateTableEvent({required this.request});
}

class DeleteTableEvent extends TablesEvent {
  final String id;

  const DeleteTableEvent({required this.id});
}
