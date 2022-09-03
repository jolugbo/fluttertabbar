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

class admin_office_Page extends StatefulWidget {
  admin_office_Page({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  admin_office_state createState() => admin_office_state();
}

class admin_office_state extends State<admin_office_Page>
    with TickerProviderStateMixin {
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

  Future<void> updateUserRecords() async {
    if (!showLoader) {
      setState(() {
        blurrySize = 1;
        showLoader = true;
      });
      try {} catch (e) {
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
                  top: size.height * 0.1,
                  height: size.height,
                  width: size.width,
                  duration: Duration(seconds: 0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          alignment: Alignment.center,
                          child: ButtonTheme(
                              minWidth: MediaQuery.of(context).size.width * 0.6,
                              height: 40,
                              buttonColor: Colors.transparent,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    side: BorderSide(color: projectBlue)),
                                color: projectBlue,
                                child: Text(
                                  'Create Admin',
                                  style: white18Style,
                                ),
                                onPressed: () async {
                                  var connectivityResult = await (Connectivity()
                                      .checkConnectivity());
                                  if (connectivityResult ==
                                      ConnectivityResult.none) {
                                    showPopUp(internet_error);
                                    // Mobile is not Connected to Internet
                                  } else if (connectivityResult ==
                                      ConnectivityResult.mobile) {
                                    createAdmin();
                                    // I am connected to a mobile network.
                                  } else if (connectivityResult ==
                                      ConnectivityResult.wifi) {
                                    createAdmin();
                                    // I am connected to a wifi network.
                                  }
                                },
                                highlightElevation: 0.8,
                              )),
                        ),
                        SizedBox(height: size.height * 0.12),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          alignment: Alignment.center,
                          child: ButtonTheme(
                              minWidth: MediaQuery.of(context).size.width * 0.6,
                              height: 40,
                              buttonColor: Colors.transparent,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    side: BorderSide(color: projectBlue)),
                                color: projectBlue,
                                child: Text(
                                  'Login as Admin',
                                  style: white18Style,
                                ),
                                onPressed: () async {
                                  var connectivityResult = await (Connectivity()
                                      .checkConnectivity());
                                  if (connectivityResult ==
                                      ConnectivityResult.none) {
                                    showPopUp(internet_error);
                                    // Mobile is not Connected to Internet
                                  } else if (connectivityResult ==
                                      ConnectivityResult.mobile) {
                                    loginAsAdmin();
                                    // I am connected to a mobile network.
                                  } else if (connectivityResult ==
                                      ConnectivityResult.wifi) {
                                    loginAsAdmin();
                                    // I am connected to a wifi network.
                                  }
                                },
                                highlightElevation: 0.8,
                              )),
                        ),
                        SizedBox(height: size.height * 0.12),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          alignment: Alignment.center,
                          child: ButtonTheme(
                              minWidth: MediaQuery.of(context).size.width * 0.6,
                              height: 40,
                              buttonColor: Colors.transparent,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    side: BorderSide(color: projectBlue)),
                                color: projectBlue,
                                child: Text(
                                  'Create a career path',
                                  style: white18Style,
                                ),
                                onPressed: () async {
                                  var connectivityResult = await (Connectivity()
                                      .checkConnectivity());
                                  if (connectivityResult ==
                                      ConnectivityResult.none) {
                                    showPopUp(internet_error);
                                    // Mobile is not Connected to Internet
                                  } else if (connectivityResult ==
                                      ConnectivityResult.mobile) {
                                    createCareerPath();
                                    // I am connected to a mobile network.
                                  } else if (connectivityResult ==
                                      ConnectivityResult.wifi) {
                                    createCareerPath();
                                    // I am connected to a wifi network.
                                  }
                                },
                                highlightElevation: 0.8,
                              )),
                        ),
                        SizedBox(height: size.height * 0.12),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          alignment: Alignment.center,
                          child: ButtonTheme(
                              minWidth: MediaQuery.of(context).size.width * 0.6,
                              height: 40,
                              buttonColor: Colors.transparent,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    side: BorderSide(color: projectBlue)),
                                color: projectBlue,
                                child: Text(
                                  'Create Courses',
                                  style: white18Style,
                                ),
                                onPressed: () async {
                                  var connectivityResult = await (Connectivity()
                                      .checkConnectivity());
                                  if (connectivityResult ==
                                      ConnectivityResult.none) {
                                    showPopUp(internet_error);
                                    // Mobile is not Connected to Internet
                                  } else if (connectivityResult ==
                                      ConnectivityResult.mobile) {
                                    createCareerPath();
                                    // I am connected to a mobile network.
                                  } else if (connectivityResult ==
                                      ConnectivityResult.wifi) {
                                    createCourse0();
                                    createCourse1();
                                    createCourse2();
                                    createCourse3();
                                    createCourse4();
                                    createCourse5();
                                    // I am connected to a wifi network.
                                  }
                                },
                                highlightElevation: 0.8,
                              )),
                        ),
                      ],
                    ),
                  )),

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
