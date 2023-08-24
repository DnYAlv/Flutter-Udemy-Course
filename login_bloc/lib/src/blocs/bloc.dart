import 'dart:async';
import 'dart:math';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc with Validators {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  // Add Data to Stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(valdiatePassword);
  
  // Combine Stream while submitting
  Stream<bool?> get submitValid => Rx.combineLatest2(email, password,  (e, p) {
    return (e == _email.value && p == _password.value) ? true : null;
  });

  // Change Data
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  submit() {
    final validEmail = _email.value;
    final validPassword = _password.value;

    // TODO: #1 Make this idk, maybe pass it to API
    // ignore: avoid_print
    print('Email is $validEmail');
    // ignore: avoid_print
    print('Password is $validPassword');
  }

  // Clean after stream usage done
  dispose() {
    _email.close();
    _password.close();
  }
}