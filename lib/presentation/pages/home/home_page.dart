import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_client/core/common/widgets/square_card.dart';
import 'package:reservation_client/core/services/injectables/locator.dart';
import 'package:reservation_client/presentation/router/rourter.dart';
import 'package:reservation_client/presentation/router/rourter.gr.dart';

import '../../bloc/auth/auth_bloc.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    BlocProvider.of<AuthBloc>(context).add(GetUserInfoEvent());
    super.initState();
  }

  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AdvancedDrawer(
      backdropColor: Theme.of(context).primaryColor,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      drawer: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Message and Username
              Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Theme.of(context).primaryColorLight,
                    child: Icon(
                      Icons.person,
                      color: Theme.of(context).primaryColorDark,
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).primaryColorLight,
                            ),
                      ),
                      Text(
                        'Username',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColorLight,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
              // Logout Button
              ElevatedButton(
                onPressed: () {
                  // Add your logout logic here
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Logged out')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.logout),
                    SizedBox(width: 8.0),
                    Text('Logout'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          centerTitle: true,
          leading:
            IconButton(onPressed: (){
              _advancedDrawerController.showDrawer();
            }, icon: const Icon(Icons.menu))
            // IconButton(
            //   onPressed: () {
            //     BlocProvider.of<AuthBloc>(context).add(LogoutEvent());
            //   },
            //   icon: const Icon(Icons.logout_rounded),
            //   tooltip: 'Logout',
            // ),
            // IconButton(
            //   onPressed: () {
            //     locator<AppRouter>().push(UserProfilePageRoute());
            //   },
            //   icon: const Icon(Icons.person),
            //   tooltip: 'profile',
            // ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              // Welcome Message
              Text(
                'Welcome to the Reservation App',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8.0),
              Text(
                'Manage your reservations, explore menus, and more!',
                style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 80),
      
              // Square Cards Section
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  children: [
                    // Categories Card
                    SquareCard(
                      icon: Icons.category,
                      iconColor: theme.colorScheme.secondary,
                      label: 'Categories',
                      textColor: theme.colorScheme.secondary,
                      color: theme.colorScheme.primary,
                      onTap: () {
                        locator<AppRouter>().push(const CategoriesPageRoute());
                      },
                    ),
                    // Menus Card
                    SquareCard(
                      icon: Icons.menu_book,
                      iconColor: theme.colorScheme.secondary,
                      label: 'Menu',
                      textColor: theme.colorScheme.secondary,
                      color: theme.colorScheme.primary,
                      onTap: () {
                        locator<AppRouter>().push(const MenusPageRoute());
                      },
                    ),
                    // Reservation Card
                    SquareCard(
                      icon: Icons.event_seat,
                      iconColor: theme.colorScheme.secondary,
                      label: 'Reservation',
                      textColor: theme.colorScheme.secondary,
                      color: theme.colorScheme.primary,
                      onTap: () {
                        locator<AppRouter>().push(const CreateReservationPageRoute());
                      },
                    ),
                    // Example Future Feature Card
                    SquareCard(
                      icon: Icons.settings,
                      iconColor: theme.colorScheme.primary,
                      label: 'Settings',
                      textColor: theme.colorScheme.primary,
                      color: theme.colorScheme.secondary.withOpacity(0.8),
                      onTap: () {
                        // Navigate to Settings
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
