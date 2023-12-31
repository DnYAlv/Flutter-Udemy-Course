import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Log Me in!',
      home: Scaffold(
        body: SafeArea(
          child: LoginScreen(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}