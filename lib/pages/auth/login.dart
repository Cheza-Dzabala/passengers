import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:passengers/pages/auth/forgot_password.dart';
import 'package:passengers/pages/layout.dart';
import 'package:passengers/services/firebase/authentication.dart';
import 'package:passengers/services/locator.dart';
import 'package:passengers/utils/colors.dart';
import 'package:passengers/utils/decorations.dart';
import 'package:passengers/widgets/buttons.dart';
import 'package:passengers/widgets/text.dart';

class Login extends StatefulWidget {
  static String id = '/login';
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late BuildContext _context;
  final _formKey = GlobalKey<FormState>();
  AuthenticationService _authService = locator<AuthenticationService>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

  void _login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    try {
      setState(() {
        _isLoading = true;
      });
      await _authService.login(
          email: _emailController.text, password: _passwordController.text);
      Navigator.of(context).pushReplacementNamed(Layout.id);
    } catch (e) {
      print(e);
      setState(() {
        _isLoading = false;
      });
      Get.snackbar(
        'Login failed',
        'Unable to log you into your account',
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
        inAsyncCall: _isLoading,
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
                    'Login.',
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
                            TextFormField(
                              controller: _passwordController,
                              keyboardType: TextInputType.text,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: Colors.black),
                              cursorColor: INPUT_HINT_COLOR,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'Password',
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 20),
                            kFullWidthButton(
                                context: context,
                                onPressed: _login,
                                text: 'login')
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Text('OR', style: Theme.of(context).textTheme.bodyText1!),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RawMaterialButton(
                            splashColor: PRIMARY_COLOR,
                            onPressed: () => print('Twitter login'),
                            child: Image.asset(
                              'assets/images/twitter.png',
                              scale: 1.5,
                            ),
                            shape: CircleBorder(),
                          ),
                          RawMaterialButton(
                            splashColor: PRIMARY_COLOR,
                            onPressed: () => print('Google login'),
                            child: Image.asset(
                              'assets/images/google.png',
                              scale: 1.5,
                            ),
                            shape: CircleBorder(),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      kActionableText(
                        context: context,
                        leadingText: 'forgot password?',
                        trailingText: 'reset',
                        onTap: () =>
                            Navigator.of(context).pushNamed(ForgotPassword.id),
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
