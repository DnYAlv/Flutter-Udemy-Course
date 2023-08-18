import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin{
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context){
    return Container(
      margin: const EdgeInsets.all(20.0), 
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget> [
            emailField(),
            passwordField(),
            const SizedBox(height: 20.0),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Email Address',
        hintText: 'abc@example.com',
      ),
      keyboardType: TextInputType.emailAddress,
      validator: validateEmail,
      onSaved: (newValue) {
        if (newValue != null) {
          email = newValue;
        }
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: false,
      decoration: const InputDecoration(
        labelText: 'Password',
        hintText: 'Password',
      ),
      validator: validatePassword,
      onSaved: (newValue) {
        if (newValue != null) {
          password = newValue;
        }
      },
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue)
      ),
      child: const Text('Submit!'),
      onPressed: () {
        if(formKey.currentState!.validate()){
          formKey.currentState!.save();
          // print('Time to post $email and $password to Outlook!');
        }
      },
    );
  }
}