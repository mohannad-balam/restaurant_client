import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:reservation_client/core/common/widgets/square_card.dart';
import 'package:reservation_client/core/constant/strings.dart';
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
              Strings.welcomeTo,
              style: theme.textTheme.titleLarge?.copyWith(
                  color: theme.colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40.0),
            // Cards Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SquareCard(
                  icon: Icons.login,
                  iconColor: theme.colorScheme.secondary,
                  label: 'Login',
                  textColor: theme.colorScheme.secondary,
                  color: theme.colorScheme.primary,
                  onTap: () {
                    locator<AppRouter>().push(LoginPageRoute());
                  },
                ),
                SquareCard(
                  icon: Icons.call,
                  iconColor: theme.colorScheme.primary,
                  label: 'Contact Us',
                  textColor: theme.colorScheme.primary,
                  color: theme.colorScheme.secondary,
                  onTap: () {
                    HelpUtils.tryLaunch(url: Strings.tel(Strings.appPhone));
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
}
