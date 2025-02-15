part of 'menus_bloc.dart';

sealed class MenusEvent extends Equatable {
  const MenusEvent();

  @override
  List<Object> get props => [];
}

class GetMenusEvent extends MenusEvent {}

class CreateMenuEvent extends MenusEvent {
  final FormData request;

  const CreateMenuEvent({required this.request});
}

class UpdateMenuEvent extends MenusEvent {
  final CreateMenuRequest request;

  const UpdateMenuEvent({required this.request});
}

class DeleteMenuEvent extends MenusEvent {
  final String id;

  const DeleteMenuEvent({required this.id});
}
