import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_client/core/constant/strings.dart';
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
  String selectedStatus = Strings.all; // Default selected filter

  @override
  void initState() {
    BlocProvider.of<TablesBloc>(context).add(GetAvailableTablesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Strings.tables)),
      body: Column(
        children: [
          // Scrollable Filter Chips
          SizedBox(
            height: 50, // Adjust height as needed
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  _buildChip(Strings.all),
                  _buildChip(Strings.availabel),
                  _buildChip(Strings.pending),
                  _buildChip(Strings.unAvailable),
                ],
              ),
            ),
          ),

          // Tables List
          Expanded(
            child: BlocBuilder<TablesBloc, TablesState>(
              builder: (context, state) {
                if (state is TablesLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is TablesLoaded) {
                  // Filter tables based on selected status
                  final filteredTables = state.tables.where((table) {
                    if (selectedStatus == Strings.all) return true;
                    return table.status?.toLowerCase() ==
                        selectedStatus.toLowerCase();
                  }).toList();

                  return ListView.builder(
                    itemCount: filteredTables.length,
                    itemBuilder: (context, index) {
                      return TableItem(tableEntity: filteredTables[index]);
                    },
                  );
                } else if (state is TablesError) {
                  return Center(child: Text(state.message));
                }
                return const SizedBox();
              },
            ),
          ),
        ],
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

  // Chip Widget
  Widget _buildChip(String label) {
    final bool isSelected = selectedStatus == label;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ChoiceChip(
        label: Text(label),
        selected: isSelected,
        selectedColor: AppColors.mainColor,
        backgroundColor: Colors.white,
        labelStyle: TextStyle(
          color: isSelected ? Colors.white : AppColors.mainColor,
          fontWeight: FontWeight.bold,
        ),
        checkmarkColor: AppColors.secondeyTextColor,
        shape:
            const StadiumBorder(side: BorderSide(color: AppColors.mainColor)),
        onSelected: (bool selected) {
          if (selected) {
            setState(() {
              selectedStatus = label;
            });
          }
        },
      ),
    );
  }
}
