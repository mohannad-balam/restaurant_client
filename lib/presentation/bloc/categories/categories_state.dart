part of 'categories_bloc.dart';

sealed class CategoriesState extends Equatable {
  const CategoriesState();
  
  @override
  List<Object> get props => [];
}

final class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState{}

class CategoriesLoaded extends CategoriesState{
  final List<CategoryEntity> categories;

  const CategoriesLoaded({required this.categories});
}

class CategoriesError extends CategoriesState{
  final String message;

  const CategoriesError({required this.message});
}
