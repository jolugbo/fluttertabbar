
//import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:edurald/features/signin/signin.dart';
import 'package:edurald/features/dashboard/dashboard.dart';
import 'package:edurald/features/deepest_study/deepest_study.dart';
import 'package:edurald/features/notifications/notifications.dart';
import 'package:edurald/features/share/share.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/champions_league/champions_league.dart';
import 'features/onboarding/registration.dart';
import 'features/onboarding/registration_form.dart';
import 'features/onboarding/registration_token.dart';
import 'features/onboarding/walkthrough.dart';
import 'gen/assets.gen.dart';
//import 'models/user.dart';
import 'package:firebase_core/firebase_core.dart';

// final userRef =  FirebaseFirestore.instance.collection('users');
// final postRef =  FirebaseFirestore.instance.collection('posts');
// final commentsRef =  FirebaseFirestore.instance.collection('comments');
// final activityFeedRef =  FirebaseFirestore.instance.collection('feeds');
// final followersRef =  FirebaseFirestore.instance.collection('followers');
// final followingRef =  FirebaseFirestore.instance.collection('following');
// final timelineRef =  FirebaseFirestore.instance.collection('timeline');
// final storageRef = FirebaseStorage.instance.ref();
//User? currentUser;
final GoogleSignIn googleSignIn = GoogleSignIn();
bool USE_FIRESTORE_EMULATOR = true;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  if (USE_FIRESTORE_EMULATOR) {
    // FirebaseFirestore.instance.settings = const Settings(
    //   host: 'localhost:8080', sslEnabled: false, persistenceEnabled: false,);
    await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  }
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
  bool isAuth = false;
  bool rewardEarned = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String version='';
  bool hasLoggedIn = false;




  getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    print(packageInfo.version);
    setState(() {
      version = 'V.'+packageInfo.version;
    });
  }

  getAppState() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        hasLoggedIn = false;
      } else {
        hasLoggedIn = true;
      }
    });
    FirebaseAuth.instance
        .idTokenChanges()
        .listen((User? user) {
      if (user == null) {
        hasLoggedIn = false;
      } else {
        hasLoggedIn = true;
      }
    });
  }

  @override
  void initState(){
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
          home: Scaffold(
            body: (hasLoggedIn) ? signinPage(): walkthroughPage(),
        ));
  }
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => (hasLoggedIn) ? signinPage(): walkthroughPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }


  // @override
  // Widget build(BuildContext context) {
  //   SystemChrome.setPreferredOrientations([
  //     DeviceOrientation.portraitUp,
  //     DeviceOrientation.portraitDown,
  //   ]);
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     routes: {
  //       // When navigating to the "/" route, build the FirstScreen widget.
  //       //'/': (context) => WalkThrough(),
  //       // When navigating to the "/second" route, build the SecondScreen widget.
  //       '/walkthrough': (context) => walkthroughPage(),
  //       '/registration': (context) => registrationPage(),
  //       '/registration_form': (context) => registration_formPage(),
  //       '/registration_token': (context) => registration_tokenPage(),
  //       '/signin': (context) => signinPage(),
  //       '/dashboard': (context) => dashboardPage(),
  //       '/leaderboard': (context) => leaderboard(),
  //       '/share': (context) => share(),
  //       '/notifications': (context) => notifications(),
  //       '/deepest_learning': (context) => deepest_learning(),
  //     },
  //     onGenerateRoute: (RouteSettings settings) {
  //       // return landing.route();
  //     },
  //     theme: ThemeData(
  //       fontFamily: 'Montserrat',
  //       primarySwatch: Colors.blue,
  //       visualDensity: VisualDensity.adaptivePlatformDensity,
  //     ),
  //     home: (hasLoggedIn) ? signinPage(): walkthroughPage(),
  //   );
  // }
}


