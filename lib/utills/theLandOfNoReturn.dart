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











































  
// class _DetailsCard extends StatelessWidget {
//   const _DetailsCard({this.openContainer, this.id});
//   final VoidCallback? openContainer;
//   final String? id;

//   @override
//   Widget build(BuildContext context) {
//     String bg = 'assets/graduatehat.png';
//     String assetManagement = 'assets/assetManagement.png';
//     var size = MediaQuery.of(context).size;

//     return InkWellOverlay(
//         openContainer: openContainer ?? () {},
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         child: Stack(
//           //overflow: Overflow.visible,
//           children: <Widget>[
//             //bg
//             AnimatedPositioned(
//               top: size.height * 0.04,
//               left: size.width * 0.02,
//               duration: Duration(seconds: 1),
//               child: Container(
//                 height: size.height * 0.95,
//                 width: 2,
//                 color: projectGray,
//               ),
//             ),

//             //bg
//             AnimatedPositioned(
//               top: size.height * 0.04,
//               right: size.width * 0.02,
//               duration: Duration(seconds: 1),
//               child: Container(
//                 height: size.height * 0.95,
//                 alignment: Alignment.centerRight,
//                 width: 2,
//                 color: projectGray,
//               ),
//             ),

//             CustomScrollView(
//               slivers: <Widget>[
//                 SliverList(
//                   delegate: SliverChildBuilderDelegate(
//                     (BuildContext context, int index) {
//                       return Container(
//                           alignment: Alignment.center,
//                           height: MediaQuery.of(context).size.height,
//                           child: Container(
//                             width: MediaQuery.of(context).size.width * 0.95,
//                             alignment: Alignment.center,
//                             height: MediaQuery.of(context).size.height,
//                             child: ListView(
//                               scrollDirection: Axis.vertical,
//                               padding: EdgeInsets.all(0),
//                               physics: const BouncingScrollPhysics(
//                                   parent: AlwaysScrollableScrollPhysics()),
//                               children: <Widget>[
//                                 SizedBox(
//                                   height:
//                                       MediaQuery.of(context).size.height * 0.02,
//                                 ),
//                                 Container(
//                                   alignment: Alignment.centerLeft,
//                                   width: MediaQuery.of(context).size.width,
//                                   child: IconButton(
//                                     icon: Icon(
//                                       Icons.arrow_back,
//                                       color: projectDark,
//                                     ),
//                                     onPressed: () {
//                                       Navigator.pop(context);
//                                     },
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height:
//                                       MediaQuery.of(context).size.height * 0.02,
//                                 ),
//                                 SizedBox(
//                                     width: MediaQuery.of(context).size.width,
//                                     height: MediaQuery.of(context).size.height *
//                                         0.18,
//                                     child: Stack(
//                                       children: [
//                                         Positioned(
//                                           child: Padding(
//                                             padding: EdgeInsets.symmetric(
//                                                 horizontal: 0),
//                                             child: Container(
//                                                 height: 3,
//                                                 width: MediaQuery.of(context)
//                                                     .size
//                                                     .width,
//                                                 color: projectOrange),
//                                           ),
//                                           top: MediaQuery.of(context)
//                                                   .size
//                                                   .height *
//                                               0.09,
//                                         ),
//                                         Container(
//                                           alignment: Alignment.center,
//                                           width:
//                                               MediaQuery.of(context).size.width,
//                                           height: MediaQuery.of(context)
//                                                   .size
//                                                   .height *
//                                               0.18,
//                                           child: Card(
//                                             elevation: 5,
//                                             color: accent,
//                                             shadowColor: projectOrange,
//                                             shape: cardShape,
//                                             child: Container(
//                                                 width: MediaQuery.of(context)
//                                                         .size
//                                                         .width *
//                                                     0.8,
//                                                 height: MediaQuery.of(context)
//                                                         .size
//                                                         .height *
//                                                     0.18,
//                                                 alignment: Alignment.topCenter,
//                                                 padding: EdgeInsets.fromLTRB(
//                                                     5,
//                                                     2,
//                                                     5,
//                                                     2), //color: Colors.red,
//                                                 child: FlatButton(
//                                                   child: Row(
//                                                     mainAxisSize:
//                                                         MainAxisSize.max,
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment
//                                                             .center,
//                                                     crossAxisAlignment:
//                                                         CrossAxisAlignment
//                                                             .center,
//                                                     children: <Widget>[
//                                                       Container(
//                                                           alignment:
//                                                               Alignment.center,
//                                                           width: MediaQuery.of(
//                                                                       context)
//                                                                   .size
//                                                                   .width *
//                                                               0.15,
//                                                           child:
//                                                               RawMaterialButton(
//                                                             elevation: 2.0,
//                                                             fillColor:
//                                                                 projectOrange,
//                                                             child: Image.asset(
//                                                               assetManagement,
//                                                               width: 30,
//                                                               height: 30,
//                                                             ),
//                                                             padding:
//                                                                 EdgeInsets.all(
//                                                                     10.0),
//                                                             shape: CircleBorder(
//                                                                 side: BorderSide(
//                                                                     color:
//                                                                         projectGray2)),
//                                                             onPressed: () {},
//                                                           )),
//                                                       Container(
//                                                           padding: EdgeInsets
//                                                               .fromLTRB(10, 0,
//                                                                   10, 0),
//                                                           alignment:
//                                                               Alignment.topLeft,
//                                                           width: MediaQuery.of(
//                                                                       context)
//                                                                   .size
//                                                                   .width *
//                                                               0.6,
//                                                           height: MediaQuery.of(
//                                                                       context)
//                                                                   .size
//                                                                   .height *
//                                                               0.35,
//                                                           child: Column(
//                                                             mainAxisAlignment:
//                                                                 MainAxisAlignment
//                                                                     .spaceAround,
//                                                             mainAxisSize:
//                                                                 MainAxisSize
//                                                                     .max,
//                                                             children: [
//                                                               Container(
//                                                                   padding: EdgeInsets
//                                                                       .fromLTRB(
//                                                                           10,
//                                                                           5,
//                                                                           0,
//                                                                           0),
//                                                                   alignment:
//                                                                       Alignment
//                                                                           .topLeft,
//                                                                   //height: MediaQuery.of(context).size.height * 0.04,
//                                                                   child: Row(
//                                                                     mainAxisAlignment:
//                                                                         MainAxisAlignment
//                                                                             .spaceBetween,
//                                                                     children: [
//                                                                       Text(
//                                                                         'Introduction',
//                                                                         style:
//                                                                             dark16BoldStyle,
//                                                                       ),
//                                                                       Icon(
//                                                                         Icons
//                                                                             .lock_open_rounded,
//                                                                         color:
//                                                                             projectGreen,
//                                                                       )
//                                                                     ],
//                                                                   )),
//                                                               Container(
//                                                                 padding:
//                                                                     EdgeInsets
//                                                                         .fromLTRB(
//                                                                             10,
//                                                                             5,
//                                                                             10,
//                                                                             5),
//                                                                 alignment:
//                                                                     Alignment
//                                                                         .topLeft,
//                                                                 child: Text(
//                                                                   'Understanding the general Overview of Asset Management',
//                                                                   style:
//                                                                       dark14Style,
//                                                                 ),
//                                                               ),
//                                                               Container(
//                                                                   padding: EdgeInsets
//                                                                       .fromLTRB(
//                                                                           10,
//                                                                           5,
//                                                                           10,
//                                                                           5),
//                                                                   alignment:
//                                                                       Alignment
//                                                                           .topLeft,
//                                                                   height: MediaQuery.of(
//                                                                               context)
//                                                                           .size
//                                                                           .height *
//                                                                       0.04,
//                                                                   child: Row(
//                                                                     children: [
//                                                                       Text(
//                                                                         '4/10',
//                                                                         style:
//                                                                             orange14Style,
//                                                                       ),
//                                                                       LinearPercentIndicator(
//                                                                         width: MediaQuery.of(context).size.width *
//                                                                             0.4,
//                                                                         lineHeight:
//                                                                             10.0,
//                                                                         percent:
//                                                                             0.4,
//                                                                         backgroundColor:
//                                                                             Colors.grey,
//                                                                         progressColor:
//                                                                             projectOrange,
//                                                                       ),
//                                                                     ],
//                                                                   )),
//                                                             ],
//                                                           )),
//                                                     ],
//                                                   ),
//                                                   padding: EdgeInsets.zero,
//                                                   onPressed: () {
//                                                     Navigator.pop(context);
//                                                     Navigator.pushNamed(context,
//                                                         '/deepest_learning');
//                                                   },
//                                                 )),
//                                           ),
//                                         ),
//                                       ],
//                                     )),
//                                 SizedBox(
//                                   height:
//                                       MediaQuery.of(context).size.height * 0.02,
//                                 ),
//                                 SizedBox(
//                                     width: MediaQuery.of(context).size.width,
//                                     height: MediaQuery.of(context).size.height *
//                                         0.18,
//                                     child: Stack(
//                                       children: [
//                                         Positioned(
//                                           child: Padding(
//                                             padding: EdgeInsets.symmetric(
//                                                 horizontal: 0),
//                                             child: Container(
//                                                 height: 3,
//                                                 width: MediaQuery.of(context)
//                                                     .size
//                                                     .width,
//                                                 color: projectGray),
//                                           ),
//                                           top: MediaQuery.of(context)
//                                                   .size
//                                                   .height *
//                                               0.09,
//                                         ),
//                                         Container(
//                                           alignment: Alignment.center,
//                                           width:
//                                               MediaQuery.of(context).size.width,
//                                           height: MediaQuery.of(context)
//                                                   .size
//                                                   .height *
//                                               0.18,
//                                           child: Card(
//                                             elevation: 5,
//                                             color: accent,
//                                             shadowColor: projectGray,
//                                             shape: cardShape,
//                                             // margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.05,0,MediaQuery.of(context).size.width * 0.05,0),
//                                             child: Container(
//                                                 width: MediaQuery.of(context)
//                                                         .size
//                                                         .width *
//                                                     0.8,
//                                                 height: MediaQuery.of(context)
//                                                         .size
//                                                         .height *
//                                                     0.18,
//                                                 alignment: Alignment.topCenter,
//                                                 padding: EdgeInsets.fromLTRB(
//                                                     5,
//                                                     2,
//                                                     5,
//                                                     2), //color: Colors.red,
//                                                 child: FlatButton(
//                                                   child: Row(
//                                                     mainAxisSize:
//                                                         MainAxisSize.max,
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment
//                                                             .center,
//                                                     crossAxisAlignment:
//                                                         CrossAxisAlignment
//                                                             .center,
//                                                     children: <Widget>[
//                                                       Container(
//                                                           alignment:
//                                                               Alignment.center,
//                                                           width: MediaQuery.of(
//                                                                       context)
//                                                                   .size
//                                                                   .width *
//                                                               0.15,
//                                                           child:
//                                                               RawMaterialButton(
//                                                             elevation: 2.0,
//                                                             fillColor:
//                                                                 projectGray2,
//                                                             child: Image.asset(
//                                                               assetManagement,
//                                                               width: 30,
//                                                               height: 30,
//                                                             ),
//                                                             padding:
//                                                                 EdgeInsets.all(
//                                                                     10.0),
//                                                             shape: CircleBorder(
//                                                                 side: BorderSide(
//                                                                     color:
//                                                                         projectGray2)),
//                                                             onPressed: () {},
//                                                           )),
//                                                       Container(
//                                                           padding: EdgeInsets
//                                                               .fromLTRB(10, 0,
//                                                                   10, 0),
//                                                           alignment:
//                                                               Alignment.topLeft,
//                                                           width: MediaQuery.of(
//                                                                       context)
//                                                                   .size
//                                                                   .width *
//                                                               0.6,
//                                                           height: MediaQuery.of(
//                                                                       context)
//                                                                   .size
//                                                                   .height *
//                                                               0.35,
//                                                           child: Column(
//                                                             mainAxisAlignment:
//                                                                 MainAxisAlignment
//                                                                     .spaceAround,
//                                                             mainAxisSize:
//                                                                 MainAxisSize
//                                                                     .max,
//                                                             children: [
//                                                               Container(
//                                                                   padding: EdgeInsets
//                                                                       .fromLTRB(
//                                                                           10,
//                                                                           5,
//                                                                           0,
//                                                                           0),
//                                                                   alignment:
//                                                                       Alignment
//                                                                           .topLeft,
//                                                                   //height: MediaQuery.of(context).size.height * 0.04,
//                                                                   child: Row(
//                                                                     mainAxisAlignment:
//                                                                         MainAxisAlignment
//                                                                             .spaceBetween,
//                                                                     children: [
//                                                                       Text(
//                                                                         'Introduction',
//                                                                         style:
//                                                                             dark16BoldStyle,
//                                                                       ),
//                                                                       Icon(
//                                                                         Icons
//                                                                             .lock_open_rounded,
//                                                                         color:
//                                                                             projectGray,
//                                                                       )
//                                                                     ],
//                                                                   )),
//                                                               Container(
//                                                                 padding:
//                                                                     EdgeInsets
//                                                                         .fromLTRB(
//                                                                             10,
//                                                                             5,
//                                                                             10,
//                                                                             5),
//                                                                 alignment:
//                                                                     Alignment
//                                                                         .topLeft,
//                                                                 child: Text(
//                                                                   'Understanding the general Overview of Asset Management',
//                                                                   style:
//                                                                       dark14Style,
//                                                                 ),
//                                                               ),
//                                                               Container(
//                                                                   padding: EdgeInsets
//                                                                       .fromLTRB(
//                                                                           10,
//                                                                           5,
//                                                                           10,
//                                                                           5),
//                                                                   alignment:
//                                                                       Alignment
//                                                                           .topLeft,
//                                                                   height: MediaQuery.of(
//                                                                               context)
//                                                                           .size
//                                                                           .height *
//                                                                       0.04,
//                                                                   child: Row(
//                                                                     children: [
//                                                                       Text(
//                                                                         '0/10',
//                                                                         style:
//                                                                             orange14Style,
//                                                                       ),
//                                                                       LinearPercentIndicator(
//                                                                         width: MediaQuery.of(context).size.width *
//                                                                             0.4,
//                                                                         lineHeight:
//                                                                             10.0,
//                                                                         percent:
//                                                                             0,
//                                                                         backgroundColor:
//                                                                             Colors.grey,
//                                                                         progressColor:
//                                                                             projectOrange,
//                                                                       ),
//                                                                     ],
//                                                                   )),
//                                                             ],
//                                                           )),
//                                                     ],
//                                                   ),
//                                                   padding: EdgeInsets.zero,
//                                                   onPressed: () {
//                                                     Navigator.pushNamed(context,
//                                                         '/deepest_learning');
//                                                   },
//                                                 )),
//                                           ),
//                                         ),
//                                       ],
//                                     )),
//                                 SizedBox(
//                                   height:
//                                       MediaQuery.of(context).size.height * 0.02,
//                                 ),
//                                 SizedBox(
//                                     width: MediaQuery.of(context).size.width,
//                                     height: MediaQuery.of(context).size.height *
//                                         0.18,
//                                     child: Stack(
//                                       children: [
//                                         Positioned(
//                                           child: Padding(
//                                             padding: EdgeInsets.symmetric(
//                                                 horizontal: 0),
//                                             child: Container(
//                                                 height: 3,
//                                                 width: MediaQuery.of(context)
//                                                     .size
//                                                     .width,
//                                                 color: projectGray),
//                                           ),
//                                           top: MediaQuery.of(context)
//                                                   .size
//                                                   .height *
//                                               0.09,
//                                         ),
//                                         Container(
//                                           alignment: Alignment.center,
//                                           width:
//                                               MediaQuery.of(context).size.width,
//                                           height: MediaQuery.of(context)
//                                                   .size
//                                                   .height *
//                                               0.18,
//                                           child: Card(
//                                             elevation: 5,
//                                             color: accent,
//                                             shadowColor: projectGray,
//                                             shape: cardShape,
//                                             // margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.05,0,MediaQuery.of(context).size.width * 0.05,0),
//                                             child: Container(
//                                                 width: MediaQuery.of(context)
//                                                         .size
//                                                         .width *
//                                                     0.8,
//                                                 height: MediaQuery.of(context)
//                                                         .size
//                                                         .height *
//                                                     0.18,
//                                                 alignment: Alignment.topCenter,
//                                                 padding: EdgeInsets.fromLTRB(
//                                                     5,
//                                                     2,
//                                                     5,
//                                                     2), //color: Colors.red,
//                                                 child: FlatButton(
//                                                   child: Row(
//                                                     mainAxisSize:
//                                                         MainAxisSize.max,
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment
//                                                             .center,
//                                                     crossAxisAlignment:
//                                                         CrossAxisAlignment
//                                                             .center,
//                                                     children: <Widget>[
//                                                       Container(
//                                                           alignment:
//                                                               Alignment.center,
//                                                           width: MediaQuery.of(
//                                                                       context)
//                                                                   .size
//                                                                   .width *
//                                                               0.15,
//                                                           child:
//                                                               RawMaterialButton(
//                                                             elevation: 2.0,
//                                                             fillColor:
//                                                                 projectGray2,
//                                                             child: Image.asset(
//                                                               assetManagement,
//                                                               width: 30,
//                                                               height: 30,
//                                                             ),
//                                                             padding:
//                                                                 EdgeInsets.all(
//                                                                     10.0),
//                                                             shape: CircleBorder(
//                                                                 side: BorderSide(
//                                                                     color:
//                                                                         projectGray2)),
//                                                             onPressed: () {},
//                                                           )),
//                                                       Container(
//                                                           padding: EdgeInsets
//                                                               .fromLTRB(10, 0,
//                                                                   10, 0),
//                                                           alignment:
//                                                               Alignment.topLeft,
//                                                           width: MediaQuery.of(
//                                                                       context)
//                                                                   .size
//                                                                   .width *
//                                                               0.6,
//                                                           height: MediaQuery.of(
//                                                                       context)
//                                                                   .size
//                                                                   .height *
//                                                               0.35,
//                                                           child: Column(
//                                                             mainAxisAlignment:
//                                                                 MainAxisAlignment
//                                                                     .spaceAround,
//                                                             mainAxisSize:
//                                                                 MainAxisSize
//                                                                     .max,
//                                                             children: [
//                                                               Container(
//                                                                   padding: EdgeInsets
//                                                                       .fromLTRB(
//                                                                           10,
//                                                                           5,
//                                                                           0,
//                                                                           0),
//                                                                   alignment:
//                                                                       Alignment
//                                                                           .topLeft,
//                                                                   //height: MediaQuery.of(context).size.height * 0.04,
//                                                                   child: Row(
//                                                                     mainAxisAlignment:
//                                                                         MainAxisAlignment
//                                                                             .spaceBetween,
//                                                                     children: [
//                                                                       Text(
//                                                                         'Introduction',
//                                                                         style:
//                                                                             dark16BoldStyle,
//                                                                       ),
//                                                                       Icon(
//                                                                         Icons
//                                                                             .lock_open_rounded,
//                                                                         color:
//                                                                             projectGray,
//                                                                       )
//                                                                     ],
//                                                                   )),
//                                                               Container(
//                                                                 padding:
//                                                                     EdgeInsets
//                                                                         .fromLTRB(
//                                                                             10,
//                                                                             5,
//                                                                             10,
//                                                                             5),
//                                                                 alignment:
//                                                                     Alignment
//                                                                         .topLeft,
//                                                                 child: Text(
//                                                                   'Understanding the general Overview of Asset Management',
//                                                                   style:
//                                                                       dark14Style,
//                                                                 ),
//                                                               ),
//                                                               Container(
//                                                                   padding: EdgeInsets
//                                                                       .fromLTRB(
//                                                                           10,
//                                                                           5,
//                                                                           10,
//                                                                           5),
//                                                                   alignment:
//                                                                       Alignment
//                                                                           .topLeft,
//                                                                   height: MediaQuery.of(
//                                                                               context)
//                                                                           .size
//                                                                           .height *
//                                                                       0.04,
//                                                                   child: Row(
//                                                                     children: [
//                                                                       Text(
//                                                                         '0/10',
//                                                                         style:
//                                                                             orange14Style,
//                                                                       ),
//                                                                       LinearPercentIndicator(
//                                                                         width: MediaQuery.of(context).size.width *
//                                                                             0.4,
//                                                                         lineHeight:
//                                                                             10.0,
//                                                                         percent:
//                                                                             0,
//                                                                         backgroundColor:
//                                                                             Colors.grey,
//                                                                         progressColor:
//                                                                             projectOrange,
//                                                                       ),
//                                                                     ],
//                                                                   )),
//                                                             ],
//                                                           )),
//                                                     ],
//                                                   ),
//                                                   padding: EdgeInsets.zero,
//                                                   onPressed: () {
//                                                     Navigator.pushNamed(context,
//                                                         '/deepest_learning');
//                                                     Navigator.pushNamed(context,
//                                                         '/deepest_learning');
//                                                   },
//                                                 )),
//                                           ),
//                                         ),
//                                       ],
//                                     )),
//                                 SizedBox(
//                                   height:
//                                       MediaQuery.of(context).size.height * 0.02,
//                                 ),
//                                 SizedBox(
//                                     width: MediaQuery.of(context).size.width,
//                                     height: MediaQuery.of(context).size.height *
//                                         0.18,
//                                     child: Stack(
//                                       children: [
//                                         Positioned(
//                                           child: Padding(
//                                             padding: EdgeInsets.symmetric(
//                                                 horizontal: 0),
//                                             child: Container(
//                                                 height: 3,
//                                                 width: MediaQuery.of(context)
//                                                     .size
//                                                     .width,
//                                                 color: projectGray),
//                                           ),
//                                           top: MediaQuery.of(context)
//                                                   .size
//                                                   .height *
//                                               0.09,
//                                         ),
//                                         Container(
//                                           alignment: Alignment.center,
//                                           width:
//                                               MediaQuery.of(context).size.width,
//                                           height: MediaQuery.of(context)
//                                                   .size
//                                                   .height *
//                                               0.18,
//                                           child: Card(
//                                             elevation: 5,
//                                             color: accent,
//                                             shadowColor: projectGray,
//                                             shape: cardShape,
//                                             // margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.05,0,MediaQuery.of(context).size.width * 0.05,0),
//                                             child: Container(
//                                                 width: MediaQuery.of(context)
//                                                         .size
//                                                         .width *
//                                                     0.8,
//                                                 height: MediaQuery.of(context)
//                                                         .size
//                                                         .height *
//                                                     0.18,
//                                                 alignment: Alignment.topCenter,
//                                                 padding: EdgeInsets.fromLTRB(
//                                                     5,
//                                                     2,
//                                                     5,
//                                                     2), //color: Colors.red,
//                                                 child: FlatButton(
//                                                   child: Row(
//                                                     mainAxisSize:
//                                                         MainAxisSize.max,
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment
//                                                             .center,
//                                                     crossAxisAlignment:
//                                                         CrossAxisAlignment
//                                                             .center,
//                                                     children: <Widget>[
//                                                       Container(
//                                                           alignment:
//                                                               Alignment.center,
//                                                           width: MediaQuery.of(
//                                                                       context)
//                                                                   .size
//                                                                   .width *
//                                                               0.15,
//                                                           child:
//                                                               RawMaterialButton(
//                                                             elevation: 2.0,
//                                                             fillColor:
//                                                                 projectGray2,
//                                                             child: Image.asset(
//                                                               assetManagement,
//                                                               width: 30,
//                                                               height: 30,
//                                                             ),
//                                                             padding:
//                                                                 EdgeInsets.all(
//                                                                     10.0),
//                                                             shape: CircleBorder(
//                                                                 side: BorderSide(
//                                                                     color:
//                                                                         projectGray2)),
//                                                             onPressed: () {},
//                                                           )),
//                                                       Container(
//                                                           padding: EdgeInsets
//                                                               .fromLTRB(10, 0,
//                                                                   10, 0),
//                                                           alignment:
//                                                               Alignment.topLeft,
//                                                           width: MediaQuery.of(
//                                                                       context)
//                                                                   .size
//                                                                   .width *
//                                                               0.6,
//                                                           height: MediaQuery.of(
//                                                                       context)
//                                                                   .size
//                                                                   .height *
//                                                               0.35,
//                                                           child: Column(
//                                                             mainAxisAlignment:
//                                                                 MainAxisAlignment
//                                                                     .spaceAround,
//                                                             mainAxisSize:
//                                                                 MainAxisSize
//                                                                     .max,
//                                                             children: [
//                                                               Container(
//                                                                   padding: EdgeInsets
//                                                                       .fromLTRB(
//                                                                           10,
//                                                                           5,
//                                                                           0,
//                                                                           0),
//                                                                   alignment:
//                                                                       Alignment
//                                                                           .topLeft,
//                                                                   //height: MediaQuery.of(context).size.height * 0.04,
//                                                                   child: Row(
//                                                                     mainAxisAlignment:
//                                                                         MainAxisAlignment
//                                                                             .spaceBetween,
//                                                                     children: [
//                                                                       Text(
//                                                                         'Introduction',
//                                                                         style:
//                                                                             dark16BoldStyle,
//                                                                       ),
//                                                                       Icon(
//                                                                         Icons
//                                                                             .lock_open_rounded,
//                                                                         color:
//                                                                             projectGray,
//                                                                       )
//                                                                     ],
//                                                                   )),
//                                                               Container(
//                                                                 padding:
//                                                                     EdgeInsets
//                                                                         .fromLTRB(
//                                                                             10,
//                                                                             5,
//                                                                             10,
//                                                                             5),
//                                                                 alignment:
//                                                                     Alignment
//                                                                         .topLeft,
//                                                                 child: Text(
//                                                                   'Understanding the general Overview of Asset Management',
//                                                                   style:
//                                                                       dark14Style,
//                                                                 ),
//                                                               ),
//                                                               Container(
//                                                                   padding: EdgeInsets
//                                                                       .fromLTRB(
//                                                                           10,
//                                                                           5,
//                                                                           10,
//                                                                           5),
//                                                                   alignment:
//                                                                       Alignment
//                                                                           .topLeft,
//                                                                   height: MediaQuery.of(
//                                                                               context)
//                                                                           .size
//                                                                           .height *
//                                                                       0.04,
//                                                                   child: Row(
//                                                                     children: [
//                                                                       Text(
//                                                                         '0/10',
//                                                                         style:
//                                                                             orange14Style,
//                                                                       ),
//                                                                       LinearPercentIndicator(
//                                                                         width: MediaQuery.of(context).size.width *
//                                                                             0.4,
//                                                                         lineHeight:
//                                                                             10.0,
//                                                                         percent:
//                                                                             0,
//                                                                         backgroundColor:
//                                                                             Colors.grey,
//                                                                         progressColor:
//                                                                             projectOrange,
//                                                                       ),
//                                                                     ],
//                                                                   )),
//                                                             ],
//                                                           )),
//                                                     ],
//                                                   ),
//                                                   padding: EdgeInsets.zero,
//                                                   onPressed: () {
//                                                     Navigator.pushNamed(context,
//                                                         '/deepest_learning');
//                                                     Navigator.pushNamed(context,
//                                                         '/deepest_learning');
//                                                   },
//                                                 )),
//                                           ),
//                                         ),
//                                       ],
//                                     )),
//                                 SizedBox(
//                                   height:
//                                       MediaQuery.of(context).size.height * 0.02,
//                                 ),
//                                 SizedBox(
//                                     width: MediaQuery.of(context).size.width,
//                                     height: MediaQuery.of(context).size.height *
//                                         0.18,
//                                     child: Stack(
//                                       children: [
//                                         Positioned(
//                                           child: Padding(
//                                             padding: EdgeInsets.symmetric(
//                                                 horizontal: 0),
//                                             child: Container(
//                                                 height: 3,
//                                                 width: MediaQuery.of(context)
//                                                     .size
//                                                     .width,
//                                                 color: projectGray),
//                                           ),
//                                           top: MediaQuery.of(context)
//                                                   .size
//                                                   .height *
//                                               0.09,
//                                         ),
//                                         Container(
//                                           alignment: Alignment.center,
//                                           width:
//                                               MediaQuery.of(context).size.width,
//                                           height: MediaQuery.of(context)
//                                                   .size
//                                                   .height *
//                                               0.18,
//                                           child: Card(
//                                             elevation: 5,
//                                             color: accent,
//                                             shadowColor: projectGray,
//                                             shape: cardShape,
//                                             // margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.05,0,MediaQuery.of(context).size.width * 0.05,0),
//                                             child: Container(
//                                                 width: MediaQuery.of(context)
//                                                         .size
//                                                         .width *
//                                                     0.8,
//                                                 height: MediaQuery.of(context)
//                                                         .size
//                                                         .height *
//                                                     0.18,
//                                                 alignment: Alignment.topCenter,
//                                                 padding: EdgeInsets.fromLTRB(
//                                                     5,
//                                                     2,
//                                                     5,
//                                                     2), //color: Colors.red,
//                                                 child: FlatButton(
//                                                   child: Row(
//                                                     mainAxisSize:
//                                                         MainAxisSize.max,
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment
//                                                             .center,
//                                                     crossAxisAlignment:
//                                                         CrossAxisAlignment
//                                                             .center,
//                                                     children: <Widget>[
//                                                       Container(
//                                                           alignment:
//                                                               Alignment.center,
//                                                           width: MediaQuery.of(
//                                                                       context)
//                                                                   .size
//                                                                   .width *
//                                                               0.15,
//                                                           child:
//                                                               RawMaterialButton(
//                                                             elevation: 2.0,
//                                                             fillColor:
//                                                                 projectGray2,
//                                                             child: Image.asset(
//                                                               assetManagement,
//                                                               width: 30,
//                                                               height: 30,
//                                                             ),
//                                                             padding:
//                                                                 EdgeInsets.all(
//                                                                     10.0),
//                                                             shape: CircleBorder(
//                                                                 side: BorderSide(
//                                                                     color:
//                                                                         projectGray2)),
//                                                             onPressed: () {},
//                                                           )),
//                                                       Container(
//                                                           padding: EdgeInsets
//                                                               .fromLTRB(10, 0,
//                                                                   10, 0),
//                                                           alignment:
//                                                               Alignment.topLeft,
//                                                           width: MediaQuery.of(
//                                                                       context)
//                                                                   .size
//                                                                   .width *
//                                                               0.6,
//                                                           height: MediaQuery.of(
//                                                                       context)
//                                                                   .size
//                                                                   .height *
//                                                               0.35,
//                                                           child: Column(
//                                                             mainAxisAlignment:
//                                                                 MainAxisAlignment
//                                                                     .spaceAround,
//                                                             mainAxisSize:
//                                                                 MainAxisSize
//                                                                     .max,
//                                                             children: [
//                                                               Container(
//                                                                   padding: EdgeInsets
//                                                                       .fromLTRB(
//                                                                           10,
//                                                                           5,
//                                                                           0,
//                                                                           0),
//                                                                   alignment:
//                                                                       Alignment
//                                                                           .topLeft,
//                                                                   //height: MediaQuery.of(context).size.height * 0.04,
//                                                                   child: Row(
//                                                                     mainAxisAlignment:
//                                                                         MainAxisAlignment
//                                                                             .spaceBetween,
//                                                                     children: [
//                                                                       Text(
//                                                                         'Introduction',
//                                                                         style:
//                                                                             dark16BoldStyle,
//                                                                       ),
//                                                                       Icon(
//                                                                         Icons
//                                                                             .lock_open_rounded,
//                                                                         color:
//                                                                             projectGray,
//                                                                       )
//                                                                     ],
//                                                                   )),
//                                                               Container(
//                                                                 padding:
//                                                                     EdgeInsets
//                                                                         .fromLTRB(
//                                                                             10,
//                                                                             5,
//                                                                             10,
//                                                                             5),
//                                                                 alignment:
//                                                                     Alignment
//                                                                         .topLeft,
//                                                                 child: Text(
//                                                                   'Understanding the general Overview of Asset Management',
//                                                                   style:
//                                                                       dark14Style,
//                                                                 ),
//                                                               ),
//                                                               Container(
//                                                                   padding: EdgeInsets
//                                                                       .fromLTRB(
//                                                                           10,
//                                                                           5,
//                                                                           10,
//                                                                           5),
//                                                                   alignment:
//                                                                       Alignment
//                                                                           .topLeft,
//                                                                   height: MediaQuery.of(
//                                                                               context)
//                                                                           .size
//                                                                           .height *
//                                                                       0.04,
//                                                                   child: Row(
//                                                                     children: [
//                                                                       Text(
//                                                                         '0/10',
//                                                                         style:
//                                                                             orange14Style,
//                                                                       ),
//                                                                       LinearPercentIndicator(
//                                                                         width: MediaQuery.of(context).size.width *
//                                                                             0.4,
//                                                                         lineHeight:
//                                                                             10.0,
//                                                                         percent:
//                                                                             0,
//                                                                         backgroundColor:
//                                                                             Colors.grey,
//                                                                         progressColor:
//                                                                             projectOrange,
//                                                                       ),
//                                                                     ],
//                                                                   )),
//                                                             ],
//                                                           )),
//                                                     ],
//                                                   ),
//                                                   padding: EdgeInsets.zero,
//                                                   onPressed: () {
//                                                     Navigator.pushNamed(context,
//                                                         '/deepest_learning');
//                                                     Navigator.pushNamed(context,
//                                                         '/deepest_learning');
//                                                   },
//                                                 )),
//                                           ),
//                                         ),
//                                       ],
//                                     )),
//                                 SizedBox(
//                                   height:
//                                       MediaQuery.of(context).size.height * 0.02,
//                                 ),
//                                 SizedBox(
//                                     width: MediaQuery.of(context).size.width,
//                                     height: MediaQuery.of(context).size.height *
//                                         0.18,
//                                     child: Stack(
//                                       children: [
//                                         Positioned(
//                                           child: Padding(
//                                             padding: EdgeInsets.symmetric(
//                                                 horizontal: 0),
//                                             child: Container(
//                                                 height: 3,
//                                                 width: MediaQuery.of(context)
//                                                     .size
//                                                     .width,
//                                                 color: projectGray),
//                                           ),
//                                           top: MediaQuery.of(context)
//                                                   .size
//                                                   .height *
//                                               0.09,
//                                         ),
//                                         Container(
//                                           alignment: Alignment.center,
//                                           width:
//                                               MediaQuery.of(context).size.width,
//                                           height: MediaQuery.of(context)
//                                                   .size
//                                                   .height *
//                                               0.18,
//                                           child: Card(
//                                             elevation: 5,
//                                             color: accent,
//                                             shadowColor: projectGray,
//                                             shape: cardShape,
//                                             // margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.05,0,MediaQuery.of(context).size.width * 0.05,0),
//                                             child: Container(
//                                                 width: MediaQuery.of(context)
//                                                         .size
//                                                         .width *
//                                                     0.8,
//                                                 height: MediaQuery.of(context)
//                                                         .size
//                                                         .height *
//                                                     0.18,
//                                                 alignment: Alignment.topCenter,
//                                                 padding: EdgeInsets.fromLTRB(
//                                                     5,
//                                                     2,
//                                                     5,
//                                                     2), //color: Colors.red,
//                                                 child: FlatButton(
//                                                   child: Row(
//                                                     mainAxisSize:
//                                                         MainAxisSize.max,
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment
//                                                             .center,
//                                                     crossAxisAlignment:
//                                                         CrossAxisAlignment
//                                                             .center,
//                                                     children: <Widget>[
//                                                       Container(
//                                                           alignment:
//                                                               Alignment.center,
//                                                           width: MediaQuery.of(
//                                                                       context)
//                                                                   .size
//                                                                   .width *
//                                                               0.15,
//                                                           child:
//                                                               RawMaterialButton(
//                                                             elevation: 2.0,
//                                                             fillColor:
//                                                                 projectGray2,
//                                                             child: Image.asset(
//                                                               assetManagement,
//                                                               width: 30,
//                                                               height: 30,
//                                                             ),
//                                                             padding:
//                                                                 EdgeInsets.all(
//                                                                     10.0),
//                                                             shape: CircleBorder(
//                                                                 side: BorderSide(
//                                                                     color:
//                                                                         projectGray2)),
//                                                             onPressed: () {},
//                                                           )),
//                                                       Container(
//                                                           padding: EdgeInsets
//                                                               .fromLTRB(10, 0,
//                                                                   10, 0),
//                                                           alignment:
//                                                               Alignment.topLeft,
//                                                           width: MediaQuery.of(
//                                                                       context)
//                                                                   .size
//                                                                   .width *
//                                                               0.6,
//                                                           height: MediaQuery.of(
//                                                                       context)
//                                                                   .size
//                                                                   .height *
//                                                               0.35,
//                                                           child: Column(
//                                                             mainAxisAlignment:
//                                                                 MainAxisAlignment
//                                                                     .spaceAround,
//                                                             mainAxisSize:
//                                                                 MainAxisSize
//                                                                     .max,
//                                                             children: [
//                                                               Container(
//                                                                   padding: EdgeInsets
//                                                                       .fromLTRB(
//                                                                           10,
//                                                                           5,
//                                                                           0,
//                                                                           0),
//                                                                   alignment:
//                                                                       Alignment
//                                                                           .topLeft,
//                                                                   //height: MediaQuery.of(context).size.height * 0.04,
//                                                                   child: Row(
//                                                                     mainAxisAlignment:
//                                                                         MainAxisAlignment
//                                                                             .spaceBetween,
//                                                                     children: [
//                                                                       Text(
//                                                                         'Introduction',
//                                                                         style:
//                                                                             dark16BoldStyle,
//                                                                       ),
//                                                                       Icon(
//                                                                         Icons
//                                                                             .lock_open_rounded,
//                                                                         color:
//                                                                             projectGray,
//                                                                       )
//                                                                     ],
//                                                                   )),
//                                                               Container(
//                                                                 padding:
//                                                                     EdgeInsets
//                                                                         .fromLTRB(
//                                                                             10,
//                                                                             5,
//                                                                             10,
//                                                                             5),
//                                                                 alignment:
//                                                                     Alignment
//                                                                         .topLeft,
//                                                                 child: Text(
//                                                                   'Understanding the general Overview of Asset Management',
//                                                                   style:
//                                                                       dark14Style,
//                                                                 ),
//                                                               ),
//                                                               Container(
//                                                                   padding: EdgeInsets
//                                                                       .fromLTRB(
//                                                                           10,
//                                                                           5,
//                                                                           10,
//                                                                           5),
//                                                                   alignment:
//                                                                       Alignment
//                                                                           .topLeft,
//                                                                   height: MediaQuery.of(
//                                                                               context)
//                                                                           .size
//                                                                           .height *
//                                                                       0.04,
//                                                                   child: Row(
//                                                                     children: [
//                                                                       Text(
//                                                                         '0/10',
//                                                                         style:
//                                                                             orange14Style,
//                                                                       ),
//                                                                       LinearPercentIndicator(
//                                                                         width: MediaQuery.of(context).size.width *
//                                                                             0.4,
//                                                                         lineHeight:
//                                                                             10.0,
//                                                                         percent:
//                                                                             0,
//                                                                         backgroundColor:
//                                                                             Colors.grey,
//                                                                         progressColor:
//                                                                             projectOrange,
//                                                                       ),
//                                                                     ],
//                                                                   )),
//                                                             ],
//                                                           )),
//                                                     ],
//                                                   ),
//                                                   padding: EdgeInsets.zero,
//                                                   onPressed: () {
//                                                     Navigator.pushNamed(context,
//                                                         '/deepest_learning');
//                                                     Navigator.pushNamed(context,
//                                                         '/deepest_learning');
//                                                   },
//                                                 )),
//                                           ),
//                                         ),
//                                       ],
//                                     )),
//                                 SizedBox(
//                                   height:
//                                       MediaQuery.of(context).size.height * 0.18,
//                                 )
//                               ],
//                             ),
//                           ));
//                     },
//                     childCount: 1,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ));
//   }
// }
