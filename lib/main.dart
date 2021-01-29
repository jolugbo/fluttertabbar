
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_x/utills/demo.dart';
import 'package:project_x/views/externals/new_customer/registration.dart';
import 'package:project_x/views/externals/new_customer/registration_form.dart';
import 'package:project_x/views/externals/new_customer/walkthrough.dart';
import 'package:project_x/views/externals/returning_customer/registration_token.dart';
import 'package:project_x/views/externals/signin.dart';
import 'package:project_x/views/internals/dashboard.dart';
import 'package:project_x/views/internals/inner/deepest_learning.dart';
import 'package:project_x/views/internals/inner/leaderboard.dart';
// Amplify Flutter Packages
import 'package:amplify_core/amplify_core.dart';
import 'package:amplify_analytics_pinpoint/amplify_analytics_pinpoint.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:project_x/views/internals/inner/notifications.dart';
import 'package:project_x/views/internals/inner/share.dart';

// Generated in previous step
import 'amplifyconfiguration.dart';


void main() {
  runApp(MyApp());
}

//class MyApp extends StatelessWidget {
//  bool _amplifyConfigured = false;
//  Amplify amplifyInstance = Amplify();
//
//
//  void _configureAmplify() async {
//
//    // Add Pinpoint and Cognito Plugins, or any other plugins you want to use
//    AmplifyAnalyticsPinpoint analyticsPlugin = AmplifyAnalyticsPinpoint();
//    AmplifyAuthCognito authPlugin = AmplifyAuthCognito();
//    amplifyInstance.addPlugin(
//        authPlugins: [authPlugin],
//        analyticsPlugins: [analyticsPlugin]
//    );
//
//    // Once Plugins are added, configure Amplify
//    await amplifyInstance.configure(amplifyconfig);
//    try {
//      _amplifyConfigured = true;
//    } catch (e) {
//      print(e);
//    }
//Cl2hf8tdIRgP8MPHwG2HkzXow0QSjYO16Ke1o7P+
//  }
//
//}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // gives our app awareness about whether we are succesfully connected to the cloud
  bool _amplifyConfigured = false;

  // Instantiate Amplify
  Amplify amplifyInstance = Amplify();






  @override
  void initState() {
    super.initState();

    // amplify is configured on startup
    _configureAmplify();
    _fetchSession();
  }
  void _fetchSession() async {
    try {
      AuthUser res = await Amplify.Auth.getCurrentUser();
      print(res.username);
      print(res.userId);
    } on AuthError catch (e) {
      print(e);
    }
  }
  void _configureAmplify() {
    if (!mounted) return;

    Amplify amplifyInstance = Amplify();
    // Add Pinpoint and Cognito Plugins, or any other plugins you want to use
    AmplifyAnalyticsPinpoint analyticsPlugin = AmplifyAnalyticsPinpoint();
    AmplifyAuthCognito authPlugin = AmplifyAuthCognito();
    amplifyInstance.addPlugin(authPlugins: [authPlugin]);
    amplifyInstance.addPlugin(analyticsPlugins: [analyticsPlugin]);
    amplifyInstance.configure(amplifyconfig);

    try {
      setState(() {
        _amplifyConfigured = true;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> registerUser() async {
    AnalyticsEvent loginEvent = AnalyticsEvent("login_event");
    loginEvent.properties.addBoolProperty("boolKey", true);
    loginEvent.properties.addDoubleProperty("doubleKey", 10.0);
    loginEvent.properties.addIntProperty("intKey", 10);
    loginEvent.properties.addStringProperty("stringKey", "stringValue");

    Amplify.Analytics.recordEvent(event: loginEvent);
    Amplify.Analytics.flushEvents();

    print("event logged");
//    try{
//      Map<String, dynamic> userAttributes = {
//        "email": 'jolugooofemi@gmail.com',
//        //"phone_number": '07061185385',
//        // additional attributes as needed
//      };
//      SignUpResult res = await Amplify.Auth.signUp(
//          username: "jolugbooo",
//          password: "test1password",
//          options: CognitoSignUpOptions(
//              userAttributes: userAttributes
//          ),
//      );
//      print(isSignUpComplete);
//      print('got here');
//      setState(() {
//        isSignUpComplete = res.isSignUpComplete;
//      });
//    } on AuthError catch (e) {
//      print(e);
//    }
  }
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        //'/': (context) => WalkThrough(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/walkthrough': (context) => walkthroughPage(),
        '/registration': (context) => registrationPage(),
        '/registration_form': (context) => registration_formPage(),
        '/registration_token': (context) => registration_tokenPage(),
        '/signin': (context) => signinPage(),
        '/dashboard': (context) => dashboardPage(),
        '/leaderboard': (context) => leaderboard(),
        '/share': (context) => share(),
        '/notifications': (context) => notifications(),
        '/deepest_learning': (context) => deepest_learning(),
      },
      onGenerateRoute: (RouteSettings settings) {
        // return landing.route();
      },
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: walkthroughPage(),
    );
  }
}