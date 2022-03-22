import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:passengers/data/select_data.dart';
import 'package:passengers/feedback/snackbar.feedback.dart';
import 'package:passengers/models/profile.model.dart';
import 'package:passengers/pages/layout.dart';
import 'package:passengers/providers/user_provider.dart';
import 'package:passengers/services/profile.service.dart';
import 'package:passengers/utils/colors.dart';
import 'package:passengers/utils/decorations.dart';
import 'package:passengers/widgets/buttons.dart';
import 'package:select_form_field/select_form_field.dart';

import '../../services/locator.dart';

class OnboardingDetails extends ConsumerStatefulWidget {
  static String id = '/onboarding_details';
  const OnboardingDetails({Key? key}) : super(key: key);

  @override
  _OnboardingDetailsState createState() => _OnboardingDetailsState();
}

class _OnboardingDetailsState extends ConsumerState<OnboardingDetails> {
  String? dropdownValue;

  TextEditingController _genderController = TextEditingController(text: 'Male');
  TextEditingController _dateOfBirthController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  ProfileService _profileService = locator<ProfileService>();
  bool isInAsyncCall = false;
  final _formKey = GlobalKey<FormState>();

  _validate({required BuildContext context}) async {
    print('Submit');
    if (!_formKey.currentState!.validate()) {
      return;
    }
    setState(() {
      isInAsyncCall = true;
    });
    Session session = ref.read(sessionProvider.state).state;

    Profile profile = ref.read(profileProvider.state).state;
    profile.description = _descriptionController.text;
    profile.phoneNumber = _phoneNumberController.text;
    profile.gender = _genderController.text;
    try {
      await _profileService.createProfile(
        profile: profile,
        userId: session.userId,
      );
      setState(() {
        isInAsyncCall = false;
      });
      Navigator.of(context).pushReplacementNamed(Layout.id);
    } catch (e) {
      setState(() {
        isInAsyncCall = false;
      });
      print(e);
      snackBar(
        title: 'Profile Error',
        message: 'Could not add profile',
        color: Colors.red,
      );
    }
  }

  final _bar = AppBar();

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);

    DateTime _dateOfBirth = DateTime.now();

    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _dateOfBirth,
        firstDate: DateTime(1900),
        lastDate: DateTime(2059),
      );
      if (picked != null && picked != _dateOfBirth) {
        print('Date selected: ${picked.toString()}');
        setState(() {
          _dateOfBirth = picked;
          _dateOfBirthController.text = _dateOfBirth.toString();
        });
        print(_dateOfBirth.toString());
      }
    }

    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        height: _height,
        width: _width,
        decoration: kAuthAndOnboardingDecoration(),
        padding: EdgeInsets.all(10),
        child: ModalProgressHUD(
          inAsyncCall: isInAsyncCall,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: _bar.preferredSize.height),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'DETAILS.',
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'STEP 2 of 4',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          letterSpacing: 6,
                          color: subtitleColor,
                        ),
                  ),
                  SizedBox(height: _height * 0.2),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 55,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: inputFillColor,
                          ),
                          child: DropdownButton<String>(
                            underline: SizedBox(),
                            elevation: 0,
                            value: _genderController.text,
                            style: Theme.of(context).textTheme.bodyText1!,
                            hint: Text(
                              'Gender',
                              style: TextStyle(
                                color: inputHintColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            icon: SizedBox(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                                _genderController.text = newValue;
                              });
                            },
                            items: <String>['Male', 'Female']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () => _selectDate(context),
                              child: Text('Date of Birth'),
                            ),
                            Text(
                              '${_dateOfBirth.day}/${_dateOfBirth.month}/${_dateOfBirth.year}',
                              style: Theme.of(context).textTheme.bodyText1!,
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _phoneNumberController,
                          style: Theme.of(context).textTheme.bodyText1!,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Phone Number',
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
                          controller: _descriptionController,
                          style: Theme.of(context).textTheme.bodyText1!,
                          minLines: 5,
                          maxLines: 5,
                          decoration: InputDecoration(
                            hintText: 'Describe yourself as a rider or driver',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a description';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        kFullWidthButton(
                          context: context,
                          onPressed: () => _validate(context: context),
                          text: 'Continue',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
