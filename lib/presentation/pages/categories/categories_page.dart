import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_client/presentation/widgets/category_item.dart';

import '../../bloc/categories/categories_bloc.dart';

@RoutePage()
class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}


class _CategoriesPageState extends State<CategoriesPage> {

  @override
  void initState() {
    BlocProvider.of<CategoriesBloc>(context).add(
      const GetCategoriesEvent()
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
      ),
      body: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          if(state is CategoriesLoading){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else if(state is CategoriesLoaded){
            return ListView.builder(
              itemCount: state.categories.length,
              itemBuilder: (BuildContext context, int index) {
                return CategoryItem(categoryEntity: state.categories[index]);
              },
            );
          }else if(state is CategoriesError){
            return Center(
              child: Text(state.message),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}