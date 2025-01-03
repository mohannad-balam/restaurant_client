import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:reservation_client/core/services/injectables/locator.dart';
import 'package:reservation_client/presentation/router/rourter.dart';
import 'package:reservation_client/presentation/router/rourter.gr.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Categories Card
                _buildSquareCard(
                  context,
                  icon: Icons.category,
                  label: 'Categories',
                  onTap: () {
                    locator<AppRouter>().push(const CategoriesPageRoute());
                  },
                ),
                // Menus Card
                _buildSquareCard(
                  context,
                  icon: Icons.menu_book,
                  label: 'Menus',
                  onTap: () {
                    locator<AppRouter>().push(const MenusPageRoute());
                  },
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            // Reservation Card
            _buildSquareCard(
              context,
              icon: Icons.event_seat,
              label: 'Reservations',
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => ReservationPage()),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSquareCard(BuildContext context,
      {required IconData icon, required String label, required GestureTapCallback onTap}) {
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

