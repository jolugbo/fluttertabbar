//

//               OLUFEMI         ADETOLA             <bold!>JOLUGBO<bold!>

//
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:project_x/utills/imageanimations.dart';
import 'package:project_x/utills/styles.dart';

class community extends StatefulWidget {
  community({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<community>
    with TickerProviderStateMixin {
  String leafIcon = 'assets/leaficon.png';
  String bgMain = 'assets/purplebg.png';
  String dashActive = 'assets/dashboardactive.png';
  String dashInactive = 'assets/dashboardinactive.png';
  String vacationicon = 'assets/vacationicon.png';
  String investmentactive = 'assets/investmentactive.png';
  String investmentInactive = 'assets/investmentinactive.png';
  String topupactive = 'assets/topupactive.png';
  String topupInactive = 'assets/topupinactive.png';
  String walletactive = 'assets/walletactive.png';
  String groupGoalIcon = 'assets/groupgoalicon.png';
  String goalicon = 'assets/smallgoalicon.png';
  String more = 'assets/more.png';
  String cardbackground = 'assets/cardbackground.png';
  String portfolioicon = 'assets/portfolioicon.png';
  String morebutton = 'assets/morebutton.png';
  String vector = 'assets/vector.png';
  String fixedincomeicon = 'assets/fixedincomeicon.png';
  String mmfchart = 'assets/mmfchart.png';
  String defaultprofile = 'assets/defaultprofile.png';
  String favourite = 'assets/favourite.png';
  String placeholder = 'assets/ph.jpg';
  double lowerDashElementPosition = 0.33;
  int _currentIndex = 0;
  Icon dropDown = Icon(Icons.keyboard_arrow_down,color: accent,);
  Map<String, double> dataMap = {
    "ARM Money Market Fund": 60,
    "ARM EuroBond": 16,
    "ARM Fixed Income Fund": 20,
    "ARM Ethical Fund": 4,
  };
  List<Color> colorList = [
    projectPink,
    projectGreen2,
    projectBlue,
    projectYellow,
  ];
  @override
  State<StatefulWidget> initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        //bg
        AnimatedPositioned(
          top: 0,
          //right: -MediaQuery.of(context).size.width * 0.2,
          duration: Duration(seconds: 1),
          child: WidgetAnimator(
            component: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width, color: accent,
//                decoration: new BoxDecoration(
//                    image: new DecorationImage(
//                      fit: BoxFit.fill,
//                      image: AssetImage(bgMain),
//                    ))
            ),
            transition: Transform,
            animPattern: Curves.easeIn,
            pixle: Colors.transparent,
            time: Duration(seconds: 1),
            animType: "nothing",
            xAxis: 0,
            yAxis: 0,
          ),
        ),

        //dashboard lower
        CustomScrollView(

          slivers: <Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return  Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.topCenter,
                    height: MediaQuery.of(context).size.height,
                    padding: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width *0.01,
                        MediaQuery.of(context).size.height *0.03,
                        MediaQuery.of(context).size.width *0.01,
                        MediaQuery.of(context).size.height *0.1),
                    child:ListView(
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.95,
                          alignment: Alignment.topLeft, padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.fromLTRB(10,10,10,0),alignment: Alignment.topLeft,
                                child: Text('Discipline Coaches', style: blue14Style,),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.fromLTRB(10,5,10,10),alignment: Alignment.topLeft,
                                    child: Text('make yourself accountable to our coach', style: dark10Style,),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(10,0,10,0),alignment: Alignment.centerRight,
                                    //width: MediaQuery.of(context).size.width * 0.95,
                                    child: Text('View more', style: green12Style,),
                                  ),
                                ],
                              ),
                              Container(
                                child: CarouselSlider(
                                  options: CarouselOptions(
                                    height: MediaQuery.of(context).size.height * 0.135,
                                    aspectRatio: 1,
                                    viewportFraction: 1,
                                    initialPage: 0,
                                    enableInfiniteScroll: true,
                                    reverse: false,
                                    autoPlay: false,
                                    autoPlayInterval: Duration(seconds: 4),
                                    autoPlayAnimationDuration: Duration(seconds: 1),
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    enlargeCenterPage: true,
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        //_current = index;
                                      });
                                    },
                                    scrollDirection: Axis.horizontal,),
                                  items: [0,1,2].map((i) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return Container(
                                          padding: EdgeInsets.fromLTRB(5,10,5,0),
                                          alignment: Alignment.center, color: accent,
                                          child: Scrollbar(
                                            child: ListView(
                                              scrollDirection: Axis.horizontal,
                                              children: <Widget>[
                                                Column(
                                                    mainAxisSize: MainAxisSize.max,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: <Widget>[
                                                      RawMaterialButton(
                                                        onPressed: () {},
                                                        elevation: 2.0,
                                                        fillColor: projectGray2,
                                                        child: Image.asset(placeholder,width: 30,height: 30,),//,backgroundColor: Colors.green,
                                                        padding: EdgeInsets.all(10.0),
                                                        shape: CircleBorder(side: BorderSide(color: projectGray2)),
                                                      ),
                                                      Container(
                                                          padding: EdgeInsets.fromLTRB(5,5,5,0),alignment: Alignment.center, width:120,
                                                          child: Text('Investment Banking Coaches', style: dark10Style,softWrap: true,textAlign: TextAlign.center,)
                                                      ),

                                                    ]),
                                                Column(
                                                    mainAxisSize: MainAxisSize.max,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: <Widget>[
                                                      RawMaterialButton(
                                                        onPressed: () {},
                                                        elevation: 2.0,
                                                        fillColor: projectGray2,
                                                        child: Image.asset(placeholder,width: 30,height: 30,),//,backgroundColor: Colors.green,
                                                        padding: EdgeInsets.all(10.0),
                                                        shape: CircleBorder(side: BorderSide(color: projectGray2)),
                                                      ),
                                                      Container(
                                                          padding: EdgeInsets.fromLTRB(5,5,5,0),alignment: Alignment.center, width:120,
                                                          child: Text('Accountant Coaches', style: dark10Style,softWrap: true,textAlign: TextAlign.center,)
                                                      ),

                                                    ]),
                                                Column(
                                                    mainAxisSize: MainAxisSize.max,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: <Widget>[
                                                      RawMaterialButton(
                                                        onPressed: () {},
                                                        elevation: 2.0,
                                                        fillColor: projectGray2,
                                                        child: Image.asset(placeholder,width: 30,height: 30,),//,backgroundColor: Colors.green,
                                                        padding: EdgeInsets.all(10.0),
                                                        shape: CircleBorder(side: BorderSide(color: projectGray2)),
                                                      ),
                                                      Container(
                                                          padding: EdgeInsets.fromLTRB(5,5,5,0),alignment: Alignment.center, width:120,
                                                          child: Text('Corporate Governance Coaches', style: dark10Style,softWrap: true,textAlign: TextAlign.center,)
                                                      ),

                                                    ]),
                                                Column(
                                                    mainAxisSize: MainAxisSize.max,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: <Widget>[
                                                      RawMaterialButton(
                                                        onPressed: () {},
                                                        elevation: 2.0,
                                                        fillColor: projectGray2,
                                                        child: Image.asset(placeholder,width: 30,height: 30,),//,backgroundColor: Colors.green,
                                                        padding: EdgeInsets.all(10.0),
                                                        shape: CircleBorder(side: BorderSide(color: projectGray2)),
                                                      ),
                                                      Container(
                                                          padding: EdgeInsets.fromLTRB(5,5,5,0),alignment: Alignment.center, width:120,
                                                          child: Text('Economics Coaches', style: dark10Style,softWrap: true,textAlign: TextAlign.center,)
                                                      ),

                                                    ]),
                                              ],
                                            ),
                                          )
                                        );
                                      },
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.95,
                          //height: MediaQuery.of(context).size.height * 0.5,
                          alignment: Alignment.topLeft, padding: EdgeInsets.all(0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.fromLTRB(10,10,10,0),alignment: Alignment.topLeft,
                                child: Text('Discuss Groups', style: blue14Style,),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.fromLTRB(10,5,10,10),alignment: Alignment.topLeft,
                                    child: Text('Connect & Engage with like minds', style: dark10Style,),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(10,0,10,0),alignment: Alignment.centerRight,
                                    child: Text('View more', style: green12Style,),
                                  ),
                                ],
                              ),
                              Container(
                                child: CarouselSlider(
                                  options: CarouselOptions(
                                    height: MediaQuery.of(context).size.height * 0.22,
                                    aspectRatio: 1,
                                    viewportFraction: 1,
                                    initialPage: 0,
                                    enableInfiniteScroll: true,
                                    reverse: false,
                                    autoPlay: false,
                                    autoPlayInterval: Duration(seconds: 4),
                                    autoPlayAnimationDuration: Duration(seconds: 1),
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    enlargeCenterPage: true,
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        //_current = index;
                                      });
                                    },
                                    scrollDirection: Axis.horizontal,),
                                  items: [0,1,2].map((i) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return Container(
                                            padding: EdgeInsets.fromLTRB(5,10,5,0),
                                            alignment: Alignment.center, color: accent,
                                            child: Scrollbar(
                                              child: ListView(
                                                scrollDirection: Axis.horizontal,
                                                children: <Widget>[
                                                  Card(
                                                      elevation: 2,
                                                      shape: cardShape,
                                                      child: Container(
                                                        width: MediaQuery.of(context).size.width * 0.85,
                                                        //height: MediaQuery.of(context).size.height * 0.46,
                                                        alignment: Alignment.centerRight,
                                                        padding: EdgeInsets.fromLTRB(0,2,0,2),
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Container(
                                                              width: MediaQuery.of(context).size.width * 0.8,
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  RawMaterialButton(
                                                                    onPressed: () {},
                                                                    elevation: 2.0,
                                                                    fillColor: projectGray2,
                                                                    child: Image.asset(placeholder,width: 30,height: 30,),//,backgroundColor: Colors.green,
                                                                    padding: EdgeInsets.all(10.0),
                                                                    shape: CircleBorder(side: BorderSide(color: projectGray2)),
                                                                  ),
                                                                  Container(
                                                                    width: MediaQuery.of(context).size.width * 0.55,
                                                                    child: Column(
                                                                      children: [
                                                                        Container(
                                                                          alignment: Alignment.centerLeft,
                                                                          child: Text('Finance Discussion Group',style: dark13BoldStyle,textAlign: TextAlign.left,),
                                                                        ),
                                                                        Container(
                                                                          alignment: Alignment.centerLeft,
                                                                          child: Text('Lets discuss finance',style: gray12Style,textAlign: TextAlign.left,),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                                width: MediaQuery.of(context).size.width,
                                                                alignment: Alignment.center,
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    Icon(Icons.people_alt_rounded,color: projectGray,),
                                                                    Container(
                                                                      width: MediaQuery.of(context).size.width * 0.01,
                                                                    ),
                                                                    Text('5034 Members',style: gray12Style,textAlign: TextAlign.left,),
                                                                  ],
                                                                )
                                                            ),
                                                            Container(
                                                              height: MediaQuery.of(context).size.height * 0.05,
                                                              width: MediaQuery.of(context).size.width,
                                                              alignment: Alignment.center,
                                                              child: Padding(
                                                                padding: EdgeInsets.symmetric(horizontal: 0),
                                                                child: Container(
                                                                    height: 0.7,
                                                                    width: MediaQuery.of(context).size.width,
                                                                    color: projectGray),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: MediaQuery.of(context).size.width,
                                                              alignment: Alignment.center,
                                                              child: Text('Join Group',style: blue13boldStyle,),
                                                            ),

                                                          ],
                                                        ),
                                                      )

                                                  ),
                                                  Container(
                                                    width: 20,
                                                  ),
                                                  Card(
                                                      elevation: 2,
                                                      shape: cardShape,
                                                      child: Container(
                                                        width: MediaQuery.of(context).size.width * 0.85,
                                                        height: MediaQuery.of(context).size.height * 0.46,
                                                        alignment: Alignment.centerRight,
                                                        padding: EdgeInsets.fromLTRB(0,2,0,2),
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Container(
                                                              width: MediaQuery.of(context).size.width * 0.8,
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  RawMaterialButton(
                                                                    onPressed: () {},
                                                                    elevation: 2.0,
                                                                    fillColor: projectGray2,
                                                                    child: Image.asset(placeholder,width: 30,height: 30,),//,backgroundColor: Colors.green,
                                                                    padding: EdgeInsets.all(10.0),
                                                                    shape: CircleBorder(side: BorderSide(color: projectGray2)),
                                                                  ),
                                                                  Container(
                                                                    width: MediaQuery.of(context).size.width * 0.55,
                                                                    child: Column(
                                                                      children: [
                                                                        Container(
                                                                          alignment: Alignment.centerLeft,
                                                                          child: Text('Economics Discussion Group',style: dark13BoldStyle,textAlign: TextAlign.left,),
                                                                        ),
                                                                        Container(
                                                                          alignment: Alignment.centerLeft,
                                                                          child: Text('Lets discuss Economics',style: gray12Style,textAlign: TextAlign.left,),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              //height: MediaQuery.of(context).size.height * 0.05,
                                                                width: MediaQuery.of(context).size.width,
                                                                alignment: Alignment.center,
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    Icon(Icons.people_alt_rounded,color: projectGray,),
                                                                    Container(
                                                                      width: MediaQuery.of(context).size.width * 0.01,
                                                                    ),
                                                                    Text('5034 Members',style: gray12Style,textAlign: TextAlign.left,),
                                                                  ],
                                                                )
                                                            ),
                                                            Container(
                                                              height: MediaQuery.of(context).size.height * 0.05,
                                                              width: MediaQuery.of(context).size.width,
                                                              alignment: Alignment.center,
                                                              child: Padding(
                                                                padding: EdgeInsets.symmetric(horizontal: 0),
                                                                child: Container(
                                                                    height: 0.7,
                                                                    width: MediaQuery.of(context).size.width,
                                                                    color: projectGray),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: MediaQuery.of(context).size.width,
                                                              alignment: Alignment.center,
                                                              child: Text('Join Group',style: blue13boldStyle,),
                                                            ),

                                                          ],
                                                        ),
                                                      )

                                                  ),
//                                                  Container(
//                                                    width: MediaQuery.of(context).size.width * 0.9,
//                                                    height: MediaQuery.of(context).size.height * 0.35,
//                                                    padding: EdgeInsets.fromLTRB(0,10,0,10),
//                                                    alignment: Alignment.center,color: projectLightBlue,
//                                                    child: ListView(
//                                                      scrollDirection: Axis.vertical,
//                                                      children: <Widget>[
//                                                        Row(
//                                                          children: <Widget>[
//                                                            Column(
//                                                                mainAxisSize: MainAxisSize.max,
//                                                                mainAxisAlignment: MainAxisAlignment.start,
//                                                                crossAxisAlignment: CrossAxisAlignment.center,
//                                                                children: <Widget>[
//                                                                  RawMaterialButton(
//                                                                    onPressed: () {},
//                                                                    elevation: 2.0,
//                                                                    fillColor: accent,
//                                                                    child: Image.asset(placeholder,width: 30,height: 30,),//,backgroundColor: Colors.green,
//                                                                    padding: EdgeInsets.all(10.0),
//                                                                    shape: CircleBorder(side: BorderSide(color: accent)),
//                                                                  ),
//                                                                  Container(
//                                                                      padding: EdgeInsets.fromLTRB(5,5,5,0),alignment: Alignment.center, width:100,
//                                                                      child: Text('Aspiring Managers', style: dark10Style,softWrap: true,textAlign: TextAlign.center,)
//                                                                  ),
//
//                                                                ]),
//                                                            Column(
//                                                                mainAxisSize: MainAxisSize.max,
//                                                                mainAxisAlignment: MainAxisAlignment.start,
//                                                                crossAxisAlignment: CrossAxisAlignment.center,
//                                                                children: <Widget>[
//                                                                  RawMaterialButton(
//                                                                    onPressed: () {},
//                                                                    elevation: 2.0,
//                                                                    fillColor: accent,
//                                                                    child: Image.asset(placeholder,width: 30,height: 30,),//,backgroundColor: Colors.green,
//                                                                    padding: EdgeInsets.all(10.0),
//                                                                    shape: CircleBorder(side: BorderSide(color: accent)),
//                                                                  ),
//                                                                  Container(
//                                                                      padding: EdgeInsets.fromLTRB(5,5,5,0),alignment: Alignment.center, width:100,
//                                                                      child: Text('Aspiring Investors', style: dark10Style,softWrap: true,textAlign: TextAlign.center,)
//                                                                  ),
//
//                                                                ]),
//                                                            Column(
//                                                                mainAxisSize: MainAxisSize.max,
//                                                                mainAxisAlignment: MainAxisAlignment.start,
//                                                                crossAxisAlignment: CrossAxisAlignment.center,
//                                                                children: <Widget>[
//                                                                  RawMaterialButton(
//                                                                    onPressed: () {},
//                                                                    elevation: 2.0,
//                                                                    fillColor: accent,
//                                                                    child: Image.asset(placeholder,width: 30,height: 30,),//,backgroundColor: Colors.green,
//                                                                    padding: EdgeInsets.all(10.0),
//                                                                    shape: CircleBorder(side: BorderSide(color: accent)),
//                                                                  ),
//                                                                  Container(
//                                                                      padding: EdgeInsets.fromLTRB(5,5,5,0),alignment: Alignment.center, width:100,
//                                                                      child: Text('Aspiring Accountant', style: dark10Style,softWrap: true,textAlign: TextAlign.center,)
//                                                                  ),
//
//                                                                ]),
//                                                          ],
//                                                        ),
//                                                        Row(
//                                                          children: <Widget>[
//                                                            Column(
//                                                                mainAxisSize: MainAxisSize.max,
//                                                                mainAxisAlignment: MainAxisAlignment.start,
//                                                                crossAxisAlignment: CrossAxisAlignment.center,
//                                                                children: <Widget>[
//                                                                  RawMaterialButton(
//                                                                    onPressed: () {},
//                                                                    elevation: 2.0,
//                                                                    fillColor: accent,
//                                                                    child: Image.asset(placeholder,width: 30,height: 30,),//,backgroundColor: Colors.green,
//                                                                    padding: EdgeInsets.all(10.0),
//                                                                    shape: CircleBorder(side: BorderSide(color: accent)),
//                                                                  ),
//                                                                  Container(
//                                                                      padding: EdgeInsets.fromLTRB(5,5,5,0),alignment: Alignment.center, width:100,
//                                                                      child: Text('Advisory', style: dark10Style,softWrap: true,textAlign: TextAlign.center,)
//                                                                  ),
//
//                                                                ]),
//                                                            Column(
//                                                                mainAxisSize: MainAxisSize.max,
//                                                                mainAxisAlignment: MainAxisAlignment.start,
//                                                                crossAxisAlignment: CrossAxisAlignment.center,
//                                                                children: <Widget>[
//                                                                  RawMaterialButton(
//                                                                    onPressed: () {},
//                                                                    elevation: 2.0,
//                                                                    fillColor: accent,
//                                                                    child: Image.asset(placeholder,width: 30,height: 30,),//,backgroundColor: Colors.green,
//                                                                    padding: EdgeInsets.all(10.0),
//                                                                    shape: CircleBorder(side: BorderSide(color: accent)),
//                                                                  ),
//                                                                  Container(
//                                                                      padding: EdgeInsets.fromLTRB(5,5,5,0),alignment: Alignment.center, width:100,
//                                                                      child: Text('Asset Management', style: dark10Style,softWrap: true,textAlign: TextAlign.center,)
//                                                                  ),
//
//                                                                ]),
//                                                            Column(
//                                                                mainAxisSize: MainAxisSize.max,
//                                                                mainAxisAlignment: MainAxisAlignment.start,
//                                                                crossAxisAlignment: CrossAxisAlignment.center,
//                                                                children: <Widget>[
//                                                                  RawMaterialButton(
//                                                                    onPressed: () {},
//                                                                    elevation: 2.0,
//                                                                    fillColor: accent,
//                                                                    child: Image.asset(placeholder,width: 30,height: 30,),//,backgroundColor: Colors.green,
//                                                                    padding: EdgeInsets.all(10.0),
//                                                                    shape: CircleBorder(side: BorderSide(color: accent)),
//                                                                  ),
//                                                                  Container(
//                                                                      padding: EdgeInsets.fromLTRB(5,5,5,0),alignment: Alignment.center, width:100,
//                                                                      child: Text('Capital Market', style: dark10Style,softWrap: true,textAlign: TextAlign.center,)
//                                                                  ),
//
//                                                                ]),
//                                                          ],
//                                                        ),
//                                                        Row(
//                                                          children: <Widget>[
//                                                            Column(
//                                                                mainAxisSize: MainAxisSize.max,
//                                                                mainAxisAlignment: MainAxisAlignment.start,
//                                                                crossAxisAlignment: CrossAxisAlignment.center,
//                                                                children: <Widget>[
//                                                                  RawMaterialButton(
//                                                                    onPressed: () {},
//                                                                    elevation: 2.0,
//                                                                    fillColor: accent,
//                                                                    child: Image.asset(placeholder,width: 30,height: 30,),//,backgroundColor: Colors.green,
//                                                                    padding: EdgeInsets.all(10.0),
//                                                                    shape: CircleBorder(side: BorderSide(color: accent)),
//                                                                  ),
//                                                                  Container(
//                                                                      padding: EdgeInsets.fromLTRB(5,5,5,0),alignment: Alignment.center, width:100,
//                                                                      child: Text('Advisory', style: dark10Style,softWrap: true,textAlign: TextAlign.center,)
//                                                                  ),
//
//                                                                ]),
//                                                            Column(
//                                                                mainAxisSize: MainAxisSize.max,
//                                                                mainAxisAlignment: MainAxisAlignment.start,
//                                                                crossAxisAlignment: CrossAxisAlignment.center,
//                                                                children: <Widget>[
//                                                                  RawMaterialButton(
//                                                                    onPressed: () {},
//                                                                    elevation: 2.0,
//                                                                    fillColor: accent,
//                                                                    child: Image.asset(placeholder,width: 30,height: 30,),//,backgroundColor: Colors.green,
//                                                                    padding: EdgeInsets.all(10.0),
//                                                                    shape: CircleBorder(side: BorderSide(color: accent)),
//                                                                  ),
//                                                                  Container(
//                                                                      padding: EdgeInsets.fromLTRB(5,5,5,0),alignment: Alignment.center, width:100,
//                                                                      child: Text('Asset Management', style: dark10Style,softWrap: true,textAlign: TextAlign.center,)
//                                                                  ),
//
//                                                                ]),
//                                                            Column(
//                                                                mainAxisSize: MainAxisSize.max,
//                                                                mainAxisAlignment: MainAxisAlignment.start,
//                                                                crossAxisAlignment: CrossAxisAlignment.center,
//                                                                children: <Widget>[
//                                                                  RawMaterialButton(
//                                                                    onPressed: () {},
//                                                                    elevation: 2.0,
//                                                                    fillColor: accent,
//                                                                    child: Image.asset(placeholder,width: 30,height: 30,),//,backgroundColor: Colors.green,
//                                                                    padding: EdgeInsets.all(10.0),
//                                                                    shape: CircleBorder(side: BorderSide(color: accent)),
//                                                                  ),
//                                                                  Container(
//                                                                      padding: EdgeInsets.fromLTRB(5,5,5,0),alignment: Alignment.center, width:100,
//                                                                      child: Text('Trading & Brokerage', style: dark10Style,softWrap: true,textAlign: TextAlign.center,)
//                                                                  ),
//
//                                                                ]),
//                                                          ],
//                                                        ),
//                                                      ],
//                                                    ),
//                                                  ),
                                                ],
                                              ),
                                            )
                                        );
                                      },
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 20,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.479,
                          padding: EdgeInsets.fromLTRB(10,5,10,10),
                          alignment: Alignment.topLeft,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.fromLTRB(10,10,10,0),alignment: Alignment.topLeft,
                                child: Text('Trending in our community', style: blue14Style,),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(10,5,10,10),alignment: Alignment.topLeft,
                                child: Text('what\'s going on?', style: dark10Style,),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height * 0.35,
                                width: MediaQuery.of(context).size.width * 0.7,
                                padding: EdgeInsets.fromLTRB(0,10,0,10),
                                alignment: Alignment.topLeft, color: projectLightBlue,
                                child: ListView(
                                  scrollDirection: Axis.vertical,
                                  children: <Widget>[
                                    Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          RawMaterialButton(
                                            onPressed: () {},
                                            elevation: 2.0,
                                            fillColor: accent,
                                            child: Image.asset(placeholder,width: 30,height: 30,),//,backgroundColor: Colors.green,
                                            padding: EdgeInsets.all(10.0),
                                            shape: CircleBorder(side: BorderSide(color: accent)),
                                          ),
                                          Container(
                                            padding: EdgeInsets.fromLTRB(5,5,5,0),alignment: Alignment.topLeft,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                  width: MediaQuery.of(context).size.width * 0.3,
                                                  height: MediaQuery.of(context).size.height * 0.03,
                                                  child: Text('#Auditing', style: dark10BoldStyle,softWrap: true,textAlign: TextAlign.start,),
                                                ),
                                                Container(
                                                    width: MediaQuery.of(context).size.width * 0.4,
                                                    child: Text('Brief Introduction into Account Auditing', style: dark10Style,softWrap: true,textAlign: TextAlign.start,)
                                                ),
                                              ],
                                            ),
                                          ),
                                        ]),
                                    Container(
                                      height: 20,
                                    ),
                                    Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          RawMaterialButton(
                                            onPressed: () {},
                                            elevation: 2.0,
                                            fillColor: accent,
                                            child: Image.asset(placeholder,width: 30,height: 30,),//,backgroundColor: Colors.green,
                                            padding: EdgeInsets.all(10.0),
                                            shape: CircleBorder(side: BorderSide(color: accent)),
                                          ),
                                          Container(
                                            padding: EdgeInsets.fromLTRB(5,5,5,0),alignment: Alignment.topLeft,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                  width: MediaQuery.of(context).size.width * 0.3,
                                                  height: MediaQuery.of(context).size.height * 0.03,
                                                  child: Text('#Auditing', style: dark10BoldStyle,softWrap: true,textAlign: TextAlign.start,),
                                                ),
                                                Container(
                                                    width: MediaQuery.of(context).size.width * 0.4,
                                                    child: Text('Brief Introduction into Account Auditing', style: dark10Style,softWrap: true,textAlign: TextAlign.start,)
                                                ),
                                              ],
                                            ),
                                          ),
                                        ]),
                                    Container(
                                      height: 20,
                                    ),
                                    Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          RawMaterialButton(
                                            onPressed: () {},
                                            elevation: 2.0,
                                            fillColor: accent,
                                            child: Image.asset(placeholder,width: 30,height: 30,),//,backgroundColor: Colors.green,
                                            padding: EdgeInsets.all(10.0),
                                            shape: CircleBorder(side: BorderSide(color: accent)),
                                          ),
                                          Container(
                                            padding: EdgeInsets.fromLTRB(5,5,5,0),alignment: Alignment.topLeft,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                  width: MediaQuery.of(context).size.width * 0.3,
                                                  height: MediaQuery.of(context).size.height * 0.03,
                                                  child: Text('#Auditing', style: dark10BoldStyle,softWrap: true,textAlign: TextAlign.start,),
                                                ),
                                                Container(
                                                    width: MediaQuery.of(context).size.width * 0.4,
                                                    child: Text('Brief Introduction into Account Auditing', style: dark10Style,softWrap: true,textAlign: TextAlign.start,)
                                                ),
                                              ],
                                            ),
                                          ),
                                        ]),
                                    Container(
                                      height: 20,
                                    ),
                                    Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          RawMaterialButton(
                                            onPressed: () {},
                                            elevation: 2.0,
                                            fillColor: accent,
                                            child: Image.asset(placeholder,width: 30,height: 30,),//,backgroundColor: Colors.green,
                                            padding: EdgeInsets.all(10.0),
                                            shape: CircleBorder(side: BorderSide(color: accent)),
                                          ),
                                          Container(
                                            padding: EdgeInsets.fromLTRB(5,5,5,0),alignment: Alignment.topLeft,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                  width: MediaQuery.of(context).size.width * 0.3,
                                                  height: MediaQuery.of(context).size.height * 0.03,
                                                  child: Text('#Auditing', style: dark10BoldStyle,softWrap: true,textAlign: TextAlign.start,),
                                                ),
                                                Container(
                                                    width: MediaQuery.of(context).size.width * 0.4,
                                                    child: Text('Brief Introduction into Account Auditing', style: dark10Style,softWrap: true,textAlign: TextAlign.start,)
                                                ),
                                              ],
                                            ),
                                          ),
                                        ]),
                                    Container(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(10,0,10,0),
                                alignment: Alignment.centerRight,
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: Text('View more', style: green12Style,),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 20,
                        ),
                        Container(
                          height: 100,
                        ),
                      ],
                    ),

                  );
                },
                childCount: 1,
              ),
            ),
          ],
        ),

        //header

      ],
    );
  }

}

class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({@required Color color, @required double radius})
      : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([onChanged]) => _painter;
}


class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
    ..color = color
    ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset =
        offset + Offset(cfg.size.width / 2, cfg.size.height - radius - 5);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}