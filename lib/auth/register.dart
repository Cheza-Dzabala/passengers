import 'package:flutter/material.dart';
import 'package:passengers/utils/colors.dart';
import 'package:passengers/utils/decorations.dart';
import 'package:passengers/widgets/buttons.dart';
import 'package:passengers/widgets/text.dart';

class Register extends StatefulWidget {
  static String id = '/register';
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // Get width and height of screen using media query
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    AppBar bar = AppBar();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        padding: EdgeInsets.only(top: bar.preferredSize.height),
        decoration: kAuthAndOnboardingDecoration(),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Register.',
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
                          TextFormField(
                            keyboardType: TextInputType.text,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: Colors.black),
                            cursorColor: INPUT_HINT_COLOR,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Password Confirmation',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please confirm your password';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20),
                          kFullWidthButton(
                              context: context,
                              onPressed: () => print("register"),
                              text: 'register')
                        ],
                      ),
                    ),
                    SizedBox(height: 20),

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
                    SizedBox(height: 20),
                    kActionableText(
                      context: context,
                      leadingText: 'Already have an account?',
                      trailingText: 'login',
                      onTap: () => print('login'),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
