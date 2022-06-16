import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:edurald/utills/styles.dart';
import 'package:edurald/models/strings.dart';
import 'package:flutter/services.dart';

import '../../gen/assets.gen.dart';
import '../../utills/imageanimations.dart';

class walkthroughPage extends StatefulWidget {
  walkthroughPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _WalkthroughPageState createState() => _WalkthroughPageState();
}

class _WalkthroughPageState extends State<walkthroughPage> {
  final String redirectUrl = 'http://edurald.com/';
  final String clientId = '77zum551b93zkz';
  final String clientSecret = 'gwr7A7OHq00ns3Ow';
  // final String response = await rootBundle.loadString(Assets.json.configs);
  // final data = await json.decode(response);
  List<String> scrollText = [
    'Commerce knowledge simplified',
    'Learn and connect with other professionals',
    'Earn your reputation as a business professional'
  ];
  List<Image> scrollImgs = [
    Assets.images.walkthrough1.image(),
    Assets.images.walkthrough2.image(),
    Assets.images.walkthrough3.image()
  ];
  int index = 0;
  final int _numPages = 3;
  int _currentPage = 0;
  int _current = 0;
 int animatedHeight = 0;
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
    animatedHeight = 1;
    return Scaffold(
      body: Stack(
        overflow: Overflow.visible,
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
            height: MediaQuery.of(context).size.height ,
            duration: Duration(seconds: 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Hero(
                    tag: "splashscreenImage",
                    child: WidgetAnimator(
                      component: Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.transparent,alignment: Alignment.topCenter,
                        child: imgAnimation2(url: Assets.images.eduraldLogo.path,time: Duration(milliseconds: 4000),
                          width: MediaQuery.of(context).size.width * 0.5,beginx:0.1,endx: -0.1, beginy: 0,endy: 0,
                          height: MediaQuery.of(context).size.height * 0.5,transition: PositionedTransition,
                        ),),
                      transition: Transform,animPattern: Curves.easeIn,pixle: Colors.transparent,time: Duration(seconds: 1),animType: "nothing",xAxis: 0,yAxis: 0,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.65,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.topCenter,
                  child: Column(children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: MediaQuery.of(context).size.height * 0.6,
                        aspectRatio: 16 / 9,
                        viewportFraction: 1,
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
                        scrollDirection: Axis.horizontal,
                      ),
                      items: [0, 1, 2].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              height: MediaQuery.of(context).size.height * 0.6,
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.15,
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    alignment: Alignment.center,
                                    child: Text(
                                      scrollText[i],
                                      style: darkNormal25Style,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.35,
                                    width: MediaQuery.of(context).size.width,
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(0),
                                    child: scrollImgs[i],
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
                      children: [
                        0,
                        1,
                        2,
                      ].map((i) {
                        int index = i;
                        return Container(
                          width: 8.0,
                          height: 8.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _current == index
                                ? Color.fromRGBO(0, 0, 0, 0.9)
                                : Color.fromRGBO(0, 0, 0, 0.4),
                          ),
                        );
                      }).toList(),
                    ),
                  ]),
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
                                  side: BorderSide(color: projectBlue)),
                              color: projectBlue,
                              child: Text(
                                'Sign up',
                                style: white25Style,
                              ),
                              onPressed: () => {
                                Navigator.pushNamed(
                                    context, '/registration_form')
                              },
                              highlightElevation: 0.8,
                            )),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        alignment: Alignment.center,
                        color: Colors.transparent,
                        child: ButtonTheme(
                            minWidth: MediaQuery.of(context).size.width * 0.5,
                            height: 40,
                            buttonColor: accent,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                //side: BorderSide(color: projectBlue)
                              ),
                              color: accent,
                              child: Text(
                                'Sign in',
                                style: gray25Style,
                              ),
                              onPressed: () =>
                                  {Navigator.pushNamed(context, '/signin')},
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
