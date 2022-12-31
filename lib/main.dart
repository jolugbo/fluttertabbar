//import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edurald/utills/observers/app_bloc_observer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:edurald/features/signin/signin.dart';
import 'package:edurald/features/dashboard/dashboard.dart';
import 'package:edurald/features/deepest_study/deepest_study.dart';
import 'package:edurald/features/notifications/notifications.dart';
import 'package:edurald/features/share/share.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/champions_league/champions_league.dart';
import 'features/function_test/function_test.dart';
import 'features/onboarding/registration.dart';
import 'features/onboarding/registration_form.dart';
import 'features/onboarding/registration_token.dart';
import 'features/onboarding/walkthrough.dart';
import 'features/administration/administration_office.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'repository/models/user/user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final userRef = FirebaseFirestore.instance.collection('users');
final authsRef = FirebaseFirestore.instance.collection('auths');
final careersRef = FirebaseFirestore.instance.collection('careers');
final coursesRef = FirebaseFirestore.instance.collection('courses');
final quizesRef = FirebaseFirestore.instance.collection('quizes');
final educatorsRef = FirebaseFirestore.instance.collection('educators');
late User user;
late final UserModel userProfile;

// final postRef =  FirebaseFirestore.instance.collection('posts');
// final commentsRef =  FirebaseFirestore.instance.collection('comments');
// final activityFeedRef =  FirebaseFirestore.instance.collection('feeds');
// final followersRef =  FirebaseFirestore.instance.collection('followers');
// final followingRef =  FirebaseFirestore.instance.collection('following');
// final timelineRef =  FirebaseFirestore.instance.collection('timeline');
// final storageRef = FirebaseStorage.instance.ref();
//User? currentUser;
final GoogleSignIn googleSignIn = GoogleSignIn();
const bool USE_FIRESTORE_EMULATOR = true;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  dotenv.load();
  await Firebase.initializeApp();
  if (kIsWeb) {
    // initialiaze the facebook javascript SDK
    await FacebookAuth.instance.webInitialize(
      appId: "1329834907365798",
      cookie: true,
      xfbml: true,
      version: "v13.0",
    );
  }
  BlocOverrides.runZoned(
    () => runApp(MyApp()),
    blocObserver: AppBlocObserver(),
  );
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
  bool isAuth = false;
  bool rewardEarned = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String version = '';
  bool hasLoggedIn = false;

  getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    print(packageInfo.version);
    setState(() {
      version = 'V.' + packageInfo.version;
    });
  }

  getAppState() async {
    //await FirebaseAuth.instance.signOut();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    FirebaseAuth.instance.authStateChanges().listen((User? loggedInuser) {
      print(loggedInuser);
      if (loggedInuser == null) {
        hasLoggedIn = false;
      } else {
        user = loggedInuser;
        hasLoggedIn = true;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getAppVersion();
    getAppState();
    // googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
    //   handleSignIn(account);
    // },onError: (err){
    //   ////print('Error signing in: $err');
    // });
    // googleSignIn.signInSilently(suppressErrors: false)
    //     .then((GoogleSignInAccount account) => handleSignIn(account))
    //     .catchError((err){
    //   ////print('Error signing in: $err');
    // });
  }

//   handleSignIn(GoogleSignInAccount account) async {
//     if(account != null){
//       await createUserInFireStore();
//       setState(() {
//         isAuth = true;
//       });
//       configurePushNotifications();
//     }else{
//       setState(() {
//         isAuth = false;
//       });
//     }
//   }
//
//
//   createUserInFireStore() async{
//     final GoogleSignInAccount user = googleSignIn.currentUser;
//     DocumentSnapshot doc = await userRef.doc(user.id).get();
//
//     if(!doc.exists){
//       final userForm = await Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAccount()));
//       print(userForm);
//       userRef.doc(user.id).set({
//         "id": user.id,
//         "username": userForm['userName'],
//         "phoneNumber": userForm['phoneNumber'],
//         "photoUrl": user.photoUrl,
//         "email": user.email,
//         "displayName": user.displayName,
//         "bio": "",
//         "timeStamp": timeStamp
//       });
//       await followersRef.doc(user.id)
//           .collection("userFollowers")
//           .doc(user.id)
//           .set({});
//       doc = await userRef.doc(user.id).get();
//     }
//     currentUser = User.fromDocument(doc);
//     //print(currentUser);
//     //print(currentUser.displayName);
//   }
//
//   Future<void> registerUser() async {
//     AnalyticsEvent loginEvent = AnalyticsEvent("login_event");
//     loginEvent.properties.addBoolProperty("boolKey", true);
//     loginEvent.properties.addDoubleProperty("doubleKey", 10.0);
//     loginEvent.properties.addIntProperty("intKey", 10);
//     loginEvent.properties.addStringProperty("stringKey", "stringValue");
//
//     Amplify.Analytics.recordEvent(event: loginEvent);
//     Amplify.Analytics.flushEvents();
//
//     print("event logged");
// //    try{
// //      Map<String, dynamic> userAttributes = {
// //        "email": 'jolugooofemi@gmail.com',
// //        //"phone_number": '07061185385',
// //        // additional attributes as needed
// //      };
// //      SignUpResult res = await Amplify.Auth.signUp(
// //          username: "jolugbooo",
// //          password: "test1password",
// //          options: CognitoSignUpOptions(
// //              userAttributes: userAttributes
// //          ),
// //      );
// //      print(isSignUpComplete);
// //      print('got here');
// //      setState(() {
// //        isSignUpComplete = res.isSignUpComplete;
// //      });
// //    } on AuthError catch (e) {
// //      print(e);
// //    }
//   }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // routes: {
        //   // When navigating to the "/" route, build the FirstScreen widget.
        //   //'/': (context) => WalkThrough(),
        //   // When navigating to the "/second" route, build the SecondScreen widget.
        //   '/walkthrough': (context) => walkthroughPage(),
        //   '/registration': (context) => registrationPage(),
        //   '/registration_form': (context) => registration_formPage(),
        //   '/registration_token': (context) => registration_tokenPage(),
        //   '/signin': (context) => signinPage(),
        //   '/dashboard': (context) => dashboardPage(),
        //   '/leaderboard': (context) => leaderboard(),
        //   '/share': (context) => share(),
        //   '/notifications': (context) => notifications(),
        //   '/deepest_learning': (context) => deepest_learning(),
        // },
        onGenerateRoute: (RouteSettings settings) {
          // return landing.route();
        },
        theme: ThemeData(
          fontFamily: 'Montserrat',
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SafeArea(
            child: Scaffold(
          body: (hasLoggedIn) ? dashboardPage() : walkthroughPage(),
          backgroundColor: Colors.transparent,
          //admin_office_Page(), //
          //functionTest_page(),//
        )));
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          (hasLoggedIn) ? signinPage() : walkthroughPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
