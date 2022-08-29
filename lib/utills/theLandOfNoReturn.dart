// Copyright 2019 The Flutter Authors. All rights reserved.// Use of this source code is governed by a BSD-style license that can be// found in the LICENSE file.
// import 'package:flutter/material.dart';
// import 'package:animations/animations.dart';
// const String _loremIpsumParagraph ='Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod  tempor incididunt ut labore et dolore magna aliqua. Vulputate dignissim suspendisse in est. Ut ornare lectus sit amet. Eget nunc lobortis mattis aliquam faucibus purus in. Hendrerit gravida rutrum quisque non tellus orci ac auctor. Mattis aliquam faucibus purus in massa. Tellus rutrum at volutpat diam ut venenatis tellus in metus. Tellus cras adipiscing enim eu turpis. Pretium fusce id velit ut tortor. Adipiscing enim eu turpis egestas pretium. Quis varius quam quisque id. Blandit aliquam etiam erat velit scelerisque. In nisl nisi scelerisque eu. Semper risus in hendrerit gravida rutrum quisque. Suspendisse in est ante in nibh mauris cursus mattis molestie. Adipiscing elit duis tristique sollicitudin nibh sit amet commodo nulla. Pretium viverra suspendisse potenti nullam ac tortor vitae.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Vulputate dignissim suspendisse in est. Ut ornare lectus sit amet. Eget nunc lobortis mattis aliquam faucibus purus in. Hendrerit gravida rutrum quisque non tellus orci ac auctor. Mattis aliquam faucibus purus in massa. Tellus rutrum tellus pellentesque eu tincidunt tortor. Nunc eget lorem dolor sed. Nulla at volutpat diam ut venenatis tellus in metus. Tellus cras adipiscing enim eu turpis. Pretium fusce id velit ut tortor. Adipiscing enim eu turpis egestas pretium. Quis varius quam quisque id. Blandit aliquam etiam erat gravida rutrum quisque. Suspendisse in est ante in nibh mauris cursus mattis molestie. Adipiscing elit duis tristique sollicitudin nibh sit amet commodo nulla. Pretium viverra suspendisse potenti nullam ac tortor vitae';
// const double _fabDimension = 56;
//
// class OpenContainerTransformDemo extends StatefulWidget{
//     const OpenContainerTransformDemo({Key? key}) : super(key: key);
//
// @override
//   _OpenContainerTransformDemoState createState() =>
//   _OpenContainerTransformDemoState();
// }
//
// class _OpenContainerTransformDemoState extends State<OpenContainerTransformDemo> {
//
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   String defaultprofile = 'assets/jolugbo.jpeg';
//
//   ContainerTransitionType _transitionType = ContainerTransitionType.fade;
//
//   void _showSettingsBottomModalSheet(BuildContext context) {
//   //final localizations = GalleryLocalizations.of(context);
//      showModalBottomSheet<void>(
//          context: context,builder: (context) {
//            return StatefulBuilder(builder: (context, setModalState) {
//              return Container(
//                height: 125,
//                padding: const EdgeInsets.all(15),
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: [
//                    Text('Label Text',style: Theme.of(context).textTheme.caption,),
//                    const SizedBox(height: 12,),
//                    ToggleButtons(borderRadius: BorderRadius.circular(2),
//                      selectedBorderColor: Theme.of(context).colorScheme.primary,
//                      onPressed: (index) {
//                      setModalState(() {
//                        setState(() {
//                          _transitionType = index == 0? ContainerTransitionType.fade: ContainerTransitionType.fadeThrough;
//                        });
//                      });
//                      },
//                      isSelected: <bool>[_transitionType == ContainerTransitionType.fade,_transitionType == ContainerTransitionType.fadeThrough,],
//                      children: [
//                        Text('Test Text'),
//                        Padding(padding: const EdgeInsets.symmetric(horizontal: 10,),
//                          child: Text('Test Text'),
//                        ),
//                      ],
//                    ),
//                  ],
//                ),
//              );
//            });
//            }
//      );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//   //final localizations = GalleryLocalizations.of(context);
//   final colorScheme = Theme.of(context).colorScheme;
//   return Navigator(
//       // Adding [ValueKey] to make sure that the widget gets rebuilt when// changing type.
//       key: ValueKey(_transitionType),
//     onGenerateRoute: (settings) {
//         return MaterialPageRoute<void>(builder: (context) =>
//             Scaffold(
//               key: _scaffoldKey,
//               appBar: AppBar(
//                 automaticallyImplyLeading: false,
//                 title: Column(
//                   children: [
//                     Text('Header Text'),
//                     //Text('Body Text',style: Theme.of(context).textTheme.subtitle2.copyWith(color: Colors.white),),
//                   ],),
//                 actions: [
//                   IconButton(
//                     icon: const Icon(Icons.settings,),
//                     onPressed: () {
//                       _showSettingsBottomModalSheet(context);
//                       },),],
//               ),
//               body: ListView(
//                 padding: const EdgeInsets.all(8),
//                 children: [
//                   _OpenContainerWrapper(
//                     transitionType: _transitionType,
//                     closedBuilder: (context, openContainer) {
//                       return _DetailsCard(openContainer: openContainer);
//                       },
//                   ),
//
//                   const SizedBox(height: 16),
//
//                   _OpenContainerWrapper(
//                     transitionType: _transitionType,
//                     closedBuilder: (context, openContainer) {
//                       return _DetailsListTile(openContainer: openContainer);
//                       },
//                   ),
//                   const SizedBox(height: 16,),
//
//                   Row(
//                     children: [
//                     Expanded(
//                       child: _OpenContainerWrapper(
//                         transitionType: _transitionType,
//                         closedBuilder: (context, openContainer) {
//                           return _SmallDetailsCard(
//                             openContainer: openContainer,
//                             subtitle:'Test Text',
//                           );},
//                       ),
//                     ),
//                       const SizedBox(width: 8,),
//                       Expanded(
//                         child: _OpenContainerWrapper(
//                           transitionType: _transitionType,
//                           closedBuilder: (context, openContainer) {
//                             return _SmallDetailsCard(
//                               openContainer: openContainer,
//                               subtitle:'Test Text',
//                             );
//                             },
//                         ),
//                       ),
//                     ],),
//
//                   const SizedBox(height: 16,),
//
//                   Row(
//                     children: [
//                       Expanded(
//                         child: _OpenContainerWrapper(
//                           transitionType: _transitionType,
//                           closedBuilder: (context, openContainer) {
//                             return _SmallDetailsCard(
//                               openContainer: openContainer,
//                               subtitle: 'Test Text',
//                             );
//                             },
//                         ),
//                       ),
//                       const SizedBox(width: 8,),
//                       Expanded(
//                         child: _OpenContainerWrapper(
//                           transitionType: _transitionType,
//                           closedBuilder: (context, openContainer) {
//                             return _SmallDetailsCard(
//                               openContainer: openContainer,
//                               subtitle: 'Test Text',
//                             );
//                             },
//                         ),
//                       ),
//                       const SizedBox(width: 8,),
//                       Expanded(
//                         child: _OpenContainerWrapper(
//                           transitionType: _transitionType,
//                           closedBuilder: (context, openContainer) {
//                             return _SmallDetailsCard(
//                               openContainer: openContainer,
//                               subtitle: 'Test Text',
//                             );
//                             },
//                         ),
//                       ),
//                     ],
//                   ),
//
//                   const SizedBox(height: 16,),...List.generate(10, (index) {
//                     return OpenContainer<bool>(
//                       transitionType: _transitionType,
//                       openBuilder: (context, openContainer) =>const _DetailsPage(),
//                       tappable: false,
//                       closedShape: const RoundedRectangleBorder(),
//                       closedElevation: 0,
//                       closedBuilder: (context, openContainer) {
//                         return ListTile(
//                           leading: Image.asset(defaultprofile,width: 40,),
//                           onTap: openContainer,
//                           title: Text('Test Text'),
//                           subtitle: Text('Test Text'),
//                         );
//                         },
//                     );
//                   }),
//                 ],
//               ),
//               floatingActionButton: OpenContainer(
//                 transitionType: _transitionType,
//                 openBuilder: (context, openContainer) => const _DetailsPage(),
//                 closedElevation: 6,
//                 closedShape: const RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(_fabDimension / 2),),
//                 ),
//                 closedColor: colorScheme.secondary,
//                 closedBuilder: (context, openContainer) {
//                   return SizedBox(
//                     height: _fabDimension,
//                     width: _fabDimension,
//                     child: Center(child: Icon(Icons.add,color: colorScheme.onSecondary,),),
//                   );},
//               ),),
//         );
//         },
//   );
// }
//
// }
//
// class _OpenContainerWrapper extends StatelessWidget {
//
//   const _OpenContainerWrapper({this.closedBuilder,this.transitionType,});
//   final CloseContainerBuilder closedBuilder;
//   final ContainerTransitionType transitionType;
//
//   @override
//   Widget build(BuildContext context) {
//     return OpenContainer<bool>(transitionType: transitionType,openBuilder: (context, openContainer) =>
//     const _DetailsPage(),tappable: false,closedBuilder: closedBuilder,);
//   }
// }
//
// class _DetailsCard extends StatelessWidget {
//   const _DetailsCard({this.openContainer});
//   final VoidCallback openContainer;
//   @override
//   Widget build(BuildContext context) {
//     String defaultprofile = 'assets/jolugbo.jpeg';
//     //final localizations = GalleryLocalizations.of(context);
//   return _InkWellOverlay(
//     openContainer: openContainer,
//     height: 300,
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         Expanded(
//           child: Container(
//             color: Colors.black38,
//             child: Center(
//               child: Image.asset(defaultprofile,width: 100,),
//             ),),
//         ),
//         ListTile(
//           title: Text('Test Text'),
//           subtitle: Text('Test Text'),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(left: 16,right: 16,bottom: 16,),
//           child: Text('Lorem ipsum dolor sit amet, consectetur ''adipiscing elit, sed do eiusmod tempor.',style: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.black54,inherit: false,),),
//         ),
//       ],),
//   );
//   }}
//
// class _SmallDetailsCard extends StatelessWidget {
//   const _SmallDetailsCard({this.openContainer,this.subtitle,});
//   final VoidCallback openContainer;
//   final String subtitle;
//
//   @override
//   Widget build(BuildContext context) {
//     String defaultprofile = 'assets/jolugbo.jpeg';
//     final textTheme = Theme.of(context).textTheme;
//   return _InkWellOverlay(
//     openContainer: openContainer,
//     height: 225,
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           color: Colors.black38,
//           height: 150,
//           child: Center(
//             child: Image.asset(defaultprofile,width: 80,),
//           ),),
//         Expanded(
//           child: Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Test Text',style: textTheme.headline6,),
//                 const SizedBox(height: 4,),
//                 Text(subtitle,style: textTheme.caption,),
//               ],),),),
//       ],),
//   );
//   }}
//
// class _DetailsListTile extends StatelessWidget {
//
//   const _DetailsListTile({this.openContainer});
//   final VoidCallback openContainer;
//
//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;
//     String defaultprofile = 'assets/jolugbo.jpeg';
//     const height = 120.0;
//   return _InkWellOverlay(
//     openContainer: openContainer,
//     height: height,
//     child: Row(
//       children: [
//         Container(
//           color: Colors.black38,
//           height: height,
//           width: height,
//           child: Center(
//             child: Image.asset(defaultprofile,width: 60,),),
//         ),
//         Expanded(
//           child: Padding(
//             padding: const EdgeInsets.all(20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Test Text',style: textTheme.subtitle1,),
//                 const SizedBox(height: 8,),
//                 Text('Lorem ipsum dolor sit amet, consectetur ''adipiscing elit,',style: textTheme.caption,),
//               ],),),),
//       ],),
//   );
//   }}
//
// class _InkWellOverlay extends StatelessWidget {
//   const _InkWellOverlay({this.openContainer,this.width,this.height,this.child,});
//     final VoidCallback openContainer;
//     final double width;
//     final double height;
//     final Widget child;
//     @override
//     Widget build(BuildContext context) {
//       return SizedBox(
//         height: height,
//         width: width,
//         child: InkWell(
//           onTap: openContainer,
//           child: child,),);
//     }
// }
//
// class _DetailsPage extends StatelessWidget {
//
//   const _DetailsPage();
//     @override
//     Widget build(BuildContext context) {
//       String defaultprofile = 'assets/jolugbo.jpeg';
//       //final localizations = GalleryLocalizations.of(context);
//       final textTheme = Theme.of(context).textTheme;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Test Text'),
//       ),
//       body: ListView(
//         children: [
//           Container(
//             color: Colors.black38,
//             height: 250,
//             child: Padding(
//               padding: const EdgeInsets.all(70),
//               child: Image.asset(defaultprofile,),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Test Text',style: textTheme.headline5.copyWith(color: Colors.black54,fontSize: 30,),
//                 ),
//                 const SizedBox(height: 10,),
//                 Text(_loremIpsumParagraph,style: textTheme.bodyText2.copyWith(color: Colors.black54,height: 1.5,fontSize: 16,),),
//               ],
//             ),),
//         ],
//       ),);
//     }
// }
//

//return Navigator(
//// Adding [ValueKey] to make sure that the widget gets rebuilt when// changing type.
//key: ValueKey(_transitionType),
//onGenerateRoute: (settings) {
//return MaterialPageRoute<void>(builder: (context) =>
//Scaffold(
//key: _scaffoldKey,
//appBar: AppBar(
//automaticallyImplyLeading: false,backgroundColor: accent,
//title: Container(
//alignment: Alignment.center,
//child: Text('Explore New Discoveries',style: blue14Style,),
//),
//bottom:TabBar(
//indicator: CircleTabIndicator(color: projectBlue, radius: 5),controller: TabController(),
//tabs: <Widget>[
//Tab(
//child:
//Text('Case Study', style: dark16BoldStyle),
//),
//Tab(
//child: Text(
//'Opportunites',
//style: dark16BoldStyle,
//),
//),
//],
//),
//),
//body: TabBarView(
//children: <Widget>[
//ListView(
//padding: const EdgeInsets.all(8),
//children: [
//OpenContainerWrapper(
//transitionType: _transitionType,
//closedBuilder: (context, openContainer) {
//return _DetailsCard(openContainer: openContainer);
//},
//),
//const SizedBox(height: 16),
//const SizedBox(height: 16,),...List.generate(10, (index) {
//return OpenContainer<bool>(
//transitionType: _transitionType,
//openBuilder: (context, openContainer) =>const _DetailsCard(),
//tappable: false,
//closedShape: const RoundedRectangleBorder(),
//closedElevation: 0,
//closedBuilder: (context, openContainer) {
//return ListTile(
//leading: Image.asset(defaultprofile,width: 40,),
//onTap: openContainer,
//title: Text('Test Text'),
//subtitle: Text('Test Text'),
//);
//},
//);
//}),
//],
//),
//Stack()
//],
//)
//));
//},
//);




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