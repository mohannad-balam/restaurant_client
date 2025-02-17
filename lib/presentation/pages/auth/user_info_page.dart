import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_client/core/common/widgets/main_button.dart';
import 'package:reservation_client/core/constant/strings.dart';
import 'package:reservation_client/core/services/injectables/locator.dart';
import 'package:reservation_client/core/theme/app_colors.dart';
import 'package:reservation_client/data/models/response/user.dart';
import 'package:reservation_client/presentation/bloc/auth/auth_bloc.dart';

import '../../../core/services/localDB/local_db_service.dart';

@RoutePage()
// ignore: must_be_immutable
class UserProfilePage extends StatefulWidget {
  User? user;
  UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  void initState() {
    widget.user = locator<LocalDBService>().getUserInfo();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: theme.colorScheme.secondary,
      appBar: AppBar(
        title: const Text(Strings.userProfile),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.1,
              vertical: screenHeight * 0.05,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Hero animation for avatar
                Hero(
                  tag: 'profile-avatar',
                  child: CircleAvatar(
                    backgroundColor: AppColors.secondeyTextColor,
                    radius: screenHeight * 0.1, // Adjust size dynamically
                    child: const Icon(
                        Icons.person), // Replace with user's image URL
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                // User information card
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.user?.name ?? '', // Replace with dynamic data
                          style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Text(
                          widget.user?.email ?? '', // Replace with dynamic data
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: theme.colorScheme.primary.withOpacity(0.7),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        MainButton(
                            title: Strings.signOut,
                            onPressed: () {
                              BlocProvider.of<AuthBloc>(context)
                                  .add(LogoutEvent());
                            },
                            borderStyle: true)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
