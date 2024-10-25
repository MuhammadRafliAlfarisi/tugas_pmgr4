import 'package:flutter/material.dart';
import 'package:flutter_application_1/logoutpage.dart';
import 'package:flutter_application_1/updatepage.dart';
import 'package:flutter_application_1/addpage.dart';
import 'package:flutter_application_1/dashboardpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Management System',
      theme: ThemeData(primarySwatch: Colors.red),
      home: HomePage(),
      routes: {
        '/dashboard': (context) => DashboardPage(),
        '/add': (context) => AddPage(),
        '/update': (context) => UpdatePage(),
        '/logout': (context) => LogoutPage(),
      },
    );
  }
}

class HomeMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color iconColor; // Parameter untuk warna ikon

  const HomeMenuItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
    required this.iconColor, // Tambahkan iconColor ke konstruktor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Latar belakang putih
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.grey[300]!, width: 1), // Border untuk efek
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: iconColor), // Hanya ikon yang berwarna
            SizedBox(height: 8.0),
            Text(
              label,
              style: TextStyle(color: Colors.black, fontSize: 16.0), // Label tetap hitam
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Management System'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(), // Prevent scrolling in GridView
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                HomeMenuItem(
                  icon: Icons.dashboard,
                  label: 'Dashboard',
                  iconColor: Colors.blue, // Warna ikon Dashboard
                  onTap: () {
                    Navigator.pushNamed(context, '/dashboard');
                  },
                ),
                HomeMenuItem(
                  icon: Icons.add,
                  label: 'Add',
                  iconColor: Colors.green, // Warna ikon Add
                  onTap: () {
                    Navigator.pushNamed(context, '/add');
                  },
                ),
                HomeMenuItem(
                  icon: Icons.update,
                  label: 'Update',
                  iconColor: Colors.orange, // Warna ikon Update
                  onTap: () {
                    Navigator.pushNamed(context, '/update');
                  },
                ),
                HomeMenuItem(
                  icon: Icons.logout,
                  label: 'Logout',
                  iconColor: Colors.red, // Warna ikon Logout
                  onTap: () {
                    Navigator.pushNamed(context, '/logout');
                  },
                ),
              ],
            ),
            SizedBox(height: 50),
            Text('NPM: 714220008'),
            Text('Nama: Muhammad Rafli Alfarisi'),
          ],
        ),
      ),
    );
  }
}
