import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/route_manager.dart';
import 'package:passengers/pages/auth/forgot_password.dart';
import 'package:passengers/pages/auth/login.dart';
import 'package:passengers/pages/auth/register.dart';
import 'package:passengers/pages/landing.dart';
import 'package:passengers/pages/layout.dart';
import 'package:passengers/pages/onboarding/onboarding_details.dart';
import 'package:passengers/pages/onboarding/onboarding_profile.dart';
import 'package:passengers/services/locator.dart';
import 'package:passengers/theme/theme.dart';
import 'package:passengers/utils/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpServiceLocator();
  runApp(InitializeApp());
}

class InitializeApp extends StatefulWidget {
  const InitializeApp({Key? key}) : super(key: key);

  @override
  _InitializeAppState createState() => _InitializeAppState();
}

class _InitializeAppState extends State<InitializeApp> {
  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  Future<String> _initialization() => Future.delayed(
        const Duration(seconds: 2),
        () => 'Large Latte',
      );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(home: Loading());
        }

        if (snapshot.hasError) {
          print('Initialization Error ${snapshot.error}');
          return Error();
        }
        return Passengers();
      },
    );
  }
}

class Passengers extends StatefulWidget {
  const Passengers({Key? key}) : super(key: key);

  @override
  _PassengersState createState() => _PassengersState();
}

class _PassengersState extends State<Passengers> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProviderScope(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Passengers',
          initialRoute: Landing.id,
          theme: kPassengersTheme(),
          routes: {
            Landing.id: (context) => Landing(),
            Login.id: (context) => Login(),
            Register.id: (context) => Register(),
            ForgotPassword.id: (context) => ForgotPassword(),
            OnboardingProfile.id: (context) => OnboardingProfile(),
            OnboardingDetails.id: (context) => OnboardingDetails(),
            Layout.id: (context) => Layout(),
          },
        ),
      ),
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: primaryColor),
            Text('Preparing Application')
          ],
        ),
      ),
    );
  }
}

class Error extends StatelessWidget {
  const Error({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
