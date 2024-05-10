import 'package:flutter/material.dart';
import 'package:aplikasi_manajemen_waktu/analog_clock.dart';
import 'login_page.dart'; // Import file login_page.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Manajemen Waktu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard Manajemen Waktu'),
      ),
      body: Row(
        children: <Widget>[
          // Sidebar Menu
          Container(
            width: 250,
            color: Colors.grey[200],
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text('Dashboard'),
                  leading: Icon(Icons.dashboard),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardPage()),
                    );
                  },
                ),
                ListTile(
                  title: Text('Clock'),
                  leading: Icon(Icons.access_time), // Ganti dengan ikon jam
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AnalogClock()),
                    );
                  },
                ),
                ListTile(
                  title: Text('Log Out'), // Ubah teks menjadi "Log Out"
                  leading: Icon(
                      Icons.exit_to_app), // Ganti dengan ikon "exit_to_app"
                  onTap: () {
                    // Navigasi kembali ke tampilan login saat Log Out diklik
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                ),
                // Add more menu items as needed
              ],
            ),
          ),
          // Main Content
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Welcome to Dashboard Manajemen Waktu!',
                    style: TextStyle(fontSize: 24),
                  ),
                  // Add more content here
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: Text('This is the Dashboard Page'),
      ),
    );
  }
}

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clock'),
      ),
      body: Center(
        child: Text('This is the Clock Page'),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Text('This is the Settings Page'),
      ),
    );
  }
}
