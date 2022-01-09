import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:passengers/models/passengers_user.dart';
import 'package:passengers/pages/onboarding/onboarding_details.dart';
import 'package:passengers/providers/user_provider.dart';
import 'package:passengers/services/firebase/onboarding_service.dart';
import 'package:passengers/services/locator.dart';
import 'package:passengers/utils/colors.dart';
import 'package:passengers/utils/decorations.dart';
import 'package:passengers/widgets/buttons.dart';
import 'package:permission_handler/permission_handler.dart';

class OnboardingProfile extends ConsumerStatefulWidget {
  static String id = '/onboarding_welcome';
  const OnboardingProfile({Key? key}) : super(key: key);

  @override
  _OnboardingProfileState createState() => _OnboardingProfileState();
}

class _OnboardingProfileState extends ConsumerState<OnboardingProfile> {
  late PassengersUser user;
  bool isLoadingImage = false;
  late BuildContext _context;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _displayName = TextEditingController();

  OnboardingService _onboardingService = locator<OnboardingService>();

  _validate({required BuildContext context}) {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    ref.read(userProvider).state.firstName = _firstName.text;
    ref.read(userProvider).state.lastName = _lastName.text;
    ref.read(userProvider).state.displayName = _displayName.text;
    if (ref.read(userProvider).state.avatar.isNotEmpty) {
      Navigator.of(context).pushNamed(OnboardingDetails.id);
    } else {
      print('No avatar provided');
      Get.snackbar(
        'Avatar',
        'You must upload a profile picture to continue',
        colorText: Colors.white,
        backgroundColor: Colors.orange,
      );
    }
  }

  _selectProfilePicture() async {
    final ImagePicker _picker = ImagePicker();
    // Get permissions for gallery
    Permission.photos.request().then((value) async {
      if (value == PermissionStatus.permanentlyDenied) {
        openAppSettings();
      } else {
        XFile? image = await _picker.pickImage(source: ImageSource.gallery);
        if (image != null) {
          try {
            setState(() {
              isLoadingImage = true;
            });
            String avatarUrl =
                await _onboardingService.uploadAvatar(file: File(image.path));
            ref.read(userProvider).state.avatar = avatarUrl;
            setState(() {
              isLoadingImage = false;
            });
          } catch (e) {
            print('Upload error $e');
            setState(() {
              isLoadingImage = false;
            });
            Get.snackbar(
              'Error',
              'Avatar Upload Error',
              colorText: Colors.white,
              backgroundColor: Colors.red,
            );
          }
        }
      }
    });
  }

  final _bar = AppBar();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Listen to riverpod user provider changes
    final user = ref.watch(userProvider);

    _context = context;
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        height: _height,
        width: _width,
        decoration: kAuthAndOnboardingDecoration(),
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: _bar.preferredSize.height),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PROFILE.',
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  'STEP 1 of 4',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        letterSpacing: 6,
                        color: SUBTITLE_COLOR,
                      ),
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: PRIMARY_COLOR,
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: IconButton(
                      iconSize: 80,
                      onPressed: _selectProfilePicture,
                      icon: isLoadingImage
                          ? CircularProgressIndicator(
                              color: PRIMARY_COLOR,
                            )
                          : user.state.avatar.isEmpty
                              ? Image.asset(
                                  'assets/images/camera-line.png',
                                )
                              : CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(user.state.avatar),
                                  radius: 80,
                                ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Center(
                  child: Text(
                    'Profile Image',
                    style: Theme.of(context).textTheme.bodyText1!,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    'Please use an actual image of yourself.',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 40),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: _firstName,
                        style: Theme.of(context).textTheme.bodyText1!,
                        decoration: InputDecoration(
                          hintText: 'First Name',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your first name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _lastName,
                        style: Theme.of(context).textTheme.bodyText1!,
                        decoration: InputDecoration(
                          hintText: 'Last Name',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your last name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _displayName,
                        style: Theme.of(context).textTheme.bodyText1!,
                        decoration: InputDecoration(
                          hintText: 'Display Name',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your last name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      kFullWidthButton(
                        context: context,
                        onPressed: () => _validate(context: context),
                        text: 'Continue',
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
