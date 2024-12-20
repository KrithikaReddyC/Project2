import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_screen.dart';
import 'login_screen.dart';
import 'splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
     options: const FirebaseOptions(
        apiKey: 'AIzaSyBYJT-o3AQwpB6dX0ZV1NM98vfxwmd0BZo',
    appId: '1:24990764892:web:8b94c72da1c5046dbe3b99',
    messagingSenderId: '24990764892',
    projectId: 'project2-de4e8',
    authDomain: 'project2-de4e8.firebaseapp.com',
    storageBucket: 'project2-de4e8.appspot.com',
    measurementId: 'G-KR0G1PLSRW',
      // Other Firebase options...
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            User? user = snapshot.data;
            if (user == null) {
              return const LoginScreen();
            }
            return const HomeScreen();
          } else {
            return const SplashScreen();
          }
        },
      ),
    );
  }
}
