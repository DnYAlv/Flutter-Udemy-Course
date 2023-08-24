import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context){
    final bloc = Provider.of(context);
    
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Column (
        children: <Widget> [
          emailField(bloc),
          passwordField(bloc),
          const SizedBox(height: 20.0),
          submitButton(),
        ],
      )
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'you@example.com',
            labelText: 'Email Address',
            errorText: snapshot.hasError ? snapshot.error.toString() : null,
          )
        );
      },
    );
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Password',
            labelText: 'Password',
            errorText: snapshot.hasError ? snapshot.error.toString() : null,
          )
        );
      },
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 57, 155, 235))
      ),
      onPressed: (){}, 
      child: const Text('Login')
    );
  }
}