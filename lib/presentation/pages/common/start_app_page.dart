import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:reservation_client/core/services/injectables/locator.dart';
import 'package:reservation_client/presentation/router/rourter.dart';
import 'package:reservation_client/presentation/router/rourter.gr.dart';


@RoutePage()
class StartAppPage extends StatelessWidget {
  const StartAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant Reservation')
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Login Card
                _buildSquareCard(
                  context,
                  icon: Icons.login,
                  label: 'Login',
                  onTap: () {
                    locator<AppRouter>().push(LoginPageRoute());
                  },
                ),
                // Contact Us Card
                _buildSquareCard(
                  context,
                  icon: Icons.contact_page,
                  label: 'Contact Us',
                  onTap: () {
                    
                  },
                ),
              ],
            ),
            
          ],
        ),
      ),
    );
  }

  Widget _buildSquareCard(BuildContext context,
      {required IconData icon, required String label, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4, // Adjust square size
        height: MediaQuery.of(context).size.width * 0.4, // Keep it square
        decoration: BoxDecoration(
          color: Colors.blue.shade100,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48.0, color: Colors.blue),
            const SizedBox(height: 8.0),
            Text(
              label,
              style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}