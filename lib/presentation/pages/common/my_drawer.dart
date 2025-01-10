import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/injectables/locator.dart';
import '../../../data/models/response/user.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../router/rourter.dart';
import '../../router/rourter.gr.dart';

class MyDrawer extends StatelessWidget {
  final User? user;
  const MyDrawer({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: (){
                  locator<AppRouter>().push(UserProfilePageRoute());
                },
                child: Row(
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
                          user?.name ?? '',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColorLight,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32.0),
              // Logout Button
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<AuthBloc>(context).add(LogoutEvent());
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
      );
  }
}