import 'package:amplify_analytics_pinpoint/amplify_analytics_pinpoint.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_x/models/model_status.dart';
import 'package:project_x/models/strings.dart';
import 'package:project_x/utills/input_util.dart';
import 'package:project_x/utills/styles.dart';
import 'package:project_x/validations/registration_validation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class signinPage extends StatefulWidget {
  signinPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<signinPage>
    with TickerProviderStateMixin {
  String ladyIcon = 'assets/welcomelady.png';
  String socialIcon = 'assets/socials.png';
  String humanIcon3 = 'assets/femaleicon.png';
  String nairaIcon = 'assets/nairacharticon.png';
  String bgIcon = 'assets/bgicon.png';
  String bgMain = 'assets/blankwhite.png';
  String centerIcon = 'assets/shield.png';
  List<String> scrollText = ['Investment banking knowledge simplified',
    'Learn and connect with other investors','Build your professional profile'];
  List<String> scrollImgs = ['assets/ladyIcon2.png','assets/guys.png','assets/welcomelady.png'];
  bool isSignInComplete;
  bool  showLoader = false;
  int index = 0;
  final int _numPages = 3;
  int _currentPage = 0;
  bool _passwordVisible = false;
  bool emailIsValid = false;
  bool passwordIsValid = false;
  EmailStatus emailStatus = EmailStatus.success;
  PasswordValidationResp passwordValidationResp = PasswordValidationResp(0, '');
  PasswordStatus passwordStatus = PasswordStatus.success;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();



  void doMotion() {
  }

  void showPopUp(String msg){
    Fluttertoast.showToast(
        msg:msg,
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
    setState(() {
      showLoader = true;
    });
//    AnalyticsEvent loginEvent = AnalyticsEvent("login_event");
//    loginEvent.properties.addBoolProperty("boolKey", true);
//    loginEvent.properties.addDoubleProperty("doubleKey", 10.0);
//    loginEvent.properties.addIntProperty("intKey", 10);
//    loginEvent.properties.addStringProperty("stringKey", "stringValue");
//
//    Amplify.Analytics.recordEvent(event: loginEvent);
//    print("event logged");
    try {
//      SignInResult res = await Amplify.Auth.signIn(
//        username: emailController.text.trim(),
//        password: passwordController.text.trim(),
//      );
      setState(() {
        showLoader = false;
      });
//      if(res.isSignedIn){
        Navigator.pushNamed(context, '/dashboard');
//      }

    } on AuthError catch (e) {
      setState(() {
        showLoader = false;
      });
      if(e.exceptionList[0].detail == 'User is not confirmed.'){
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('userId', emailController.text);
        resendSignUpCode();
        Fluttertoast.showToast(
            msg:e.exceptionList[0].detail + " Sign up code re-sent",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      Navigator.pushNamed(context, '/registration_token');
      return;
      }

      Navigator.pushNamed(context, '/dashboard');
      Fluttertoast.showToast(
          msg:e.exceptionList[1].exception =='NOT_AUTHORIZED'?'Incorrect username or password':'Connection Error',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } catch (error) {
      print(error);
    }

    setState(() {
      showLoader = false;
    });
  }

  Future<void> resendSignUpCode() async {
    try {
      ResendSignUpCodeResult res = await Amplify.Auth.resendSignUpCode(
        username: emailController.value.text.trim()
      );
    } on AuthError catch (e) {
      print(e);
    }
  }
  @override
  State<StatefulWidget> initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => doMotion());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              overflow: Overflow.visible,
              children: <Widget>[

                AnimatedPositioned(
                    top: 0,
                    duration: Duration(seconds: 1),
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                    )
                ),

                //bottom rect
                AnimatedPositioned(
                  top: MediaQuery.of(context).size.height * 0,
                  height: MediaQuery.of(context).size.height,
                  duration: Duration(seconds: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Welcome back!',style: darkBold25Style,textAlign: TextAlign.center,),
                              Container(
                                height: MediaQuery.of(context).size.height * 0.01,
                              ),
                              Text('Sign in to learn and connect with other professionals like you',style: darkNormal18Style,textAlign: TextAlign.center,),
                            ]),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center, padding:EdgeInsets.all(0),
                        child: Image( image:AssetImage(socialIcon)),
                      ),

                      Container(
                        //height: MediaQuery.of(context).size.height * 0.20,
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center, padding:EdgeInsets.all(0),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              alignment: Alignment.center, padding:EdgeInsets.all(0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                                    child: Container(
                                        height: 3,
                                        width: MediaQuery.of(context).size.width * 0.3,
                                        color: projectGray),
                                  ),
                                  Container(
                                    //height: MediaQuery.of(context).size.height * 0.1,
                                    //width: MediaQuery.of(context).size.width,
                                    alignment: Alignment.center,
                                    child: Text('OR',style: darkSemiBold19Style,textAlign: TextAlign.center,),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                                    child: Container(
                                        height: 3,
                                        width: MediaQuery.of(context).size.width * 0.3,
                                        color: projectGray),
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
                              child:
                              Text('Sign in with Email',style: darkNormal18Style,textAlign: TextAlign.center,),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Container(
                        //height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.8,
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            TextField(
                                decoration: InputDecoration(
                                    labelText: 'Email ',
                                    labelStyle: gray19Style),
                                controller: emailController,
                                onChanged: (value) {
                                  setState(() {
                                    emailIsValid = emailValidator(value);
                                    if (!emailIsValid) {
                                      emailStatus = EmailStatus.error;
                                    } else
                                      emailStatus = EmailStatus.success;
                                  });}
                            ),
                            (emailStatus == EmailStatus.error) ? error(email_error) : Text(''),
                            TextField(
                                decoration: InputDecoration(
                                    labelText: 'Password ',
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _passwordVisible ? Icons.visibility : Icons.visibility_off,
                                        color: projectBlue,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _passwordVisible = !_passwordVisible;
                                        });
                                      },
                                    ),
                                    labelStyle: gray19Style),obscureText: !_passwordVisible,
                                controller: passwordController,
                                onChanged: (value) {
                                  setState(() {
                                    passwordValidationResp = loginPasswordValidator(value);
                                    if (passwordValidationResp.validated == -1) {
                                      passwordStatus = PasswordStatus.error;
                                    } else
                                      passwordStatus = PasswordStatus.success;
                                  });}
                            ),
                            (passwordStatus == PasswordStatus.error) ? error(passwordValidationResp.error) : Text(''),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Container(
                              child:RichText(
                                textAlign: TextAlign.right,
                                text: TextSpan(
                                  text: 'Forgot password?',
                                  style: grayUnderline15Style,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushNamed(context, '/forgotPass');
                                    },
                                ),
                              ),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.04,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        child: Column(
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
                                        side: BorderSide(color: projectBlue)
                                    ),
                                    color: projectBlue,
                                    child: Text('Get Started',style: white18Style,),
                                    onPressed: () async {
                                      var connectivityResult = await (Connectivity().checkConnectivity());
                                      if (connectivityResult == ConnectivityResult.none) {
                                        showPopUp(internet_error);
                                        // Mobile is not Connected to Internet
                                      }
                                      else if (connectivityResult == ConnectivityResult.mobile) {
                                        signInUser();
                                        // I am connected to a mobile network.
                                      }
                                      else if (connectivityResult == ConnectivityResult.wifi) {
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
                    ],
                  ),
                ),

                if(showLoader)AnimatedPositioned(
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
          )

        ));
  }

}