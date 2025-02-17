import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_client/core/common/widgets/no_data.dart';
import 'package:reservation_client/core/constant/strings.dart';
import 'package:reservation_client/presentation/bloc/mutual/category_menu_bloc.dart';
import '../../widgets/menu_item.dart';

@RoutePage()
class CategoryMenusPage extends StatefulWidget {
  final String categoryName;
  final String id;
  const CategoryMenusPage(
      {super.key, required this.id, required this.categoryName});

  @override
  State<CategoryMenusPage> createState() => _CategoryMenusPageState();
}

class _CategoryMenusPageState extends State<CategoryMenusPage> {
  @override
  void initState() {
    BlocProvider.of<CategoryMenuBloc>(context)
        .add(GetCategoryMenu(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.categoryName} ${Strings.categoryMenu}"),
      ),
      body: BlocBuilder<CategoryMenuBloc, CategoryMenuState>(
        builder: (context, state) {
          if (state is CategoryMenuLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CategoryMenuLoaded) {
            if (state.categoryMenu.isEmpty) {
              return const NoData();
            }
            return ListView.builder(
              itemCount: state.categoryMenu.length,
              itemBuilder: (BuildContext context, int index) {
                return MenuItem(menuEntity: state.categoryMenu[index]);
              },
            );
          } else if (state is CategoryMenuError) {
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
