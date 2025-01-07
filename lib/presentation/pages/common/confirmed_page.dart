import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:reservation_client/core/common/widgets/main_button.dart';
import 'package:reservation_client/core/constant/asset_files.dart';
import 'package:reservation_client/core/services/injectables/locator.dart';
import 'package:reservation_client/presentation/router/rourter.dart';
import 'package:reservation_client/presentation/router/rourter.gr.dart';


@RoutePage()
class ConfirmedPage extends StatelessWidget {
  const ConfirmedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Lottie animation for the green checkmark
              Lottie.asset(
                animate: true,
                AssetLotties.checkSign, // Path to your Lottie JSON file
                width: 150,
                height: 150,
                repeat: true, // Animation plays once
              ),
              // const Icon(Icons.check, size: 30, color: AppColors.successColor,),
              const SizedBox(height: 24),
              // ConfirmedPage message
               Text(
                'Reservation Confirmed!',
                style: theme.textTheme.titleLarge?.copyWith(
                  color: theme.colorScheme.primary,
                  fontSize: 30
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'Thank you for your reservation.\nWe look forward to serving you!',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              // Back to Home button
              MainButton(title: 'Back To Home', onPressed: () {
                  locator<AppRouter>().replaceAll([const HomePageRoute()]);
                }, borderStyle: true)
            ],
          ),
        ),
      ),
    );
  }
}
