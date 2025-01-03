part of 'menus_bloc.dart';

sealed class MenusEvent extends Equatable {
  const MenusEvent();

  @override
  List<Object> get props => [];
}

class GetMenusEvent extends MenusEvent{}