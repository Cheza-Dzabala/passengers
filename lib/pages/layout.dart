import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:passengers/pages/landing.dart';
import 'package:passengers/services/firebase/authentication.dart';
import 'package:passengers/services/locator.dart';

class Layout extends StatefulWidget {
  static String id = '/layout';
  const Layout({Key? key}) : super(key: key);

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  late BuildContext _context;
  AuthenticationService _authService = locator<AuthenticationService>();

  _logout() async {
    try {
      await _authService.logout();
      Navigator.of(_context)
          .pushNamedAndRemoveUntil(Landing.id, (route) => false);
    } catch (e) {
      print(e);
      Get.snackbar(
        'Logout failed',
        'Unable to log you out of your account',
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Home'),
            ElevatedButton(
              onPressed: _logout,
              child: Text('Logout'),
            )
          ],
        ),
      ),
    );
  }
}
