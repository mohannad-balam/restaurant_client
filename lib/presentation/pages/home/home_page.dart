import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              BlocProvider.of<AuthBloc>(context).add(LogoutEvent());
            },
            icon: const Icon(Icons.logout_rounded),
            tooltip: 'Logout',
          ),
          IconButton(
            onPressed: () {
              locator<AppRouter>().push(UserProfilePageRoute());
            },
            icon: const Icon(Icons.person),
            tooltip: 'profile',
          ),
        ],
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
    );
  }
}
