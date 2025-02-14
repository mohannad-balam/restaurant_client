import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_client/core/services/injectables/locator.dart';
import 'package:reservation_client/core/theme/app_colors.dart';
import 'package:reservation_client/presentation/router/rourter.dart';
import 'package:reservation_client/presentation/router/rourter.gr.dart';
import 'package:reservation_client/presentation/widgets/table_item.dart';
import '../../bloc/tables/tables_bloc.dart';

@RoutePage()
class TablesPage extends StatefulWidget {
  const TablesPage({super.key});

  @override
  State<TablesPage> createState() => _TablesPageState();
}

class _TablesPageState extends State<TablesPage> {
  @override
  void initState() {
    BlocProvider.of<TablesBloc>(context).add(GetAvailableTablesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tables"),
      ),
      body: BlocBuilder<TablesBloc, TablesState>(
        builder: (context, state) {
          if (state is TablesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TablesLoaded) {
            return ListView.builder(
              itemCount: state.tables.length,
              itemBuilder: (BuildContext context, int index) {
                return TableItem(tableEntity: state.tables[index]);
              },
            );
          } else if (state is TablesError) {
            return Center(
              child: Text(state.message),
            );
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          locator<AppRouter>().push(const AddTablePageRoute());
        },
        child: const Icon(
          Icons.add,
          color: AppColors.secondeyTextColor,
        ),
      ),
    );
  }
}
