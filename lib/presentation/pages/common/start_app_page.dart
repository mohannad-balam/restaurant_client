import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:reservation_client/core/services/injectables/locator.dart';
import 'package:reservation_client/core/utils/helpers/helpers.dart';
import 'package:reservation_client/presentation/router/rourter.gr.dart';

import '../../router/rourter.dart';

@RoutePage()
class StartAppPage extends StatelessWidget {
  const StartAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.secondary,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App Title
            Text(
              'Welcome to Restaurant Reservation',
              style: theme.textTheme.titleLarge?.copyWith(
                color: theme.colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 40
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40.0),
            // Cards Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSquareCard(
                  context,
                  icon: Icons.login,
                  iconColor: theme.colorScheme.secondary,
                  label: 'Login',
                  textColor: theme.colorScheme.secondary,
                  color: theme.colorScheme.primary,
                  onTap: () {
                    locator<AppRouter>().push(LoginPageRoute());
                  },
                ),
                _buildSquareCard(
                  context,
                  icon: Icons.call,
                  iconColor: theme.colorScheme.primary,
                  label: 'Contact Us',
                  textColor: theme.colorScheme.primary,
                  color: theme.colorScheme.secondary,
                  onTap: () {
                    HelpUtils.tryLaunch(url: "tel:0900000000");
                  },
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            // Footer Text
            Text(
              'Making Reservations Easy & Quick!',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onPrimary.withOpacity(0.8),
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSquareCard(BuildContext context,
      {required IconData icon,
      required String label,
      required Color iconColor,
      required Color textColor,
      required Color color,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48.0, color: iconColor,),
            const SizedBox(height: 8.0),
            Text(
              label,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
