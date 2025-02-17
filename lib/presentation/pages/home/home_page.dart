import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_client/core/common/widgets/square_card.dart';
import 'package:reservation_client/core/services/injectables/locator.dart';
import 'package:reservation_client/data/models/response/user.dart';
import 'package:reservation_client/presentation/pages/common/my_drawer.dart';
import 'package:reservation_client/presentation/router/rourter.dart';
import 'package:reservation_client/presentation/router/rourter.gr.dart';

import '../../../core/services/localDB/local_db_service.dart';
import '../../../core/utils/helpers/helpers.dart';
import '../../bloc/auth/auth_bloc.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late User? user;
  @override
  void initState() {
    user = locator<LocalDBService>().getUserInfo();
    if (user == null) {
      BlocProvider.of<AuthBloc>(context).add(GetUserInfoEvent());
      user = locator<LocalDBService>().getUserInfo();
    }

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
      drawer: MyDrawer(
        user: user,
      ),
      child: Scaffold(
        appBar: AppBar(
            title: const Text('Home'),
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  _advancedDrawerController.showDrawer();
                },
                icon: const Icon(Icons.menu))),
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
                      iconColor: theme.colorScheme.primary,
                      label: 'Categories',
                      textColor: theme.colorScheme.primary,
                      color: theme.colorScheme.secondary,
                      onTap: () {
                        locator<AppRouter>().push(const CategoriesPageRoute());
                      },
                    ),
                    // Menus Card
                    SquareCard(
                      icon: Icons.menu_book,
                      iconColor: theme.colorScheme.primary,
                      label: 'Menu',
                      textColor: theme.colorScheme.primary,
                      color: theme.colorScheme.secondary,
                      onTap: () {
                        locator<AppRouter>().push(const MenusPageRoute());
                      },
                    ),
                    // Reservation Card
                    SquareCard(
                      icon: Icons.event_seat,
                      iconColor: theme.colorScheme.primary,
                      label: 'Reservation',
                      textColor: theme.colorScheme.primary,
                      color: theme.colorScheme.secondary,
                      onTap: () {
                        locator<AppRouter>()
                            .push(const CreateReservationPageRoute());
                      },
                    ),
                    // Example Future Feature Card
                    SquareCard(
                      icon: Icons.phone,
                      iconColor: theme.colorScheme.secondary,
                      label: 'Contact Us',
                      textColor: theme.colorScheme.secondary,
                      color: theme.colorScheme.primary,
                      onTap: () {
                        HelpUtils.tryLaunch(url: "tel:0900000000");
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
