import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:passengers/feedback/snackbar.feedback.dart';
import 'package:passengers/pages/landing.dart';
import 'package:passengers/providers/user_provider.dart';
import 'package:passengers/services/locator.dart';

import '../services/authentication.service.dart';

class Layout extends ConsumerStatefulWidget {
  static String id = '/layout';
  const Layout({Key? key}) : super(key: key);

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends ConsumerState<Layout> {
  late BuildContext _context;
  AuthenticationService _authService = locator<AuthenticationService>();

  _logout() async {
    try {
      Session currentSession = ref.read(sessionProvider).state;
      await _authService.logout(session: currentSession);
      Navigator.of(_context).pushNamedAndRemoveUntil(
        Landing.id,
        (route) => false,
      );
    } catch (e) {
      print(e);
      snackBar(
        title: 'Logout failed',
        message: 'Unable to log you out of your account',
        color: Colors.red,
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
