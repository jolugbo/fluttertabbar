import 'dart:async';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_x/utills/imageanimations.dart';
import 'package:project_x/utills/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class registration_tokenPage extends StatefulWidget {
  registration_tokenPage({Key key, this.title}) : super(key: key);

  final String title;


  @override
  _RegisterationTokenPageState createState() => _RegisterationTokenPageState();
}

class _RegisterationTokenPageState extends State<registration_tokenPage>
    with TickerProviderStateMixin {
  String leafIcon = 'assets/leaficon.png';
  double tokenEntryWidth = 0;
  double tokenEntryHeight = 0;
  String bgMain1 = 'assets/leafBG.png';
  String token = '';
  String userId = '';
  bool showLoader = false;



  @override
  State<StatefulWidget> initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    final prefs = await SharedPreferences.getInstance();
    String payloadResponse = prefs.getString('userId');
    if (payloadResponse.isNotEmpty) {
      setState(() {
        userId = payloadResponse;
        print(userId);
      });
    }
  }

  Future<void> confirmSignUp() async {
    if(!showLoader) {
      setState(() {
        showLoader = true;
      });
      try {
        SignUpResult res = await Amplify.Auth.confirmSignUp(
            username: userId.trim(),
            confirmationCode: token.substring(0, 6)
        );
        setState(() {
          showLoader = false;
        });
        if(res.isSignUpComplete){
          Navigator.pushNamed(context, '/signin');
        }
      } on AuthError catch (e) {
        setState(() {
          showLoader = false;
        });
        Fluttertoast.showToast(
            msg: e.exceptionList[1].detail.toString(),
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    tokenEntryHeight = MediaQuery.of(context).size.height * 0.06;
    tokenEntryWidth = MediaQuery.of(context).size.width * 0.12;
    return Scaffold(
      body: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
//          AnimatedPositioned(
//            top: 0,
//            right: -MediaQuery.of(context).size.width * 0.2,
//            duration: Duration(seconds: 1),
//            child: WidgetAnimator(
//              component: Container(
//                height: MediaQuery.of(context).size.height * 0.3,
//                width: MediaQuery.of(context).size.width,
//                child: imgAnimation2(
//                  url: bgMain1,
//                  time: Duration(seconds: 2),beginx:0.10,endx: 0, beginy: 0.1,endy: 0,
//                  width: MediaQuery.of(context).size.width,
//                  height: MediaQuery.of(context).size.height,
//                  transition: PositionedTransition,
//                ),
//              ),
//              transition: Transform,
//              animPattern: Curves.easeIn,
//              pixle: Colors.transparent,
//              time: Duration(seconds: 1),
//              animType: "nothing",
//              xAxis: 0,
//              yAxis: 0,
//            ),
//          ),
//
//          Positioned(
//              top: 0,
//              child: Container(
//                height: MediaQuery.of(context).size.height * 0.15,
//                width: MediaQuery.of(context).size.width,
//                child: Row(
//                  children: <Widget>[
//                    IconButton(
//                      icon: Icon(
//                        Icons.arrow_back_ios,size: 30,
//                        color: projectDark,
//                      ),
//                    ),
//
//                    Container(
//                      width: MediaQuery.of(context).size.width * 0.8,
//                      child: Hero(
//                        tag: "iconTag",
//                        child: WidgetAnimator(
//                          component: imgAnimation2(
//                            url: leafIcon,
//                            time: Duration(seconds: 3),beginx:0.0,endx: -0, beginy: 0,endy: -0.0,
//                            width: MediaQuery.of(context).size.width * 0.3,
//                            //height: MediaQuery.of(context).size.height * 0.3,
//                            transition: PositionedTransition,
//                          ),
//                          transition: Transform,
//                          animPattern: Curves.easeInOutCirc,
//                          pixle: Colors.transparent,
//                          time: Duration(seconds: 1),
//                          animType: "nothing",
//                          xAxis: -MediaQuery.of(context).size.width * 0,
//                          yAxis: -MediaQuery.of(context).size.height * 0,
//                        ),
//                      ),
//                    ),
//                  ],
//                ),
//              )),

          AnimatedPositioned(
            child: Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.05,0,
                    MediaQuery.of(context).size.width * 0.05,0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Email Veification',
                        style: dark32Style,
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'We sent a token to your email \n\n',
                          style: dark15Style,
                          children: <TextSpan>[
                            TextSpan(
                              text: userId + '\n\n',
                              style: green12Style,
                            ),
                            TextSpan(
                              text: ' please input token below to proceed.',
                              style: dark15Style,
                            ),
                          ],
                        ),
                      ),
                    ])
            ),
            top: MediaQuery.of(context).size.height * 0.1,
            height: MediaQuery.of(context).size.height * 0.2,
            duration: Duration(seconds: 1),
          ),

          AnimatedPositioned(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: WidgetAnimator(
                component: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.transparent,
                    padding: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.02,
                        MediaQuery.of(context).size.width * 0.08,
                        MediaQuery.of(context).size.width * 0.02,
                        MediaQuery.of(context).size.width * 0.1),
                    alignment: Alignment.center,
                    child: Column(children: <Widget>[
                      Container(
                        //height: MediaQuery.of(context).size.height * 0.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              height: MediaQuery.of(context).size.height * 0.08,
                              child: Text('OTP expires in \n\n4:59s', style: light14Style,textAlign: TextAlign.center,),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular( 20)),
                                  child: Container(
                                      alignment: Alignment.center,
                                      decoration: tokenBox,
                                      height: tokenEntryHeight,
                                      width: tokenEntryWidth,
                                      margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        (token.length>0)? token[0]:'',
                                        style: securityStyle2,
                                        textAlign: TextAlign.center,
                                      )),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular( 20)),
                                  child: Container(
                                      alignment: Alignment.center,
                                      decoration: tokenBox,
                                      height: tokenEntryHeight,
                                      width: tokenEntryWidth,
                                      margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        (token.length>1)? token[1]:'',
                                        style: securityStyle2,
                                        textAlign: TextAlign.center,
                                      )),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular( 20)),
                                  child: Container(
                                      alignment: Alignment.center,
                                      decoration: tokenBox,
                                      height: tokenEntryHeight,
                                      width: tokenEntryWidth,
                                      margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        (token.length>2)? token[2]:'',
                                        style: securityStyle2,
                                        textAlign: TextAlign.center,
                                      )),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular( 20)),
                                  child: Container(
                                      alignment: Alignment.center,
                                      decoration: tokenBox,
                                      height: tokenEntryHeight,
                                      width: tokenEntryWidth,
                                      margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        (token.length>3)? token[3]:'',
                                        style: securityStyle2,
                                        textAlign: TextAlign.center,
                                      )),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular( 20)),
                                  child: Container(
                                      alignment: Alignment.center,
                                      decoration: tokenBox,
                                      height: tokenEntryHeight,
                                      width: tokenEntryWidth,
                                      margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        (token.length>4)? token[4]:'',
                                        style: securityStyle2,
                                        textAlign: TextAlign.center,
                                      )),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular( 20)),
                                  child: Container(
                                      alignment: Alignment.center,
                                      decoration: tokenBox,
                                      height: tokenEntryHeight,
                                      width: tokenEntryWidth,
                                      margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        (token.length>5)? token[5]:'',
                                        style: securityStyle2,
                                        textAlign: TextAlign.center,
                                      )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.height * 0.05,
                            MediaQuery.of(context).size.height * 0.05,
                            MediaQuery.of(context).size.height * 0.05,
                            0),
                        height: MediaQuery.of(context).size.height * 0.45,
                        child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    RawMaterialButton(
                                      onPressed: () {
                                        setState(() {
                                          token += '1';
                                        });
                                      },
                                      elevation: 2.0,
                                      fillColor: projectBlue,
                                      child: Text( '1',style: securityStyle,),//,backgroundColor: Colors.green,
                                      padding: EdgeInsets.all(15.0),
                                      shape: CircleBorder(side: BorderSide(color: accent)),
                                    ),
                                    RawMaterialButton(
                                      onPressed: () {
                                        setState(() {
                                          token += '2';
                                        });},
                                      elevation: 2.0,
                                      fillColor: projectBlue,
                                      child: Text( '2',style: securityStyle,),//,backgroundColor: Colors.green,
                                      padding: EdgeInsets.all(15.0),
                                      shape: CircleBorder(side: BorderSide(color: accent)),
                                    ),
                                    RawMaterialButton(
                                      onPressed: () {
                                        setState(() {
                                          token += '3';
                                        });},
                                      elevation: 2.0,
                                      fillColor: projectBlue,
                                      child: Text( '3',style: securityStyle,),//,backgroundColor: Colors.green,
                                      padding: EdgeInsets.all(15.0),
                                      shape: CircleBorder(side: BorderSide(color: accent)),
                                    ),

                                  ]),
                              Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    RawMaterialButton(
                                      onPressed: () {
                                        setState(() {
                                          token += '4';
                                        });},
                                      elevation: 2.0,
                                      fillColor: projectBlue,
                                      child: Text( '4',style: securityStyle,),//,backgroundColor: Colors.green,
                                      padding: EdgeInsets.all(15.0),
                                      shape: CircleBorder(side: BorderSide(color: accent)),
                                    ),
                                    RawMaterialButton(
                                      onPressed: () {
                                        setState(() {
                                          token += '5';
                                        });},
                                      elevation: 2.0,
                                      fillColor: projectBlue,
                                      child: Text( '5',style: securityStyle,),//,backgroundColor: Colors.green,
                                      padding: EdgeInsets.all(15.0),
                                      shape: CircleBorder(side: BorderSide(color: accent)),
                                    ),
                                    RawMaterialButton(
                                      onPressed: () {
                                        setState(() {
                                          token += '6';
                                        });},
                                      elevation: 2.0,
                                      fillColor: projectBlue,
                                      child: Text( '6',style: securityStyle,),//,backgroundColor: Colors.green,
                                      padding: EdgeInsets.all(15.0),
                                      shape: CircleBorder(side: BorderSide(color: accent)),
                                    ),
                                  ]),
                              Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    RawMaterialButton(
                                      onPressed: () {
                                        setState(() {
                                          token += '7';
                                        });},
                                      elevation: 2.0,
                                      fillColor: projectBlue,
                                      child: Text( '7',style: securityStyle,),//,backgroundColor: Colors.green,
                                      padding: EdgeInsets.all(15.0),
                                      shape: CircleBorder(side: BorderSide(color: accent)),
                                    ),
                                    RawMaterialButton(
                                      onPressed: () {
                                        setState(() {
                                          token += '8';
                                        });},
                                      elevation: 2.0,
                                      fillColor: projectBlue,
                                      child: Text( '8',style: securityStyle,),//,backgroundColor: Colors.green,
                                      padding: EdgeInsets.all(15.0),
                                      shape: CircleBorder(side: BorderSide(color: accent)),
                                    ),
                                    RawMaterialButton(
                                      onPressed: () {
                                        setState(() {
                                          token += '9';
                                        });
                                        },
                                      elevation: 2.0,
                                      fillColor: projectBlue,
                                      child: Text( '9',style: securityStyle,),//,backgroundColor: Colors.green,
                                      padding: EdgeInsets.all(15.0),
                                      shape: CircleBorder(side: BorderSide(color: accent)),
                                    ),

                                  ]),
                              Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: <Widget>[

                                    RawMaterialButton(
                                      onPressed: () {
                                        setState(() {
                                          if(token.length >6){
                                            token = token.substring(0,6);
                                          }
                                          if(token.length > 0)
                                          token = token.substring(0,token.length-1);
                                        });},
                                      elevation: 2.0,
                                      fillColor: projectBlue,
                                      child: Icon(Icons.backspace,color: accent,),//,backgroundColor: Colors.green,
                                      padding: EdgeInsets.all(15.0),
                                      shape: CircleBorder(side: BorderSide(color: accent)),
                                    ),
                                    RawMaterialButton(
                                      onPressed: () {
                                        setState(() {
                                          token += '0';
                                        });
                                      },
                                      elevation: 2.0,
                                      fillColor: projectBlue,
                                      child: Text( '0',style: securityStyle,),//,backgroundColor: Colors.green,
                                      padding: EdgeInsets.all(15.0),
                                      shape: CircleBorder(side: BorderSide(color: accent)),
                                    ),
                                    RawMaterialButton(
                                      onPressed: () async {
                                        if(token.length > 6){
                                          token = token.substring(0,6);
                                        }
                                        if(token.length == 6){
                                          await confirmSignUp();
                                        }
                                        else{
                                          Fluttertoast.showToast(
                                              msg:'invalid token length',
                                              toastLength: Toast.LENGTH_LONG,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.red,
                                              textColor: Colors.white,
                                              fontSize: 16.0);
                                        }
                                      },
                                      elevation: 2.0,
                                      fillColor: projectBlue,
                                      child: Text( 'OK',style: securityStyle,),//,backgroundColor: Colors.green,
                                      padding: EdgeInsets.all(15.0),
                                      shape: CircleBorder(side: BorderSide(color: accent)),
                                    ),

                                  ]),
                              Container(
                                height: MediaQuery.of(context).size.height * 0.05,
                                alignment: Alignment.center,
                                child: Text('Request new OTP', style: light14Style,textAlign: TextAlign.center,),
                              ),
                            ]),
                      )
                    ])),
                transition: ScaleTransition,
                animPattern: Curves.easeInOutCirc,
                pixle: accent,
                time: Duration(seconds: 1),
                animType: "nothing",
                xAxis: 0,
                yAxis: 0,
              ),
            ),
            top: MediaQuery.of(context).size.height * 0.3,
            height: MediaQuery.of(context).size.height * 0.8,
            duration: Duration(seconds: 1),
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
    );
  }
}
