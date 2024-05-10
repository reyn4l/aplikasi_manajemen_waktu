import 'package:flutter/material.dart';
import 'login_page.dart'; // import login_page.dart sebagai halaman awal aplikasi

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
      home: LoginPage(), // atur LoginPage sebagai halaman awal aplikasi
    );
  }
}
