import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/menus/menus_bloc.dart';
import '../../widgets/menu_item.dart';

@RoutePage()
class MenusPage extends StatefulWidget {
  const MenusPage({super.key});

  @override
  State<MenusPage> createState() => _MenusPageState();
}


class _MenusPageState extends State<MenusPage> {

  @override
  void initState() {
    BlocProvider.of<MenusBloc>(context).add(
      GetMenusEvent()
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menus"),
      ),
      body: BlocBuilder<MenusBloc, MenusState>(
        builder: (context, state) {
          if(state is MenusLoading){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else if(state is MenusLoaded){
            return ListView.builder(
              itemCount: state.menus.length,
              itemBuilder: (BuildContext context, int index) {
                return MenuItem(menuEntity: state.menus[index]);
              },
            );
          }else if(state is MenusError){
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