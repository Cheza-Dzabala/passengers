import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:passengers/pages/auth/login.dart';
import 'package:passengers/services/firebase/authentication.dart';
import 'package:passengers/services/locator.dart';
import 'package:passengers/utils/colors.dart';
import 'package:passengers/utils/decorations.dart';
import 'package:passengers/widgets/buttons.dart';
import 'package:passengers/widgets/text.dart';

class ForgotPassword extends StatefulWidget {
  static String id = '/fogort_password';
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  late BuildContext _context;
  final _formKey = GlobalKey<FormState>();
  bool _inAsyncCall = false;
  TextEditingController _emailController = TextEditingController();
  AuthenticationService _authService = locator<AuthenticationService>();

  _resetPassword() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    try {
      setState(() {
        _inAsyncCall = true;
      });
      await _authService.resetPassword(email: _emailController.text);
      _emailController.text = '';
      Get.snackbar(
        'Success',
        'Check your email for a password reset link',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: Duration(seconds: 3),
      );
      setState(() {
        _inAsyncCall = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        _inAsyncCall = false;
      });
      Get.snackbar(
        'Recovery failed',
        'We were unable to send you a password recovery link. Please try again.',
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    // Get width and height of screen using media query
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    AppBar bar = AppBar();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ModalProgressHUD(
        inAsyncCall: _inAsyncCall,
        color: PRIMARY_COLOR,
        child: Container(
          padding: EdgeInsets.only(top: bar.preferredSize.height),
          decoration: kAuthAndOnboardingDecoration(),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Forgot Password.',
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                  height: _height * 0.5,
                  width: _width,
                  decoration: kAuthBottomContainerDecoration(),
                  child: Column(
                    children: [
                      // Add email and password form
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: Colors.black),
                              cursorColor: INPUT_HINT_COLOR,
                              decoration: InputDecoration(
                                hintText: 'Email',
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your email';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 20),
                            kFullWidthButton(
                              context: context,
                              onPressed: _resetPassword,
                              text: 'Reset',
                            )
                          ],
                        ),
                      ),

                      SizedBox(height: 20),
                      kActionableText(
                        context: context,
                        leadingText: 'already have an account?',
                        trailingText: 'login',
                        onTap: () => Navigator.of(context).pushNamed(Login.id),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
