part of 'tables_bloc.dart';

sealed class TablesState extends Equatable {
  const TablesState();
  
  @override
  List<Object> get props => [];
}

final class TablesInitial extends TablesState {}

class TablesLoading extends TablesState{}

class TablesError extends TablesState{
  final String message;

  const TablesError({required this.message});
}

class TablesLoaded extends TablesState{
  final List<TableEntity> tables;

  const TablesLoaded({required this.tables});
}

