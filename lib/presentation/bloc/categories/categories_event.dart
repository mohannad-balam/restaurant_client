part of 'categories_bloc.dart';

sealed class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  @override
  List<Object> get props => [];
}

class GetCategoriesEvent extends CategoriesEvent {
  const GetCategoriesEvent();
}

class CreateCategoryEvent extends CategoriesEvent {
  final FormData request;
  const CreateCategoryEvent({required this.request});
}

class UpdateCategoryEvent extends CategoriesEvent {
  final CreateCategoryRequest request;
  const UpdateCategoryEvent({required this.request});
}

class DeleteCategoryEvent extends CategoriesEvent {
  final String id;
  const DeleteCategoryEvent({required this.id});
}
