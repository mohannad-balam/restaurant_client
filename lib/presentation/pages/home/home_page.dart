import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/common/widgets/home_page_tile.dart';
import '../../../core/services/injectables/locator.dart';
import '../../../core/utils/helpers/helpers.dart';
import '../../../data/models/response/user.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../router/rourter.dart';
import '../../router/rourter.gr.dart';
import '../common/my_drawer.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late User? user;
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AuthBloc>(context).add(GetUserInfoEvent());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AdvancedDrawer(
      backdropColor: theme.primaryColor,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      drawer: const MyDrawer(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          centerTitle: true,
          leading: IconButton(
            onPressed: _advancedDrawerController.showDrawer,
            icon: const Icon(Icons.menu),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // 1. A Welcome Banner or Header
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 24,
                ),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withOpacity(0.9),
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(24),
                  ),
                ),
                child: Column(
                  children: [
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        if (state is UserInfoLoaded) {
                          return Text(
                            'Welcome ${state.user.name}!',
                            style: theme.textTheme.headlineSmall?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }
                        return Container();
                      },
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Manage your reservations, explore menus, and more!',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.white70,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // 2. Main Features as Full-Width Tiles
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    HomePageTile(
                      icon: Icons.category,
                      title: 'Categories',
                      subtitle: 'Browse all categories',
                      onTap: () => locator<AppRouter>().push(
                        const CategoriesPageRoute(),
                      ),
                    ),
                    HomePageTile(
                      icon: Icons.menu_book,
                      title: 'Menu',
                      subtitle: 'See available dishes',
                      onTap: () => locator<AppRouter>().push(
                        const MenusPageRoute(),
                      ),
                    ),
                    HomePageTile(
                      icon: Icons.event_seat,
                      title: 'Reservation',
                      subtitle: 'Create a new reservation',
                      onTap: () => locator<AppRouter>().push(
                        const CreateReservationPageRoute(),
                      ),
                    ),
                    HomePageTile(
                      icon: Icons.history,
                      title: 'Reservation History',
                      subtitle: 'See a history of your reservation',
                      onTap: () => locator<AppRouter>().push(
                        const ReservationsHistoryPageRoute(),
                      ),
                    ),
                    HomePageTile(
                      icon: Icons.phone,
                      title: 'Contact Us',
                      subtitle: 'Get in touch quickly',
                      onTap: () => HelpUtils.tryLaunch(url: "tel:0900000000"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
