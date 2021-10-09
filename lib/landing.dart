import 'package:flutter/material.dart';
import 'package:passengers/auth/login.dart';
import 'package:passengers/auth/register.dart';
import 'package:passengers/widgets/buttons.dart';

class Landing extends StatefulWidget {
  static String id = '/landing';
  const Landing({Key? key}) : super(key: key);

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    // Create a scaffold with a background image and a child container
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Travel Easy',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(
                height: 50,
              ),
              kFullWidthButton(
                context: context,
                onPressed: () => Navigator.pushNamed(context, Login.id),
                text: 'GET STARTED',
              ),
              SizedBox(
                height: 50,
              ),
              kFullWidthButton(
                context: context,
                onPressed: () => Navigator.pushNamed(context, Register.id),
                text: 'REGISTER',
                altButton: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
