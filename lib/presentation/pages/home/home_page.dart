import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_client/core/common/widgets/square_card.dart';
import 'package:reservation_client/core/constant/strings.dart';
import 'package:reservation_client/core/services/injectables/locator.dart';
import 'package:reservation_client/presentation/pages/common/my_drawer.dart';
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
    super.initState();
    BlocProvider.of<AuthBloc>(context).add(GetUserInfoEvent());
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
      drawer: const MyDrawer(),
      child: Scaffold(
        appBar: AppBar(
            title: const Text(Strings.home),
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
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is UserInfoLoaded) {
                    return Text(
                      '${Strings.welcome} ${state.user.name}',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary,
                      ),
                      textAlign: TextAlign.center,
                    );
                  }
                  return Container();
                },
              ),
              const SizedBox(height: 8.0),
              Text(
                Strings.appMessage,
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
                      label: Strings.categories,
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
                      label: Strings.menus,
                      textColor: theme.colorScheme.primary,
                      color: theme.colorScheme.secondary,
                      onTap: () {
                        locator<AppRouter>().push(const MenusPageRoute());
                      },
                    ),
                    // Reservation Card
                    SquareCard(
                      icon: Icons.book,
                      iconColor: theme.colorScheme.primary,
                      label: Strings.reservations,
                      textColor: theme.colorScheme.primary,
                      color: theme.colorScheme.secondary,
                      onTap: () {
                        locator<AppRouter>()
                            .push(const ReservationsPageRoute());
                      },
                    ),
                    // Example Future Feature Card
                    SquareCard(
                      icon: Icons.table_bar,
                      iconColor: theme.colorScheme.primary,
                      label: Strings.tables,
                      textColor: theme.colorScheme.primary,
                      color: theme.colorScheme.secondary,
                      onTap: () {
                        locator<AppRouter>().push(const TablesPageRoute());
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
