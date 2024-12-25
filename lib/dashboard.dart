import 'package:flutter/material.dart';
import 'carList.dart';
import 'motorList.dart';
import 'search.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        title: Text(
          'DASHBOARD',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://example.com/your_image.jpg', // Ganti dengan URL gambar profil
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                // Arahkan ke halaman mobil
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CarListScreen()),
                );
              },
              child: DashboardCard(icon: Icons.directions_car, label: 'MOBIL'),
            ),
            SizedBox(width: 16),
            GestureDetector(
              onTap: () {
                // Arahkan ke halaman motor
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MotorListScreen()),
                );
              },
              child: DashboardCard(icon: Icons.motorcycle, label: 'MOTOR'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                // Add navigation action
              },
            ),
            IconButton(
              icon: Icon(Icons.wallet),
              onPressed: () {
                // Add navigation action
              },
            ),
            SizedBox(width: 40), // Space for the floating action button
            IconButton(
              icon: Icon(Icons.pie_chart),
              onPressed: () {
                // Add navigation action
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                // Add navigation action
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigasi ke halaman pencarian ketika tombol ditekan
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SearchScreen()),
          );
        },
        backgroundColor: Colors.purple,
        child: Icon(Icons.navigation, color: Colors.white),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final IconData icon;
  final String label;

  DashboardCard({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        width: 100,
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.purple),
            SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
