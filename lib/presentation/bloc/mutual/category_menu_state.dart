part of 'category_menu_bloc.dart';

sealed class CategoryMenuState extends Equatable {
  const CategoryMenuState();
  
  @override
  List<Object> get props => [];
}

final class CategoryMenuInitial extends CategoryMenuState {}

class CategoryMenuLoading extends CategoryMenuState{}

class CategoryMenuLoaded extends CategoryMenuState{
  final List<MenuEntity> categoryMenu;

  const CategoryMenuLoaded({required this.categoryMenu});
}

class CategoryMenuError extends CategoryMenuState{
  final String message;

  const CategoryMenuError({required this.message});
}