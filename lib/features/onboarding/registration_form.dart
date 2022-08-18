import 'dart:io';
import 'package:get/get.dart';
//import 'package:edurald/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:geocoder/geocoder.dart';
// import 'package:geocoder/model.dart';
import 'package:country_codes/country_codes.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:edurald/models/model_status.dart';
import 'package:edurald/models/strings.dart';
import 'package:edurald/utills/input_util.dart';
import 'package:edurald/utills/styles.dart';
import 'package:geolocator/geolocator.dart';
import 'package:edurald/validations/registration_validation.dart';
import 'package:connectivity/connectivity.dart';
import 'package:image_picker/image_picker.dart';
import '../../gen/assets.gen.dart';
import '../../main.dart';
import '../../utills/imageanimations.dart';

import '../dashboard/dashboard.dart';
import '../signin/signin_logic.dart';
import 'registration_logic.dart';

class registration_formPage extends StatefulWidget {
  registration_formPage({Key? key, this.user}) : super(key: key);

  final User? user;

  @override
  _Registration_formPageState createState() => _Registration_formPageState();
}

class _Registration_formPageState extends State<registration_formPage>
    with TickerProviderStateMixin {
  File _image = File(imageBase + 'graduatehat.jpg');
  final picker = ImagePicker();
  int blurrySize = 0;
  double socialAuthsLocation = 0.78;
  final int _numPages = 3;
  bool next = true;
  String initialCountry = "";
  bool enableEmail = false;
  bool isFirstView = true;
  bool _passwordVisible = false;
  int _current = 0;
  int socialMediaSelectedOption = 1;
  bool showLoader = false;
  String? phoneNumber = '';
  bool emailIsValid = false;
  bool emailExist = false;
  bool userNameIsValid = false;
  bool firstNameIsValid = false;
  bool lastNameIsValid = false;
  bool phoneNumberIsValid = false;
  bool passwordIsValid = false;
  EmailStatus emailStatus = EmailStatus.success;
  FirstNameStatus firstNameStatus = FirstNameStatus.success;
  LastNameStatus lastNameStatus = LastNameStatus.success;
  UserNameStatus userNameStatus = UserNameStatus.success;
  PhoneNumberStatus phoneNumberStatus = PhoneNumberStatus.success;
  PasswordValidationResp passwordValidationResp = PasswordValidationResp(0, '');
  PasswordStatus passwordStatus = PasswordStatus.success;
  TextEditingController phoneNoController = new TextEditingController();
  TextEditingController userNameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController firstNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  String countryCode = '';
  PhoneNumber? initialnumber;
  DateTime timeStamp = DateTime.now();

  Future<void> getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    await CountryCodes.init();
    // final coordinates = new Coordinates(position.latitude, position.longitude);
    // var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    // var first = addresses.first;
    // initialCountry = first.countryCode;
    // setState(() {
    //   countryCode = first.countryCode;
    //   initialnumber = PhoneNumber(isoCode: countryCode);
    // });
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
      height: 8.0,
      width: isActive ? 24.0 : 10.0,
      decoration: BoxDecoration(
        color: isActive ? projectDark : Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  Future<void> registerUser() async {
    if (!showLoader) {
      setState(() {
        blurrySize = 1;
        showLoader = true;
      });
      bool resp = await createUser(
          context, emailController.text, passwordController.text);
      if (resp) {
        setState(() {
          socialAuthsLocation = 1;
          isFirstView = false;
        });
      } else {
        _current = --_current % 3;
      }
      setState(() {
        blurrySize = 0;
        showLoader = false;
      });
    }
  }

  Future<void> updateUserRecords() async {
    if (!showLoader) {
      setState(() {
        blurrySize = 1;
        showLoader = true;
      });
      if (userNameIsValid) {
        try {
          saveUserToFirestore(
              user.user,
              emailController.text.trim(),
              firstNameController.text.trim(),
              lastNameController.text.trim(),
              userNameController.text.trim(),
              user.user?.photoURL ?? "");
          Get.offAll(dashboardPage());
        } catch (e) {}
      } else {
        showError(userName_error);
        setState(() {
          blurrySize = 0;
          showLoader = false;
        });
      }
    }
  }

  socialMediaSignup() async {
    try {
      setState(() {
        blurrySize = 1;
        showLoader = true;
      });
      if (socialMediaSelectedOption == 1) {
        user = await signInWithFacebook();
      } else if (socialMediaSelectedOption == 2) {
        user = await signInWithGoogle();
      } else if (socialMediaSelectedOption == 3) {
        user = await signInWithTwitter();
        userNameIsValid = !await userNameExist(user.user?.displayName ?? "");
        userNameStatus =
            userNameIsValid ? UserNameStatus.success : UserNameStatus.error;
        enableEmail = true;
      }
    } catch (e) {
      print("Hereee");
      print(e.toString());
      if (e.toString() ==
          "LateInitializationError: Field 'user' has already been initialized.") {
        if (FirebaseAuth.instance.currentUser != null) {
          bool isOldUser = await userExist();
          if (isOldUser) {
            Get.offAll(dashboardPage());
            return;
          } else
            setState(() {
              _current = ++_current % 3;
              userNameController.text = user.user?.displayName ?? "";
              userNameController.text =
                  userNameController.text.replaceAll(' ', '');
              // _current = 2;
              socialAuthsLocation = 1;
              //next = !next;
              isFirstView = false;
              blurrySize = 0;
              showLoader = false;
            });
        }
      }
      //show error signing up notification
    }
    if (FirebaseAuth.instance.currentUser != null) {
      bool isOldUser = await userExist();
      print("isOld?");
      print(isOldUser);
      if (isOldUser) {
        Get.offAll(() => dashboardPage());
        return;
      } else
        setState(() {
          _current = ++_current % 3;
          userNameController.text = user.user?.displayName ?? "";
          userNameController.text = userNameController.text.replaceAll(' ', '');
          // _current = 2;
          socialAuthsLocation = 1;
          //next = !next;
          isFirstView = false;
          blurrySize = 0;
          showLoader = false;
        });
    } else {
      blurrySize = 0;
      showLoader = false;
      showError('The password provided is too weak.');
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    PhoneNumber number = PhoneNumber(isoCode: countryCode);

    Widget thirdView = Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(0),
      width: size.width * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Visibility(
            child: TextField(
                textAlignVertical: TextAlignVertical.bottom,
                decoration: InputDecoration(
                    labelText: 'Email ', labelStyle: blue20Style),
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                onSubmitted: (value) async {
                  emailExist = await mailExist(emailController.text.trim());
                },
                onChanged: (value) async {
                  setState(() {
                    mailExist(emailController.text.trim());
                    emailIsValid = emailValidator(value);
                    if (!emailIsValid) {
                      emailStatus = EmailStatus.error;
                    } else
                      emailStatus = EmailStatus.success;
                  });
                }),
            maintainSize: false,
            maintainAnimation: true,
            maintainState: true,
            visible: enableEmail,
          ),
          Visibility(
            child: (emailStatus == EmailStatus.error)
                ? error(email_invalid_error)
                : Text(''),
            maintainSize: false,
            maintainAnimation: true,
            maintainState: true,
            visible: !emailIsValid,
          ),
          (emailExist) ? error(email_exist_error) : Text(''),
          TextField(
              decoration: InputDecoration(
                  labelText: 'User name :-', labelStyle: blue20Style),
              controller: userNameController,
              onChanged: (value) async {
                if (value.contains(" ")) {
                  userNameController.text = value.replaceAll(' ', '');
                  showError("space not allowed for UserName");
                }
                setState(() async {
                  userNameIsValid =
                      !await userNameExist(userNameController.text.trim());
                  if (userNameIsValid) {
                    userNameStatus = UserNameStatus.success;
                  } else
                    userNameStatus = UserNameStatus.error;
                });
              }),
          (userNameStatus == UserNameStatus.error)
              ? error(userName_error)
              : Text(''),
          TextField(
              decoration: InputDecoration(
                  labelText: 'First name :-', labelStyle: blue20Style),
              controller: firstNameController,
              onChanged: (value) {
                setState(() {
                  firstNameIsValid = firstNameValidator(value);
                  if (!firstNameIsValid) {
                    firstNameStatus = FirstNameStatus.error;
                  } else
                    firstNameStatus = FirstNameStatus.success;
                });
              }),
          (firstNameStatus == FirstNameStatus.error)
              ? error(firstName_error)
              : Text(''),
          TextField(
              decoration: InputDecoration(
                  labelText: 'Last name :-', labelStyle: blue20Style),
              controller: lastNameController,
              onChanged: (value) {
                setState(() {
                  lastNameIsValid = lastNameValidator(value);
                  if (!lastNameIsValid) {
                    lastNameStatus = LastNameStatus.error;
                  } else
                    lastNameStatus = LastNameStatus.success;
                });
              }),
          (lastNameStatus == LastNameStatus.error)
              ? error(lastName_error)
              : Text(''),
        ],
      ),
    );

    Widget firstView = Container(
        alignment: Alignment.center,
        width: size.width * 0.8,
        padding: EdgeInsets.all(0),
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextField(
                  textAlignVertical: TextAlignVertical.bottom,
                  decoration: InputDecoration(
                      labelText: 'Email ', labelStyle: blue20Style),
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  onSubmitted: (value) async {
                    emailExist = await mailExist(emailController.text.trim());
                  },
                  onChanged: (value) async {
                    emailExist = await mailExist(emailController.text.trim());
                    setState(() {
                      emailIsValid = emailValidator(value);
                      if (!emailIsValid) {
                        emailStatus = EmailStatus.error;
                      } else
                        emailStatus = EmailStatus.success;
                    });
                  }),
              Visibility(
                child: (emailStatus == EmailStatus.error)
                    ? error(email_invalid_error)
                    : Text(''),
                maintainSize: false,
                maintainAnimation: true,
                maintainState: true,
                visible: !emailIsValid,
              ),
              (emailExist) ? error(email_exist_error) : Text(''),
              TextField(
                decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: projectBlue,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                    labelStyle: blue20Style),
                obscureText: !_passwordVisible,
                controller: passwordController,
                onChanged: (value) {
                  setState(() {
                    passwordValidationResp = passwordValidator(value);
                    if (passwordValidationResp.validated < 4) {
                      //passwordIsValid = passwordValidationResp.validated;
                      passwordStatus = PasswordStatus.error;
                    } else {
                      passwordIsValid = true;
                      passwordStatus = PasswordStatus.success;
                    }
                  });
                },
              ),
              (passwordStatus == PasswordStatus.error)
                  ? error(passwordValidationResp.error)
                  : Text(''),
            ]));

    return Scaffold(
      body: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          AnimatedPositioned(
            top: 0,
            duration: Duration(seconds: 1),
            child: Container(
              height: size.height * 0.4,
              width: size.width,
              //padding: EdgeInsets.fromLTRB(30, 10, 30, 20),
              alignment: Alignment.center,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: size.height * 0.08),
                    Hero(
                      tag: "splashscreenImage",
                      child: WidgetAnimator(
                        component: Container(
                          height: size.height * 0.05,
                          width: size.width,
                          color: Colors.transparent,
                          alignment: Alignment.topCenter,
                          child: imgAnimation2(
                            url: Assets.images.logo.path,
                            time: Duration(milliseconds: 4000),
                            width: MediaQuery.of(context).size.width * 0.5,
                            beginx: 0.1,
                            endx: -0.1,
                            beginy: 0,
                            endy: 0,
                            height: size.height * 0.1,
                            transition: PositionedTransition,
                          ),
                        ),
                        transition: Transform,
                        animPattern: Curves.easeIn,
                        pixle: Colors.transparent,
                        time: Duration(seconds: 1),
                        animType: "nothing",
                        xAxis: 0,
                        yAxis: 0,
                      ),
                    ),
                    SizedBox(height: size.height * 0.05),
                    Hero(
                      tag: "headerTxt",
                      child: Text(
                        'Join Edurald',
                        style: blue25BoldStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Text(
                      'Sign up to learn and connect with other professionals like you',
                      style: darkNormal18Style,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: size.height * 0.05),
                  ]),
            ),
          ),

          //bottom rect
          AnimatedPositioned(
            top: size.height * 0.15,
            width: size.width,
            duration: Duration(microseconds: 100),
            child: Container(
              width: size.width * 0.8,
              height: size.height,
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: size.height * 0.05),
                  AnimatedCrossFade(
                    duration: const Duration(milliseconds: 500),
                    firstChild: (isFirstView) ? firstView : thirdView,
                    secondChild: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          InternationalPhoneNumberInput(
                            onInputChanged: (PhoneNumber number) {
                              setState(() {
                                phoneNumberIsValid =
                                    phoneNumberValidator(number.phoneNumber);
                                if (!phoneNumberIsValid) {
                                  phoneNumberStatus = PhoneNumberStatus.error;
                                } else
                                  phoneNumberStatus = PhoneNumberStatus.success;
                              });
                              print(number.phoneNumber);
                              setState(() {
                                phoneNumber = number.phoneNumber;
                              });
                            },
                            onInputValidated: (bool value) {
                              print(value);
                            },
                            selectorConfig: SelectorConfig(
                              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                            ),
                            ignoreBlank: false,
                            autoValidateMode: AutovalidateMode.disabled,
                            selectorTextStyle: TextStyle(color: projectDark),
                            initialValue: initialnumber,
                            textFieldController: phoneNoController,
                          ),
                          (phoneNumberStatus == PhoneNumberStatus.error)
                              ? error(phoneNumber_error)
                              : Text(''),
                        ],
                      ),
                    ),
                    crossFadeState: next
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                  ),
                  Container(
                    height: size.height * 0.4,
                    width: size.width * 0.8,
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: size.height * 0.01),
                        Container(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                text: 'You agree to the edurald',
                                style: gray12Style,
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        'User Agreement, Privacy Policy, and Cookie Policy.',
                                    style: blue12Style,
                                  )
                                ]),
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        SizedBox(height: size.height * 0.01),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          child: ButtonTheme(
                              minWidth: size.width,
                              height: 40,
                              buttonColor: Colors.transparent,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    side: BorderSide(color: projectBlue)),
                                color: projectBlue,
                                child: Text(
                                  'Continue',
                                  style: white18Style,
                                ),
                                onPressed: () async {
                                  setState(() {
                                    _current = ++_current % 3;
                                  });
                                  print(_current);
                                  switch (_current) {
                                    case 1:
                                      if (!emailIsValid || !passwordIsValid) {
                                        _current = 0;
                                        showError(form_update_error);
                                        return;
                                      }
                                      var connectivityResult =
                                          await (Connectivity()
                                              .checkConnectivity());
                                      if (connectivityResult ==
                                          ConnectivityResult.none) {
                                        showError(internet_error);
                                        // Mobile is not Connected to Internet
                                      } else {
                                        registerUser();
                                        // I am connected to a network.
                                      }
                                      break;
                                    case 2:
                                      userNameIsValid = !await userNameExist(
                                          userNameController.text.trim());
                                      emailExist = await mailExist(
                                          emailController.text.trim());
                                      userNameStatus = userNameIsValid
                                          ? UserNameStatus.success
                                          : UserNameStatus.error;
                                      if (!firstNameIsValid ||
                                          emailExist ||
                                          !lastNameIsValid ||
                                          !userNameIsValid) {
                                        _current = 1;
                                        showError(form_update_error);
                                        return;
                                      }
                                      _current = 2;
                                      var connectivityResult =
                                          await (Connectivity()
                                              .checkConnectivity());
                                      if (connectivityResult ==
                                          ConnectivityResult.none) {
                                        showError(internet_error);
                                        // Mobile is not Connected to Internet
                                      } else {
                                        updateUserRecords();
                                        // I am connected to a network.
                                      }
                                      break;
                                    default:
                                      print(_current);
                                      //validatePhoneNumber();
                                      break;
                                  }
                                },
                                highlightElevation: 0.8,
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          AnimatedPositioned(
              top: size.height * socialAuthsLocation,
              duration: Duration(microseconds: 500),
              child: Container(
                  height: size.height * 0.3,
                  color: Colors.transparent,
                  width: size.width,
                  alignment: Alignment.center,
                  child: Column(children: <Widget>[
                    SizedBox(height: size.height * 0.03),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Container(
                                      height: 3,
                                      width: size.width * 0.15,
                                      color: projectBlue),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'or sign up with',
                                    style: darkSemiBold19Style,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Container(
                                      height: 3,
                                      width: size.width * 0.15,
                                      color: projectBlue),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            CupertinoButton(
                                child: Image.asset(
                                    Assets.images.socials.facebook.path,
                                    height: size.height * 0.05),
                                onPressed: () => {
                                      setState(() {
                                        socialMediaSelectedOption = 1;
                                      }),
                                      socialMediaSignup()
                                    }),
                            CupertinoButton(
                                child: Image.asset(
                                    Assets.images.socials.googleIcon.path,
                                    height: size.height * 0.05),
                                onPressed: () => {
                                      setState(() {
                                        socialMediaSelectedOption = 2;
                                      }),
                                      socialMediaSignup()
                                    }),
                            CupertinoButton(
                                child: Image.asset(
                                    Assets.images.socials.twitterIcon.path,
                                    height: size.height * 0.065),
                                onPressed: () => {
                                      setState(() {
                                        socialMediaSelectedOption = 3;
                                      }),
                                      socialMediaSignup()
                                    }),
                          ]),
                    ),
                  ]))),

          AnimatedPositioned(
              top: 10,
              duration: Duration(seconds: 1),
              child: Container(
                height: size.height * blurrySize,
                color: Colors.transparent,
                width: size.width * blurrySize,
              )),

          if (showLoader)
            AnimatedPositioned(
              top: MediaQuery.of(context).size.height * 0,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              duration: Duration(milliseconds: 500),
              child: Center(
                child: new CircularProgressIndicator(),
              ),
            )
        ],
      ),
    );
  }
}
