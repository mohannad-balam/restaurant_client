import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_client/core/common/widgets/no_data.dart';
import '../../bloc/menus/menus_bloc.dart';
import '../../widgets/menu_item.dart';

@RoutePage()
class MenusPage extends StatefulWidget {
  const MenusPage({Key? key}) : super(key: key);

  @override
  State<MenusPage> createState() => _MenusPageState();
}

class _MenusPageState extends State<MenusPage> {
  @override
  void initState() {
    super.initState();
    // Fetch the menus when this page initializes.
    BlocProvider.of<MenusBloc>(context).add(GetMenusEvent());
  }

  /// Allows users to pull down and refresh the menu list manually.
  Future<void> _onRefresh() async {
    BlocProvider.of<MenusBloc>(context).add(GetMenusEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menus"),
        centerTitle: true,
      ),
      body: BlocBuilder<MenusBloc, MenusState>(
        builder: (context, state) {
          if (state is MenusLoading) {
            // Display a loading spinner while fetching data.
            return const Center(child: CircularProgressIndicator());
          } else if (state is MenusLoaded) {
            // Show a friendly message if the list is empty.
            if (state.menus.isEmpty) {
              return const NoData();
            }
            if (state.menus.isEmpty) {
              return const Center(
                child: Text("No menus available at the moment."),
              );
            }

            // Wrap the list in a RefreshIndicator for pull-to-refresh.
            return RefreshIndicator(
              onRefresh: _onRefresh,
              child: ListView.builder(
                itemCount: state.menus.length,
                itemBuilder: (context, index) {
                  return MenuItem(menuEntity: state.menus[index]);
                },
              ),
            );
          } else if (state is MenusError) {
            // Show an error message and a retry button.
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(state.message),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<MenusBloc>(context).add(GetMenusEvent());
                    },
                    child: const Text("Retry"),
                  ),
                ],
              ),
            );
          }

          // Default fallback for unexpected states.
          return const SizedBox();
        },
      ),
    );
  }
}
