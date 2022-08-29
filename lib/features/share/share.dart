//

//               OLUFEMI         ADETOLA             <bold!>JOLUGBO<bold!>

//
import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:edurald/utills/styles.dart';
import 'package:share/share.dart';

class share extends StatefulWidget {
  share({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _ShareState createState() => _ShareState();
}

class _ShareState extends State<share> with TickerProviderStateMixin {
  String share1 = 'assets/share1.png';
  String share2 = 'assets/share2.png';
  String share3 = 'assets/share3.png';
  String share4 = 'assets/share4.png';
  String share5 = 'assets/share5.png';
  String share6 = 'assets/share6.png';
  String share7 = 'assets/share7.png';
  String promoImg = 'assets/promoImg.png';
  final GlobalKey<ScaffoldState> _scaffoldKey1 = GlobalKey<ScaffoldState>();
  ContainerTransitionType _transitionType = ContainerTransitionType.fade;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            key: _scaffoldKey1,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: accent,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: projectDark,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Container(
                child: Text(
                  'Invite Friends',
                  style: blue14Style,
                ),
              ),
            ),
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
                    top: MediaQuery.of(context).size.height * 0,
                    height: MediaQuery.of(context).size.height,
                    duration: Duration(seconds: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width,
                        ),
                        Container(
                          // height: MediaQuery.of(context).size.height * 0.15,
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RawMaterialButton(
                                      elevation: 2.0,
                                      fillColor: projectGray,
                                      onPressed: () {},
                                      child: Image.asset(
                                        share1,
                                        width: 50,
                                        height: 50,
                                      ),
                                      padding: EdgeInsets.all(2.0),
                                      shape: CircleBorder(
                                          side:
                                              BorderSide(color: projectGray2)),
                                    ),
                                    RawMaterialButton(
                                      elevation: 2.0,
                                      fillColor: projectGray,
                                      child: Image.asset(
                                        share2,
                                        width: 50,
                                        height: 50,
                                      ),
                                      padding: EdgeInsets.all(2.0),
                                      shape: CircleBorder(
                                          side:
                                              BorderSide(color: projectGray2)),
                                      onPressed: () {},
                                    ),
                                    RawMaterialButton(
                                      elevation: 2.0,
                                      fillColor: projectGray,
                                      onPressed: () {},
                                      child: Image.asset(
                                        share3,
                                        width: 50,
                                        height: 50,
                                      ),
                                      padding: EdgeInsets.all(2.0),
                                      shape: CircleBorder(
                                          side:
                                              BorderSide(color: projectGray2)),
                                    )
                                  ],
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RawMaterialButton(
                                      elevation: 2.0,
                                      fillColor: projectGray,
                                      onPressed: () {},
                                      child: Image.asset(
                                        share4,
                                        width: 60,
                                        height: 60,
                                      ),
                                      padding: EdgeInsets.all(2.0),
                                      shape: CircleBorder(
                                          side:
                                              BorderSide(color: projectGray2)),
                                    ),
                                    RawMaterialButton(
                                      elevation: 2.0,
                                      fillColor: projectGray,
                                      onPressed: () {},
                                      child: Image.asset(
                                        share5,
                                        width: 60,
                                        height: 60,
                                      ),
                                      padding: EdgeInsets.all(2.0),
                                      shape: CircleBorder(
                                          side:
                                              BorderSide(color: projectGray2)),
                                    ),
                                    RawMaterialButton(
                                      elevation: 2.0,
                                      fillColor: projectGray,
                                      onPressed: () {},
                                      child: Image.asset(
                                        share6,
                                        width: 60,
                                        height: 60,
                                      ),
                                      padding: EdgeInsets.all(2.0),
                                      shape: CircleBorder(
                                          side:
                                              BorderSide(color: projectGray2)),
                                    ),
                                    RawMaterialButton(
                                      elevation: 2.0,
                                      fillColor: projectGray,
                                      onPressed: () {},
                                      child: Image.asset(
                                        share7,
                                        width: 60,
                                        height: 60,
                                      ),
                                      padding: EdgeInsets.all(2.0),
                                      shape: CircleBorder(
                                          side:
                                              BorderSide(color: projectGray2)),
                                    )
                                  ],
                                ),
                              ]),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Container(
                            //height: MediaQuery.of(context).size.height * 0.15,
                            width: MediaQuery.of(context).size.width * 0.85,
                            alignment: Alignment.center,
                            child: Text(
                              'Invite your friends to join Project X community and earn points',
                              textAlign: TextAlign.center,
                              style: dark20Style,
                            )),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          alignment: Alignment.center,
                          child: ButtonTheme(
                              minWidth: MediaQuery.of(context).size.width,
                              height: 40,
                              buttonColor: accent,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  //side: BorderSide(color: accent)
                                ),
                                color: projectBlue,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.share_outlined,
                                      color: accent,
                                    ),
                                    Text(
                                      ' Share with friends',
                                      style: light18Style,
                                    ),
                                    Text('')
                                  ],
                                ),
                                onPressed: () => {
                                  Share.share(
                                      'check out my website https://example.com',
                                      subject:
                                          'hey friend take a look at this cool app!')
                                },
                                highlightElevation: 0.8,
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ))));
  }
}
