import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_client/core/common/widgets/no_data.dart';
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
    BlocProvider.of<CategoriesBloc>(context).add(const GetCategoriesEvent());
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
          if (state is CategoriesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CategoriesLoaded) {
            if (state.categories.isEmpty) {
              return const NoData();
            }
            return GridView.builder(
              itemCount: state.categories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Two items per row
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3 / 4, // Adjust for the desired card height
              ),
              itemBuilder: (context, index) {
                return CategoryItem(categoryEntity: state.categories[index]);
              },
            );
          } else if (state is CategoriesError) {
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