// import 'package:flutter/material.dart';
// import 'package:linkedin_login/linkedin_login.dart';
//
// // ignore_for_file: avoid_print
// void main() => runApp(MyApp());
//
// // @TODO IMPORTANT - you need to change variable values below
// // You need to add your own data from LinkedIn application
// // From: https://www.linkedin.com/developers/
// // Please read step 1 from this link https://developer.linkedin.com/docs/oauth2
// const String redirectUrl = 'https://www.youtube.com/callback';
// const String clientId = '776rnw4e4izlvg';
// const String clientSecret = 'rQEgboUHMLcQi59v';
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter LinkedIn demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: DefaultTabController(
//         length: 2,
//         child: Scaffold(
//           appBar: AppBar(
//             bottom: TabBar(
//               tabs: [
//                 Tab(
//                   icon: Icon(Icons.person),
//                   text: 'Profile',
//                 ),
//                 Tab(icon: Icon(Icons.text_fields), text: 'Auth code')
//               ],
//             ),
//             title: Text('LinkedIn Authorization'),
//           ),
//           body: TabBarView(
//             children: [
//               LinkedInProfileExamplePage(),
//               LinkedInAuthCodeExamplePage(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class LinkedInProfileExamplePage extends StatefulWidget {
//   @override
//   State createState() => _LinkedInProfileExamplePageState();
// }
//
// class _LinkedInProfileExamplePageState
//     extends State<LinkedInProfileExamplePage> {
//   UserObject user;
//   bool logoutUser = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisSize: MainAxisSize.max,
//         children: <Widget>[
//           LinkedInButtonStandardWidget(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (BuildContext context) => LinkedInUserWidget(
//                     appBar: AppBar(
//                       title: Text('OAuth User'),
//                     ),
//                     destroySession: logoutUser,
//                     redirectUrl: redirectUrl,
//                     clientId: clientId,
//                     clientSecret: clientSecret,
//                     projection: [
//                       ProjectionParameters.id,
//                       ProjectionParameters.localizedFirstName,
//                       ProjectionParameters.localizedLastName,
//                       ProjectionParameters.firstName,
//                       ProjectionParameters.lastName,
//                       ProjectionParameters.profilePicture,
//                     ],
//                     onError: (UserFailedAction e) {
//                       print('Error: ${e.toString()}');
//                       print('Error: ${e.stackTrace.toString()}');
//                     },
//                     onGetUserProfile: (UserSucceededAction linkedInUser) {
//                       print(
//                           'Access token ${linkedInUser.user.token.accessToken}');
//
//                       print('User id: ${linkedInUser.user.userId}');
//
//                       user = UserObject(
//                         firstName:
//                         linkedInUser?.user?.firstName?.localized?.label,
//                         lastName:
//                         linkedInUser?.user?.lastName?.localized?.label,
//                         email: linkedInUser?.user?.email?.elements[0]
//                             ?.handleDeep?.emailAddress,
//                         profileImageUrl: linkedInUser
//                             ?.user
//                             ?.profilePicture
//                             ?.displayImageContent
//                             ?.elements[0]
//                             ?.identifiers[0]
//                             ?.identifier,
//                       );
//
//                       setState(() {
//                         logoutUser = false;
//                       });
//
//                       Navigator.pop(context);
//                     },
//                   ),
//                   fullscreenDialog: true,
//                 ),
//               );
//             },
//           ),
//           LinkedInButtonStandardWidget(
//             onTap: () {
//               setState(() {
//                 user = null;
//                 logoutUser = true;
//               });
//             },
//             buttonText: 'Logout',
//           ),
//           Column(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('First: ${user?.firstName} '),
//               Text('Last: ${user?.lastName} '),
//               Text('Email: ${user?.email}'),
//               Text('Profile image: ${user?.profileImageUrl}'),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class LinkedInAuthCodeExamplePage extends StatefulWidget {
//   @override
//   State createState() => _LinkedInAuthCodeExamplePageState();
// }
//
// class _LinkedInAuthCodeExamplePageState
//     extends State<LinkedInAuthCodeExamplePage> {
//   AuthCodeObject authorizationCode;
//   bool logoutUser = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisSize: MainAxisSize.max,
//       children: <Widget>[
//         LinkedInButtonStandardWidget(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (BuildContext context) => LinkedInAuthCodeWidget(
//                   destroySession: logoutUser,
//                   redirectUrl: redirectUrl,
//                   clientId: clientId,
//                   onError: (AuthorizationFailedAction e) {
//                     print('Error: ${e.toString()}');
//                     print('Error: ${e.stackTrace.toString()}');
//                   },
//                   onGetAuthCode: (AuthorizationSucceededAction response) {
//                     print('Auth code ${response.codeResponse.code}');
//
//                     print('State: ${response.codeResponse.state}');
//
//                     authorizationCode = AuthCodeObject(
//                       code: response.codeResponse.code,
//                       state: response.codeResponse.state,
//                     );
//                     setState(() {});
//
//                     Navigator.pop(context);
//                   },
//                 ),
//                 fullscreenDialog: true,
//               ),
//             );
//           },
//         ),
//         LinkedInButtonStandardWidget(
//           onTap: () {
//             setState(() {
//               authorizationCode = null;
//               logoutUser = true;
//             });
//           },
//           buttonText: 'Logout user',
//         ),
//         Container(
//           margin: EdgeInsets.symmetric(horizontal: 16),
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Auth code: ${authorizationCode?.code} '),
//               Text('State: ${authorizationCode?.state} '),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class AuthCodeObject {
//   AuthCodeObject({this.code, this.state});
//
//   String code, state;
// }
//
// class UserObject {
//   UserObject({this.firstName, this.lastName, this.email, this.profileImageUrl});
//
//   String firstName, lastName, email, profileImageUrl;
// }