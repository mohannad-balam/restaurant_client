part of 'category_menu_bloc.dart';

sealed class CategoryMenuEvent extends Equatable {
  const CategoryMenuEvent();

  @override
  List<Object> get props => [];
}

class GetCategoryMenu extends CategoryMenuEvent{
  final String id;

  const GetCategoryMenu({required this.id});
}