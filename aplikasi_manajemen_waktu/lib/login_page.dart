import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'sign_up.dart'; // import sign_up.dart untuk dapat mengarahkan ke halaman sign up setelah login

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 100),
              Center(
                child: Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Simulasi login berhasil, arahkan ke halaman sign up
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors
                      .blue, // backgroundColor digunakan untuk menetapkan warna latar belakang tombol
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    'Sign Up', // Ubah teks tombol menjadi "Sign Up"
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                  height:
                      10), // Tambahkan jarak antara tombol "Sign Up" dan "Login"
              ElevatedButton(
                onPressed: () {
                  // Simulasi login berhasil, arahkan ke halaman dashboard
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Dashboard()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors
                      .blue, // backgroundColor digunakan untuk menetapkan warna latar belakang tombol
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    'Login', // Ubah teks tombol menjadi "Login"
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
