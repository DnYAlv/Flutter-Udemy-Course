import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'blocs/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context){
    return Provider(
      child: const MaterialApp(
        title: 'Log Me In!',
        home: Scaffold (
          body: SafeArea(
            child: LoginScreen(),
          ),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}