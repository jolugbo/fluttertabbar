import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project_x/utills/styles.dart';

class registrationPage extends StatefulWidget {
  registrationPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<registrationPage>
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
  int index = 0;
  final int _numPages = 3;
  int _currentPage = 0;
  int _current = 0;



  void doMotion() {
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

  @override
  State<StatefulWidget> initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => doMotion());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('PROJECT X',style: dark25BoldStyle,textAlign: TextAlign.center,),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text('Commerce knowledge simplified',style: darkNormal18Style,textAlign: TextAlign.center,),
                    ]),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center, padding:EdgeInsets.all(0),
                  child: Image( image:AssetImage(ladyIcon)),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Continue with',style: darkNormal18Style,textAlign: TextAlign.center,),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Image( image:AssetImage(socialIcon)),
                      ]),
                ),

                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: Text('or',style: darkNormal18Style,textAlign: TextAlign.center,),
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
                              child: Text('Create Account',style: white18Style,),
                              onPressed: () => {
                                Navigator.pushNamed(context, '/registration_form')
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