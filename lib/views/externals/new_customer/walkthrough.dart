import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project_x/utills/styles.dart';

class walkthroughPage extends StatefulWidget {
  walkthroughPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WalkthroughPageState createState() => _WalkthroughPageState();
}

class _WalkthroughPageState extends State<walkthroughPage>{
//  String humanIcon1 = 'assets/welcomelady.png';
//  String humanIcon2 = 'assets/ladyIcon2.png';
//  String humanIcon3 = 'assets/femaleicon.png';
  String nairaIcon = 'assets/nairacharticon.png';
  String bgIcon = 'assets/bgicon.png';
  String bgMain = 'assets/blankwhite.png';
  String centerIcon = 'assets/shield.png';
  List<String> scrollText = ['Commerce knowledge simplified',
    'Learn and connect with other professionals','Earn your reputation as a business professional'];
  List<String> scrollImgs = ['assets/walkthrough1.png','assets/walkthrough2.png','assets/walkthrough3.png'];
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
                  child: Text('PROJECT X',style: dark25BoldStyle,textAlign: TextAlign.center,),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.65,
                  width: MediaQuery.of(context).size.width, //color: Colors.red,
                    alignment: Alignment.center,
                  child:

                  Column(
                  children: [
                   CarouselSlider(
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height * 0.6,
                      aspectRatio: 16/9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      },
                      scrollDirection: Axis.horizontal,),
                     items: [0,1,2].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.6,
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                  //color: Colors.blue
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    height: MediaQuery.of(context).size.height * 0.15,
                                    width: MediaQuery.of(context).size.width * 0.68,
                                    alignment: Alignment.center,
                                    child: Text(scrollText[i],style: darkNormal25Style,textAlign: TextAlign.center,),
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height * 0.35,
                                    width: MediaQuery.of(context).size.width,
                                    alignment: Alignment.center, padding:EdgeInsets.all(0),
                                    child: Image( image:AssetImage(scrollImgs[i])),
                                  ),
                                ],
                              ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [0,1,2,].map((i) {
                    int index = i;
                    return Container(
                      width: 8.0,
                      height: 8.0,
                      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == index
                            ? Color.fromRGBO(0, 0, 0, 0.9)
                            : Color.fromRGBO(0, 0, 0, 0.4),
                      ),
                    );
                  }).toList(),
                ),
              ]
            ),

                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        alignment: Alignment.center,
                        //color: projectBlue,
                        child: ButtonTheme(
                            minWidth: MediaQuery.of(context).size.width * 0.5,
                            height: 40,
                            buttonColor: Colors.transparent,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: BorderSide(color: projectBlue)
                              ),
                              color: projectBlue,
                              child: Text('Sign up',style: white25Style,),
                              onPressed: () => {
                                Navigator.pushNamed(context, '/registration')
                              },
                              highlightElevation: 0.8,
                            )),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        alignment: Alignment.center,
                        color: Colors.transparent,
                        child: ButtonTheme(
                            minWidth:
                            MediaQuery.of(context).size.width * 0.5,
                            height: 40,
                            buttonColor: accent,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  //side: BorderSide(color: projectBlue)
                              ),
                              color: accent,
                              child: Text('Sign in',style: gray25Style,),
                              onPressed: () => {
                                Navigator.pushNamed(context, '/signin')
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