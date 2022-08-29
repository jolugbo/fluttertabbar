import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linkedin_login/linkedin_login.dart';
import 'package:edurald/utills/styles.dart';
import 'package:edurald/models/strings.dart';

import '../../models/user/user.dart';

class registrationPage extends StatefulWidget {
  registrationPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<registrationPage>
    with TickerProviderStateMixin {
  String ladyIcon = imageBase + 'welcomelady.png';
  String signInLinkedInIcon = imageBase + 'signInLinkedIn.png';
  String signInTwitterIcon = imageBase + 'signInTwitter.png';
  String signInGoogleIcon = imageBase + 'signInGoogle.png';
  String redirectUrl = 'http://edurald.com/';
  String clientId = '77zum551b93zkz';
  String clientSecret = 'gwr7A7OHq00ns3Ow';
  List<String> scrollText = [
    'Investment banking knowledge simplified',
    'Learn and connect with other investors',
    'Build your professional profile'
  ];
  int index = 0;
  final int _numPages = 3;
  int _currentPage = 0;
  int _current = 0;
  bool logoutUser = false;
  //UserModel user;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
            top: MediaQuery.of(context).size.height * 0,
            height: MediaQuery.of(context).size.height,
            duration: Duration(seconds: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Edurald',
                          style: dark25BoldStyle,
                          textAlign: TextAlign.center,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Text(
                          'Commerce knowledge simplified',
                          style: darkNormal18Style,
                          textAlign: TextAlign.center,
                        ),
                      ]),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(0),
                  child: Image(image: AssetImage(ladyIcon)),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.18,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    LinkedInUserWidget(
                                  appBar: AppBar(
                                    title: Text('LinkedIn Authorisation'),
                                  ),
                                  destroySession: logoutUser,
                                  redirectUrl: redirectUrl,
                                  clientId: clientId,
                                  clientSecret: clientSecret,
                                  projection: [
                                    ProjectionParameters.id,
                                    ProjectionParameters.localizedFirstName,
                                    ProjectionParameters.localizedLastName,
                                    ProjectionParameters.firstName,
                                    ProjectionParameters.lastName,
                                    ProjectionParameters.profilePicture,
                                  ],
                                  onError: (UserFailedAction e) {
                                    print('Error: ${e.toString()}');
                                    print('Error: ${e.stackTrace.toString()}');
                                  },
                                  onGetUserProfile:
                                      (UserSucceededAction linkedInUser) {
                                    print(
                                        'Access token ${linkedInUser.user.token.accessToken}');
                                    print(
                                        'User id: ${linkedInUser.user.userId}');
                                    print(
                                        'photoUrl: ${linkedInUser.user.profilePicture}');

                                    setState(() {
                                      // user = UserModel(
                                      //     // firstName: linkedInUser.user?.firstName?.localized?.label,
                                      //     // lastName: linkedInUser?.user?.lastName?.localized?.label,
                                      //     // email: linkedInUser?.user?.email?.elements![0]?.handleDeep?.emailAddress,
                                      //     // photoUrl: linkedInUser?.user?.profilePicture?.displayImageContent?.elements![0]?.identifiers![0]?.identifier,
                                      //     );
                                      logoutUser = false;
                                    });
                                    Navigator.pop(context);
                                    Navigator.pushNamed(
                                      context, '/registration_form',
                                      //arguments: user
                                      // {
                                      //   'email':user.email,
                                      //   'lastName': user.lastName,
                                      //   'photoUrl': user.photoUrl,
                                      //  }
                                    );
                                  },
                                ),
                                fullscreenDialog: true,
                              ),
                            );
                          },
                          child: Image(
                            image: AssetImage(signInLinkedInIcon),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => print('Twitter Clicked'),
                          child: Image(image: AssetImage(signInTwitterIcon)),
                        ),
                        GestureDetector(
                          onTap: () => print('Google Clicked'),
                          child: Image(image: AssetImage(signInGoogleIcon)),
                        ),
                      ]),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: Text(
                    'or',
                    style: darkNormal18Style,
                    textAlign: TextAlign.center,
                  ),
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
                                  side: BorderSide(color: projectBlue)),
                              color: projectBlue,
                              child: Text(
                                'Create Account',
                                style: white18Style,
                              ),
                              onPressed: () => {
                                Navigator.pushNamed(
                                    context, '/registration_form')
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
        ],
      ),
    );
  }
}
