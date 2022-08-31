import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:edurald/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:edurald/models/model_status.dart';
import 'package:edurald/models/strings.dart';
import 'package:edurald/utills/input_util.dart';
import 'package:edurald/utills/styles.dart';
import 'package:edurald/validations/registration_validation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../gen/assets.gen.dart';
import '../../utills/imageanimations.dart';
import '../administration/administration_logic.dart';
import '../dashboard/dashboard.dart';
import '../onboarding/registration_logic.dart';
import 'signin_logic.dart';

class signinPage extends StatefulWidget {
  signinPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<signinPage> with TickerProviderStateMixin {
  //String socialIcon = imageBase+'socials.png';
  List<String> scrollText = [
    'Investment banking knowledge simplified',
    'Learn and connect with other investors',
    'Build your professional profile'
  ];
  bool isSignInComplete = false;
  bool showLoader = false;
  int index = 0;
  int blurrySize = 0;
  bool enableEmail = false;
  int socialMediaSelectedOption = 1;
  double socialAuthsLocation = 0.7;
  final int _numPages = 3;
  int _currentPage = 0;
  int _current = 0;
  bool _passwordVisible = false;
  bool emailIsValid = false;
  bool emailExist = false;
  bool next = true;
  bool userNameIsValid = false;
  bool firstNameIsValid = false;
  bool lastNameIsValid = false;
  EmailStatus emailStatus = EmailStatus.success;
  FirstNameStatus firstNameStatus = FirstNameStatus.success;
  LastNameStatus lastNameStatus = LastNameStatus.success;
  UserNameStatus userNameStatus = UserNameStatus.success;
  PasswordValidationResp passwordValidationResp = PasswordValidationResp(0, '');
  PasswordStatus passwordStatus = PasswordStatus.success;
  TextEditingController emailController = new TextEditingController();
  TextEditingController userNameController = new TextEditingController();
  TextEditingController firstNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  String signInLinkedInIcon = imageBase + 'signInLinkedIn.png';
  String signInTwitterIcon = imageBase + 'signInTwitter.png';
  String signInGoogleIcon = imageBase + 'signInGoogle.png';

  void showPopUp(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
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

  Future<void> signInUser() async {
    await FirebaseAuth.instance.signOut();
    setState(() {
      showLoader = true;
    });
    bool loginSuccess = await signInWithEmailPassword(
        emailController.text.trim(), passwordController.text.trim());
    if (loginSuccess) {
      bool isOldUser = await checkIfUserExist();
      print(isOldUser);
      if (isOldUser) {
        Get.offAll(() => dashboardPage());
        return;
      } else
        setState(() {
          _current = ++_current % 3;
          userNameController.text = user.user?.displayName ?? "";
          emailController.text = user.user?.email ?? "";
          userNameController.text = userNameController.text.replaceAll(' ', '');
          socialAuthsLocation = 1;
          next = !next;
          blurrySize = 0;
          showLoader = false;
        });
    } else {
      showError("Error loggging in");
    }
    //await FirebaseAnalytics.instance.logLogin(loginMethod: "email");
    //    loginEvent.properties.addBoolProperty("boolKey", true);
    //    loginEvent.properties.addDoubleProperty("doubleKey", 10.0);
    //    loginEvent.properties.addIntProperty("intKey", 10);
    //    loginEvent.properties.addStringProperty("stringKey", "stringValue");
    //
    //    Amplify.Analytics.recordEvent(event: loginEvent);
    //    print("event logged");
    //     try {
    // //      SignInResult res = await Amplify.Auth.signIn(
    // //        username: emailController.text.trim(),
    // //        password: passwordController.text.trim(),
    // //      );
    //       setState(() {
    //         showLoader = false;
    //       });
    // //      if(res.isSignedIn){
    // //      }
    //
    //     } on AuthError catch (e) {
    //       setState(() {
    //         showLoader = false;
    //       });
    //       if(e.exceptionList[0].detail == 'User is not confirmed.'){
    //         final prefs = await SharedPreferences.getInstance();
    //         await prefs.setString('userId', emailController.text);
    //         resendSignUpCode();
    //         Fluttertoast.showToast(
    //             msg:e.exceptionList[0].detail + " Sign up code re-sent",
    //             toastLength: Toast.LENGTH_LONG,
    //             gravity: ToastGravity.BOTTOM,
    //             timeInSecForIosWeb: 1,
    //             backgroundColor: Colors.red,
    //             textColor: Colors.white,
    //             fontSize: 16.0);
    //       Navigator.pushNamed(context, '/registration_token');
    //       return;
    //       }
    //
    //       Navigator.pushNamed(context, '/dashboard');
    //       Fluttertoast.showToast(
    //           msg:e.exceptionList[1].exception =='NOT_AUTHORIZED'?'Incorrect username or password':'Connection Error',
    //           toastLength: Toast.LENGTH_LONG,
    //           gravity: ToastGravity.BOTTOM,
    //           timeInSecForIosWeb: 1,
    //           backgroundColor: Colors.red,
    //           textColor: Colors.white,
    //           fontSize: 16.0);
    //     } catch (error) {
    //       print(error);
    //     }
  }

  socialMediaSignin() async {
    await FirebaseAuth.instance.signOut();
    try {
      setState(() {
        blurrySize = 1;
        showLoader = true;
      });
      if (socialMediaSelectedOption == 1) {
        //user = await signInWithFacebook();
      } else if (socialMediaSelectedOption == 2) {
        user = await signInWithGoogle();
      } else if (socialMediaSelectedOption == 3) {
        print("Twitter click");
        user = await signInWithTwitter();
        enableEmail = true;
      }
      if (FirebaseAuth.instance.currentUser != null) {
        bool isOldUser = await checkIfUserExist();
        print(FirebaseAuth.instance.currentUser);
        print(isOldUser);
        if (isOldUser) {
          Get.offAll(() => dashboardPage());
          return;
        } else
          setState(() {
            _current = ++_current % 3;
            userNameController.text = user.user?.displayName ?? "";
            emailController.text = user.user?.email ?? "";
            userNameController.text =
                userNameController.text.replaceAll(' ', '');
            // _current = 2;
            socialAuthsLocation = 1;
            next = !next;
            blurrySize = 0;
            showLoader = false;
          });
      } else {
        setState(() {
          blurrySize = 0;
          showLoader = false;
        });
        showPopUp('Account Not Authenticated.');
      }
    } catch (e) {
      print("Hereee");
      print(e.toString());
      if (e.toString() ==
          "LateInitializationError: Field 'user' has already been initialized.") {
        if (FirebaseAuth.instance.currentUser != null) {
          bool isOldUser = await checkIfUserExist();
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
              blurrySize = 0;
              showLoader = false;
            });
        }
      } else {
        setState(() {
          blurrySize = 0;
          showLoader = false;
        });
        showPopUp('Account Not Authenticated.');
      }
      //show error signing up notification
    }
  }

