part of 'menus_bloc.dart';

sealed class MenusState extends Equatable {
  const MenusState();

  @override
  List<Object> get props => [];
}

final class MenusInitial extends MenusState {}

class MenusLoading extends MenusState {}

class MenusLoaded extends MenusState {
  final List<MenuEntity> menus;

  const MenusLoaded({required this.menus});
}

class MenusError extends MenusState {
  final String message;

  const MenusError({required this.message});
}
