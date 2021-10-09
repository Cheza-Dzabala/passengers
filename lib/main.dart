import 'package:flutter/material.dart';
import 'package:passengers/auth/login.dart';
import 'package:passengers/auth/register.dart';
import 'package:passengers/landing.dart';
import 'package:passengers/theme/theme.dart';

void main() {
  runApp(Passengers());
}

class Passengers extends StatefulWidget {
  const Passengers({Key? key}) : super(key: key);

  @override
  _PassengersState createState() => _PassengersState();
}

class _PassengersState extends State<Passengers> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Passengers',
      initialRoute: Landing.id,
      theme: kPassengersTheme(),
      routes: {
        Landing.id: (context) => Landing(),
        Login.id: (context) => Login(),
        Register.id: (context) => Register(),
      },
    );
  }
}