  Future<void> updateUserRecords() async {
    if (!showLoader) {
      setState(() {
        blurrySize = 1;
        showLoader = true;
      });
      try {
        saveUserToFirestore(
            user.user,
            emailController.text.trim(),
            firstNameController.text.trim(),
            lastNameController.text.trim(),
            userNameController.text.trim(),
            user.user?.photoURL ?? "");
        Get.offAll(dashboardPage());
      } catch (e) {
        showError(e.toString());
        setState(() {
          blurrySize = 0;
          showLoader = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        //resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
            child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            //overflow: Overflow.visible,
            children: <Widget>[
              AnimatedPositioned(
                  top: 0,
                  duration: Duration(seconds: 1),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                  )),

              //bottom rect
              AnimatedPositioned(
                  top: size.height * 0,
                  height: size.height,
                  width: size.width,
                  duration: Duration(seconds: 0),
                  child: Container(
                    alignment: Alignment.center,
                    child: AnimatedCrossFade(
                      duration: const Duration(milliseconds: 500),
                      firstChild: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: size.width,
                              alignment: Alignment.center,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(height: size.height * 0.05),
                                    Hero(
                                      tag: "splashscreenImage",
                                      child: WidgetAnimator(
                                        component: Container(
                                          height: size.height * 0.1,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          alignment: Alignment.topCenter,
                                          child: imgAnimation2(
                                            url:
                                                Assets.images.logoWithName.path,
                                            time: Duration(milliseconds: 4000),
                                            width: size.width * 0.5,
                                            beginx: 0.1,
                                            endx: -0.1,
                                            beginy: 0,
                                            endy: 0,
                                            height: size.height * 0.5,
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
                                        'Welcome back!',
                                        style: blue25BoldStyle,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(height: size.height * 0.02),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.95,
                                      child: Text(
                                        'Sign in to learn and connect with other professionals like you',
                                        style: darkNormal18Style,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(height: size.height * 0.05),
                                  ]),
                            ),
                            Container(
                              width: size.width * 0.8,
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  TextField(
                                      decoration: InputDecoration(
                                          labelText: 'Email ',
                                          labelStyle: blue20Style),
                                      controller: emailController,
                                      onChanged: (value) {
                                        setState(() {
                                          emailIsValid = emailValidator(value);
                                          if (!emailIsValid) {
                                            emailStatus = EmailStatus.error;
                                          } else
                                            emailStatus = EmailStatus.success;
                                        });
                                      }),
                                  (emailStatus == EmailStatus.error)
                                      ? error(email_invalid_error)
                                      : Text(''),
                                  TextField(
                                      decoration: InputDecoration(
                                          labelText: 'Password ',
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              _passwordVisible
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              color: projectBlue,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                _passwordVisible =
                                                    !_passwordVisible;
                                              });
                                            },
                                          ),
                                          labelStyle: blue20Style,
                                          focusColor: projectBlue),
                                      obscureText: !_passwordVisible,
                                      controller: passwordController,
                                      onChanged: (value) {
                                        setState(() {
                                          passwordValidationResp =
                                              loginPasswordValidator(value);
                                          if (passwordValidationResp
                                                  .validated ==
                                              -1) {
                                            passwordStatus =
                                                PasswordStatus.error;
                                          } else
                                            passwordStatus =
                                                PasswordStatus.success;
                                        });
                                      }),
                                  (passwordStatus == PasswordStatus.error)
                                      ? error(passwordValidationResp.error)
                                      : Text(''),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Container(
                                    child: RichText(
                                      textAlign: TextAlign.right,
                                      text: TextSpan(
                                        text: 'Forgot password?',
                                        style: grayUnderline15Style,
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.pushNamed(
                                                context, '/forgotPass');
                                          },
                                      ),
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.04,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.center,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    alignment: Alignment.center,
                                    child: ButtonTheme(
                                        minWidth:
                                            MediaQuery.of(context).size.width *
                                                0.6,
                                        height: 40,
                                        buttonColor: Colors.transparent,
                                        child: RaisedButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              side: BorderSide(
                                                  color: projectBlue)),
                                          color: projectBlue,
                                          child: Text(
                                            'Get Started',
                                            style: white18Style,
                                          ),
                                          onPressed: () async {
                                            if (!emailIsValid ||
                                                (passwordStatus ==
                                                    PasswordStatus.error)) {
                                              _current = 0;
                                              showError(form_update_error);
                                              return;
                                            }
                                            var connectivityResult =
                                                await (Connectivity()
                                                    .checkConnectivity());
                                            if (connectivityResult ==
                                                ConnectivityResult.none) {
                                              showPopUp(internet_error);
                                              // Mobile is not Connected to Internet
                                            } else if (connectivityResult ==
                                                ConnectivityResult.mobile) {
                                              signInUser();
                                              // I am connected to a mobile network.
                                            } else if (connectivityResult ==
                                                ConnectivityResult.wifi) {
                                              signInUser();
                                              // I am connected to a wifi network.
                                            }
                                          },
                                          highlightElevation: 0.8,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: size.height * 0.12),
                          ],
                        ),
                      ),
                      secondChild: Column(children: <Widget>[
                        Container(
                          width: size.width * 0.8,
                          alignment: Alignment.center,
                          //padding: EdgeInsets.all(0),
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
                                      url: Assets.images.logoPng.path,
                                      time: Duration(milliseconds: 4000),
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
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
                              Visibility(
                                child: TextField(
                                    textAlignVertical: TextAlignVertical.bottom,
                                    decoration: InputDecoration(
                                        labelText: 'Email ',
                                        labelStyle: blue20Style),
                                    keyboardType: TextInputType.emailAddress,
                                    controller: emailController,
                                    onSubmitted: (value) async {
                                      await checkIfEmailExist(
                                          emailController.text.trim());
                                    },
                                    onChanged: (value) async {
                                      emailExist = await checkIfEmailExist(
                                          emailController.text.trim());
                                      setState(() {
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
                              Container(
                                child: Visibility(
                                  child: (emailStatus == EmailStatus.error)
                                      ? error(email_invalid_error)
                                      : Text(''),
                                  maintainSize: false,
                                  maintainAnimation: true,
                                  maintainState: true,
                                  visible: !emailIsValid,
                                ),
                                alignment: Alignment.topLeft,
                              ),
                              Container(
                                child: (emailExist)
                                    ? error(email_exist_error)
                                    : Text(''),
                                alignment: Alignment.topLeft,
                              ),
                              TextField(
                                  decoration: InputDecoration(
                                      labelText: 'User name :-',
                                      labelStyle: blue20Style),
                                  controller: userNameController,
                                  onSubmitted: (value) async {
                                    if (value.contains(" ")) {
                                      userNameController.text =
                                          value.replaceAll(' ', '');
                                      showPopUp(
                                          "space not allowed for UserName");
                                    }
                                    print("got here");
                                    userNameIsValid = !await userNameExist(
                                        userNameController.text.trim());
                                    setState(() {
                                      if (userNameIsValid) {
                                        userNameStatus = UserNameStatus.success;
                                      } else
                                        userNameStatus = UserNameStatus.error;
                                    });
                                  },
                                  onChanged: (value) async {
                                    if (value.contains(" ")) {
                                      userNameController.text =
                                          value.replaceAll(' ', '');
                                      showPopUp(
                                          "space not allowed for UserName");
                                    }
                                    userNameIsValid = !await userNameExist(
                                        userNameController.text.trim());
                                    setState(() {
                                      if (userNameIsValid) {
                                        userNameStatus = UserNameStatus.success;
                                      } else
                                        userNameStatus = UserNameStatus.error;
                                    });
                                  }),
                              Container(
                                child: (userNameStatus == UserNameStatus.error)
                                    ? error(userName_error)
                                    : Text(''),
                                alignment: Alignment.topLeft,
                              ),
                              TextField(
                                  decoration: InputDecoration(
                                      labelText: 'First name :-',
                                      labelStyle: blue20Style),
                                  controller: firstNameController,
                                  onChanged: (value) {
                                    setState(() {
                                      firstNameIsValid =
                                          firstNameValidator(value);
                                      if (!firstNameIsValid) {
                                        firstNameStatus = FirstNameStatus.error;
                                      } else
                                        firstNameStatus =
                                            FirstNameStatus.success;
                                    });
                                  }),
                              Container(
                                child:
                                    (firstNameStatus == FirstNameStatus.error)
                                        ? error(firstName_error)
                                        : Text(''),
                                alignment: Alignment.topLeft,
                              ),
                              TextField(
                                  decoration: InputDecoration(
                                      labelText: 'Last name :-',
                                      labelStyle: blue20Style),
                                  controller: lastNameController,
                                  onChanged: (value) {
                                    setState(() {
                                      lastNameIsValid =
                                          lastNameValidator(value);
                                      if (!lastNameIsValid) {
                                        lastNameStatus = LastNameStatus.error;
                                      } else
                                        lastNameStatus = LastNameStatus.success;
                                    });
                                  }),
                              Container(
                                child: (lastNameStatus == LastNameStatus.error)
                                    ? error(lastName_error)
                                    : Text(''),
                                alignment: Alignment.topLeft,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: size.height * 0.2,
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
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
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
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          side: BorderSide(color: projectBlue)),
                                      color: projectBlue,
                                      child: Text(
                                        'Continue',
                                        style: white18Style,
                                      ),
                                      onPressed: () async {
                                        emailExist = await checkIfEmailExist(
                                            emailController.text.trim());
                                        userNameIsValid = !await userNameExist(
                                            userNameController.text.trim());
                                        setState(() {
                                          firstNameIsValid = firstNameValidator(
                                              firstNameController.text.trim());
                                          lastNameIsValid = lastNameValidator(
                                              firstNameController.text.trim());
                                          emailIsValid = emailValidator(
                                              emailController.text.trim());

                                          emailStatus = (emailIsValid)
                                              ? EmailStatus.success
                                              : EmailStatus.error;
                                          lastNameStatus = (lastNameIsValid)
                                              ? LastNameStatus.success
                                              : LastNameStatus.error;
                                          firstNameStatus = (firstNameIsValid)
                                              ? FirstNameStatus.success
                                              : FirstNameStatus.error;
                                          userNameStatus = (userNameIsValid)
                                              ? UserNameStatus.success
                                              : UserNameStatus.error;
                                        });
                                        if (!firstNameIsValid ||
                                            emailExist ||
                                            !userNameIsValid ||
                                            !emailIsValid ||
                                            !lastNameIsValid) {
                                          showPopUp(form_update_error);
                                          return;
                                        }
                                        var connectivityResult =
                                            await (Connectivity()
                                                .checkConnectivity());
                                        if (connectivityResult ==
                                            ConnectivityResult.none) {
                                          showPopUp(internet_error);
                                          // Mobile is not Connected to Internet
                                        } else {
                                          print("Got here");
                                          updateUserRecords();
                                        }
                                      },
                                      highlightElevation: 0.8,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ]),
                      crossFadeState: next
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                    ),
                  )),

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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Container(
                                          height: 3,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3,
                                          color: projectBlue),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'OR',
                                        style: darkSemiBold19Style,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Container(
                                          height: 3,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3,
                                          color: projectBlue),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        //SizedBox(height: size.height * 0.02),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.15,
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
                                    onPressed: () =>
                                        {print("facebook clicked")}),
                                CupertinoButton(
                                    child: Image.asset(
                                        Assets.images.socials.googleIcon.path,
                                        height: size.height * 0.05),
                                    onPressed: () async => {
                                          socialMediaSelectedOption = 2,
                                          await socialMediaSignin(),
                                        }),
                                CupertinoButton(
                                    child: Image.asset(
                                        Assets.images.socials.twitterIcon.path,
                                        height: size.height * 0.065),
                                    onPressed: () async => {
                                          socialMediaSelectedOption = 3,
                                          await socialMediaSignin(),
                                        }),
                              ]),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            alignment: Alignment.center,
                            child: GestureDetector(
                              child: Text(
                                "Don't have an account ?",
                                style: blue20Style,
                              ),
                              onTap: () => {
                                Navigator.pushNamed(
                                    context, '/registration_form')
                              },
                            )),
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
        )));
  }
}
