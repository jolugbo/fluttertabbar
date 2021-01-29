//

//               OLUFEMI         ADETOLA             <bold!>JOLUGBO<bold!>

//
import 'package:animations/animations.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:project_x/utills/pagetransitionutill.dart';
import 'package:project_x/utills/styles.dart';

import '../dashboard.dart';

class learn extends StatefulWidget {
  learn({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LearnPageState createState() => _LearnPageState();
}

class _LearnPageState extends State<learn>
    with TickerProviderStateMixin {
  String placeholder = 'assets/ph.jpg';
  String bgMain = 'assets/bg.png';
  String advisory = 'assets/advisory.png';
  String assetManagement = 'assets/assetManagement.png';
  String capitalMarket = 'assets/capitalMarket.png';
  String trading = 'assets/trading.jpg';
  bool showBreakDown = false;
  bool showdashboard = true;
  bool showinvestment = false;
  bool showtopup = false;
  bool showwallet = false;
  bool showmore = false;
  ContainerTransitionType _transitionType = ContainerTransitionType.fade;
  double lowerDashElementPosition = 0.33;
  int _currentIndex = 0;
  Icon dropDown = Icon(Icons.remove_red_eye,color: accent,);
  @override
  State<StatefulWidget> initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Navigator(
      // Adding [ValueKey] to make sure that the widget gets rebuilt when// changing type.
      key: ValueKey(_transitionType),
      onGenerateRoute: (settings) {
        return MaterialPageRoute<void>(builder: (context) =>
            Stack(
              overflow: Overflow.visible,
              children: <Widget>[

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
                                Card(
                                  elevation: 2,
                                  color: projectLightGray2,
                                  shape: cardShape,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.95,
                                    //height: MediaQuery.of(context).size.height * 0.26,
                                    alignment: Alignment.topLeft, padding: EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.fromLTRB(10,10,10,0),alignment: Alignment.topLeft,
                                          child: Text('Become an Investment Banking Expert', style: blue14Style,),
                                        ),
                                        Container(
                                            padding: EdgeInsets.fromLTRB(10,5,10,10),alignment: Alignment.topLeft,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('Learn at your own pace', style: dark10Style,),
                                                Text('View more', style: green12Style,)
                                              ],
                                            )
                                        ),
                                        Container(
                                          child: CarouselSlider(
                                            options: CarouselOptions(
                                              height: MediaQuery.of(context).size.height * 0.12,
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
                                                    //width: MediaQuery.of(context).size.width * 0.8,
                                                    padding: EdgeInsets.fromLTRB(10,0,10,0),
                                                    alignment: Alignment.center,color: accent,
                                                    child: ListView(
                                                      scrollDirection: Axis.horizontal,
                                                      children: <Widget>[
                                                        OpenContainer<bool>(
                                                          transitionType: _transitionType,
                                                          openBuilder: (context, openContainer) => const _DetailsCard(id: 'Asset Management',),
                                                          tappable: false,
                                                          closedShape: const RoundedRectangleBorder(),
                                                          closedElevation: 0,
                                                          closedBuilder: (context, openContainer) {
                                                            return Column(
                                                                mainAxisSize: MainAxisSize.max,
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: <Widget>[
                                                                  RawMaterialButton(
                                                                    onPressed: openContainer,
                                                                    elevation: 2.0,
                                                                    fillColor: projectGray2,
                                                                    child: Image.asset(advisory,width: 30,height: 30,),
                                                                    padding: EdgeInsets.all(10.0),
                                                                    shape: CircleBorder(side: BorderSide(color: projectGray2)),
                                                                  ),
                                                                  Container(
                                                                      padding: EdgeInsets.fromLTRB(5,5,5,0),alignment: Alignment.center, width:120,
                                                                      child: Text('Advisory', style: dark12Style,softWrap: true,textAlign: TextAlign.center,)
                                                                  ),
                                                                ]);
                                                          },
                                                        ),
                                                        OpenContainer<bool>(
                                                          transitionType: _transitionType,
                                                          openBuilder: (context, openContainer) =>const _DetailsCard(),
                                                          tappable: false,
                                                          closedShape: const RoundedRectangleBorder(),
                                                          closedElevation: 0,
                                                          closedBuilder: (context, openContainer) {
                                                            return Column(
                                                                mainAxisSize: MainAxisSize.max,
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: <Widget>[
                                                                  RawMaterialButton(
                                                                    onPressed: openContainer,
                                                                    elevation: 2.0,
                                                                    fillColor: projectGray2,
                                                                    child: Image.asset(assetManagement,width: 30,height: 30,),
                                                                    padding: EdgeInsets.all(10.0),
                                                                    shape: CircleBorder(side: BorderSide(color: projectGray2)),
                                                                  ),
                                                                  Container(
                                                                      padding: EdgeInsets.fromLTRB(5,5,5,0),alignment: Alignment.center, width:120,
                                                                      child: Text('Asset Management', style: dark12Style,softWrap: true,textAlign: TextAlign.center,)
                                                                  ),
                                                                ]);
                                                          },
                                                        ),
                                                        OpenContainer<bool>(
                                                          transitionType: _transitionType,
                                                          openBuilder: (context, openContainer) =>const _DetailsCard(),
                                                          tappable: false,
                                                          closedShape: const RoundedRectangleBorder(),
                                                          closedElevation: 0,
                                                          closedBuilder: (context, openContainer) {
                                                            return Column(
                                                                mainAxisSize: MainAxisSize.max,
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: <Widget>[
                                                                  RawMaterialButton(
                                                                    onPressed: openContainer,
                                                                    elevation: 2.0,
                                                                    fillColor: projectGray2,
                                                                    child: Image.asset(capitalMarket,width: 30,),//,backgroundColor: Colors.green,
                                                                    padding: EdgeInsets.all(10.0),
                                                                    shape: CircleBorder(side: BorderSide(color: projectGray2)),
                                                                  ),
                                                                  Container(
                                                                      padding: EdgeInsets.fromLTRB(5,5,5,0),alignment: Alignment.center, width:120,
                                                                      child: Text('Capital Market', style: dark12Style,softWrap: true,textAlign: TextAlign.center,)
                                                                  ),
                                                                ]);
                                                          },
                                                        ),
                                                        OpenContainer<bool>(
                                                          transitionType: _transitionType,
                                                          openBuilder: (context, openContainer) =>const _DetailsCard(),
                                                          tappable: false,
                                                          closedShape: const RoundedRectangleBorder(),
                                                          closedElevation: 0,
                                                          closedBuilder: (context, openContainer) {
                                                            return Column(
                                                                mainAxisSize: MainAxisSize.max,
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: <Widget>[
                                                                  RawMaterialButton(
                                                                    onPressed: openContainer,
                                                                    elevation: 2.0,
                                                                    fillColor: projectGray2,
                                                                    child: Image.asset(trading,width: 30,),//,backgroundColor: Colors.green,
                                                                    padding: EdgeInsets.all(10.0),
                                                                    shape: CircleBorder(side: BorderSide(color: projectGray2)),
                                                                  ),
                                                                  Container(
                                                                      padding: EdgeInsets.fromLTRB(5,5,5,0),alignment: Alignment.center, width:120,
                                                                      child: Text('Trading', style: dark12Style,softWrap: true,textAlign: TextAlign.center,)
                                                                  ),
                                                                ]);
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 30,
                                ),
                                Card(
                                  elevation: 2,
                                  color: projectLightGray2,
                                  shape: cardShape,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.95,
                                    //height: MediaQuery.of(context).size.height * 0.26,
                                    alignment: Alignment.topLeft, padding: EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.fromLTRB(10,10,0,0),alignment: Alignment.topLeft,
                                          child: Text('Become an Expert in Corporate Governance ', style: blue14Style,),
                                        ),
                                        Container(
                                            padding: EdgeInsets.fromLTRB(10,5,10,10),alignment: Alignment.topLeft,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('Learn to govern companies', style: dark10Style,),
                                                Text('View more', style: green12Style,)
                                              ],
                                            )
                                        ),
                                        Container(
                                          child: CarouselSlider(
                                            options: CarouselOptions(
                                              height: MediaQuery.of(context).size.height * 0.12,
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
                                                    //width: MediaQuery.of(context).size.width * 0.8,
                                                    padding: EdgeInsets.fromLTRB(10,0,10,0),
                                                    alignment: Alignment.center,color: accent,
                                                    child: ListView(
                                                      scrollDirection: Axis.horizontal,
                                                      children: <Widget>[
                                                        OpenContainer<bool>(
                                                          transitionType: _transitionType,
                                                          openBuilder: (context, openContainer) =>const _DetailsCard(),
                                                          tappable: false,
                                                          closedShape: const RoundedRectangleBorder(),
                                                          closedElevation: 0,
                                                          closedBuilder: (context, openContainer) {
                                                            return Column(
                                                                mainAxisSize: MainAxisSize.max,
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: <Widget>[
                                                                  RawMaterialButton(
                                                                    onPressed: openContainer,
                                                                    elevation: 2.0,
                                                                    fillColor: projectGray2,
                                                                    child: Image.asset(advisory,width: 30,height: 30,),
                                                                    padding: EdgeInsets.all(10.0),
                                                                    shape: CircleBorder(side: BorderSide(color: projectGray2)),
                                                                  ),
                                                                  Container(
                                                                      padding: EdgeInsets.fromLTRB(5,5,5,0),alignment: Alignment.center, width:120,
                                                                      child: Text('Advisory', style: dark12Style,softWrap: true,textAlign: TextAlign.center,)
                                                                  ),
                                                                ]);
                                                          },
                                                        ),
                                                        OpenContainer<bool>(
                                                          transitionType: _transitionType,
                                                          openBuilder: (context, openContainer) =>const _DetailsCard(),
                                                          tappable: false,
                                                          closedShape: const RoundedRectangleBorder(),
                                                          closedElevation: 0,
                                                          closedBuilder: (context, openContainer) {
                                                            return Column(
                                                                mainAxisSize: MainAxisSize.max,
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: <Widget>[
                                                                  RawMaterialButton(
                                                                    onPressed: openContainer,
                                                                    elevation: 2.0,
                                                                    fillColor: projectGray2,
                                                                    child: Image.asset(assetManagement,width: 30,height: 30,),
                                                                    padding: EdgeInsets.all(10.0),
                                                                    shape: CircleBorder(side: BorderSide(color: projectGray2)),
                                                                  ),
                                                                  Container(
                                                                      padding: EdgeInsets.fromLTRB(5,5,5,0),alignment: Alignment.center, width:120,
                                                                      child: Text('Asset Management', style: dark12Style,softWrap: true,textAlign: TextAlign.center,)
                                                                  ),
                                                                ]);
                                                          },
                                                        ),
                                                        OpenContainer<bool>(
                                                          transitionType: _transitionType,
                                                          openBuilder: (context, openContainer) =>const _DetailsCard(),
                                                          tappable: false,
                                                          closedShape: const RoundedRectangleBorder(),
                                                          closedElevation: 0,
                                                          closedBuilder: (context, openContainer) {
                                                            return Column(
                                                                mainAxisSize: MainAxisSize.max,
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: <Widget>[
                                                                  RawMaterialButton(
                                                                    onPressed: openContainer,
                                                                    elevation: 2.0,
                                                                    fillColor: projectGray2,
                                                                    child: Image.asset(capitalMarket,width: 30,),//,backgroundColor: Colors.green,
                                                                    padding: EdgeInsets.all(10.0),
                                                                    shape: CircleBorder(side: BorderSide(color: projectGray2)),
                                                                  ),
                                                                  Container(
                                                                      padding: EdgeInsets.fromLTRB(5,5,5,0),alignment: Alignment.center, width:120,
                                                                      child: Text('Capital Market', style: dark12Style,softWrap: true,textAlign: TextAlign.center,)
                                                                  ),
                                                                ]);
                                                          },
                                                        ),
                                                        OpenContainer<bool>(
                                                          transitionType: _transitionType,
                                                          openBuilder: (context, openContainer) =>const _DetailsCard(),
                                                          tappable: false,
                                                          closedShape: const RoundedRectangleBorder(),
                                                          closedElevation: 0,
                                                          closedBuilder: (context, openContainer) {
                                                            return Column(
                                                                mainAxisSize: MainAxisSize.max,
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: <Widget>[
                                                                  RawMaterialButton(
                                                                    onPressed: openContainer,
                                                                    elevation: 2.0,
                                                                    fillColor: projectGray2,
                                                                    child: Image.asset(trading,width: 30,),//,backgroundColor: Colors.green,
                                                                    padding: EdgeInsets.all(10.0),
                                                                    shape: CircleBorder(side: BorderSide(color: projectGray2)),
                                                                  ),
                                                                  Container(
                                                                      padding: EdgeInsets.fromLTRB(5,5,5,0),alignment: Alignment.center, width:120,
                                                                      child: Text('Trading', style: dark12Style,softWrap: true,textAlign: TextAlign.center,)
                                                                  ),
                                                                ]);
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 30,
                                ),
                                Card(
                                  elevation: 2,
                                  color: projectLightGray2,
                                  shape: cardShape,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.95,
                                    //height: MediaQuery.of(context).size.height * 0.26,
                                    alignment: Alignment.topLeft, padding: EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.fromLTRB(10,10,10,0),alignment: Alignment.topLeft,
                                          child: Text('Obtain Knowledge of Accounting', style: blue14Style,),
                                        ),
                                        Container(
                                            padding: EdgeInsets.fromLTRB(10,5,10,10),alignment: Alignment.topLeft,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('Accounting simplified', style: dark10Style,),
                                                Text('View more', style: green12Style,)
                                              ],
                                            )
                                        ),
                                        Container(
                                          child: CarouselSlider(
                                            options: CarouselOptions(
                                              height: MediaQuery.of(context).size.height * 0.12,
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
                                                    //width: MediaQuery.of(context).size.width * 0.8,
                                                    padding: EdgeInsets.fromLTRB(10,0,10,0),
                                                    alignment: Alignment.center,color: accent,
                                                    child: ListView(
                                                      scrollDirection: Axis.horizontal,
                                                      children: <Widget>[
                                                        OpenContainer<bool>(
                                                          transitionType: _transitionType,
                                                          openBuilder: (context, openContainer) =>const _DetailsCard(),
                                                          tappable: false,
                                                          closedShape: const RoundedRectangleBorder(),
                                                          closedElevation: 0,
                                                          closedBuilder: (context, openContainer) {
                                                            return Column(
                                                                mainAxisSize: MainAxisSize.max,
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: <Widget>[
                                                                  RawMaterialButton(
                                                                    onPressed: openContainer,
                                                                    elevation: 2.0,
                                                                    fillColor: projectGray2,
                                                                    child: Image.asset(advisory,width: 30,height: 30,),
                                                                    padding: EdgeInsets.all(10.0),
                                                                    shape: CircleBorder(side: BorderSide(color: projectGray2)),
                                                                  ),
                                                                  Container(
                                                                      padding: EdgeInsets.fromLTRB(5,5,5,0),alignment: Alignment.center, width:120,
                                                                      child: Text('Advisory', style: dark12Style,softWrap: true,textAlign: TextAlign.center,)
                                                                  ),
                                                                ]);
                                                          },
                                                        ),
                                                        OpenContainer<bool>(
                                                          transitionType: _transitionType,
                                                          openBuilder: (context, openContainer) =>const _DetailsCard(),
                                                          tappable: false,
                                                          closedShape: const RoundedRectangleBorder(),
                                                          closedElevation: 0,
                                                          closedBuilder: (context, openContainer) {
                                                            return Column(
                                                                mainAxisSize: MainAxisSize.max,
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: <Widget>[
                                                                  RawMaterialButton(
                                                                    onPressed: openContainer,
                                                                    elevation: 2.0,
                                                                    fillColor: projectGray2,
                                                                    child: Image.asset(assetManagement,width: 30,height: 30,),
                                                                    padding: EdgeInsets.all(10.0),
                                                                    shape: CircleBorder(side: BorderSide(color: projectGray2)),
                                                                  ),
                                                                  Container(
                                                                      padding: EdgeInsets.fromLTRB(5,5,5,0),alignment: Alignment.center, width:120,
                                                                      child: Text('Asset Management', style: dark12Style,softWrap: true,textAlign: TextAlign.center,)
                                                                  ),
                                                                ]);
                                                          },
                                                        ),
                                                        OpenContainer<bool>(
                                                          transitionType: _transitionType,
                                                          openBuilder: (context, openContainer) =>const _DetailsCard(),
                                                          tappable: false,
                                                          closedShape: const RoundedRectangleBorder(),
                                                          closedElevation: 0,
                                                          closedBuilder: (context, openContainer) {
                                                            return Column(
                                                                mainAxisSize: MainAxisSize.max,
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: <Widget>[
                                                                  RawMaterialButton(
                                                                    onPressed: openContainer,
                                                                    elevation: 2.0,
                                                                    fillColor: projectGray2,
                                                                    child: Image.asset(capitalMarket,width: 30,),//,backgroundColor: Colors.green,
                                                                    padding: EdgeInsets.all(10.0),
                                                                    shape: CircleBorder(side: BorderSide(color: projectGray2)),
                                                                  ),
                                                                  Container(
                                                                      padding: EdgeInsets.fromLTRB(5,5,5,0),alignment: Alignment.center, width:120,
                                                                      child: Text('Capital Market', style: dark12Style,softWrap: true,textAlign: TextAlign.center,)
                                                                  ),
                                                                ]);
                                                          },
                                                        ),
                                                        OpenContainer<bool>(
                                                          transitionType: _transitionType,
                                                          openBuilder: (context, openContainer) =>const _DetailsCard(),
                                                          tappable: false,
                                                          closedShape: const RoundedRectangleBorder(),
                                                          closedElevation: 0,
                                                          closedBuilder: (context, openContainer) {
                                                            return Column(
                                                                mainAxisSize: MainAxisSize.max,
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: <Widget>[
                                                                  RawMaterialButton(
                                                                    onPressed: openContainer,
                                                                    elevation: 2.0,
                                                                    fillColor: projectGray2,
                                                                    child: Image.asset(trading,width: 30,),//,backgroundColor: Colors.green,
                                                                    padding: EdgeInsets.all(10.0),
                                                                    shape: CircleBorder(side: BorderSide(color: projectGray2)),
                                                                  ),
                                                                  Container(
                                                                      padding: EdgeInsets.fromLTRB(5,5,5,0),alignment: Alignment.center, width:120,
                                                                      child: Text('Trading', style: dark12Style,softWrap: true,textAlign: TextAlign.center,)
                                                                  ),
                                                                ]);
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 30,
                                ),
                                Card(
                                  elevation: 2,
                                  color: projectLightGray2,
                                  shape: cardShape,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.95,
                                    //height: MediaQuery.of(context).size.height * 0.26,
                                    alignment: Alignment.topLeft, padding: EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.fromLTRB(10,10,10,0),alignment: Alignment.topLeft,
                                          child: Text('Understanding Micro and Macro Economics', style: blue14Style,),
                                        ),
                                        Container(
                                            padding: EdgeInsets.fromLTRB(10,5,10,10),alignment: Alignment.topLeft,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('Learn effects of supply and demand', style: dark10Style,),
                                                Text('View more', style: green12Style,)
                                              ],
                                            )
                                        ),
                                        Container(
                                          child: CarouselSlider(
                                            options: CarouselOptions(
                                              height: MediaQuery.of(context).size.height * 0.12,
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
                                                    //width: MediaQuery.of(context).size.width * 0.8,
                                                    padding: EdgeInsets.fromLTRB(10,0,10,0),
                                                    alignment: Alignment.center,color: accent,
                                                    child:  ListView(
                                                      scrollDirection: Axis.horizontal,
                                                      children: <Widget>[
                                                        OpenContainer<bool>(
                                                          transitionType: _transitionType,
                                                          openBuilder: (context, openContainer) =>const _DetailsCard(),
                                                          tappable: false,
                                                          closedShape: const RoundedRectangleBorder(),
                                                          closedElevation: 0,
                                                          closedBuilder: (context, openContainer) {
                                                            return Column(
                                                                mainAxisSize: MainAxisSize.max,
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: <Widget>[
                                                                  RawMaterialButton(
                                                                    onPressed: openContainer,
                                                                    elevation: 2.0,
                                                                    fillColor: projectGray2,
                                                                    child: Image.asset(advisory,width: 30,height: 30,),
                                                                    padding: EdgeInsets.all(10.0),
                                                                    shape: CircleBorder(side: BorderSide(color: projectGray2)),
                                                                  ),
                                                                  Container(
                                                                      padding: EdgeInsets.fromLTRB(5,5,5,0),alignment: Alignment.center, width:120,
                                                                      child: Text('Advisory', style: dark12Style,softWrap: true,textAlign: TextAlign.center,)
                                                                  ),
                                                                ]);
                                                          },
                                                        ),
                                                        OpenContainer<bool>(
                                                          transitionType: _transitionType,
                                                          openBuilder: (context, openContainer) =>const _DetailsCard(),
                                                          tappable: false,
                                                          closedShape: const RoundedRectangleBorder(),
                                                          closedElevation: 0,
                                                          closedBuilder: (context, openContainer) {
                                                            return Column(
                                                                mainAxisSize: MainAxisSize.max,
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: <Widget>[
                                                                  RawMaterialButton(
                                                                    onPressed: openContainer,
                                                                    elevation: 2.0,
                                                                    fillColor: projectGray2,
                                                                    child: Image.asset(assetManagement,width: 30,height: 30,),
                                                                    padding: EdgeInsets.all(10.0),
                                                                    shape: CircleBorder(side: BorderSide(color: projectGray2)),
                                                                  ),
                                                                  Container(
                                                                      padding: EdgeInsets.fromLTRB(5,5,5,0),alignment: Alignment.center, width:120,
                                                                      child: Text('Asset Management', style: dark12Style,softWrap: true,textAlign: TextAlign.center,)
                                                                  ),
                                                                ]);
                                                          },
                                                        ),
                                                        OpenContainer<bool>(
                                                          transitionType: _transitionType,
                                                          openBuilder: (context, openContainer) =>const _DetailsCard(),
                                                          tappable: false,
                                                          closedShape: const RoundedRectangleBorder(),
                                                          closedElevation: 0,
                                                          closedBuilder: (context, openContainer) {
                                                            return Column(
                                                                mainAxisSize: MainAxisSize.max,
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: <Widget>[
                                                                  RawMaterialButton(
                                                                    onPressed: openContainer,
                                                                    elevation: 2.0,
                                                                    fillColor: projectGray2,
                                                                    child: Image.asset(capitalMarket,width: 30,),//,backgroundColor: Colors.green,
                                                                    padding: EdgeInsets.all(10.0),
                                                                    shape: CircleBorder(side: BorderSide(color: projectGray2)),
                                                                  ),
                                                                  Container(
                                                                      padding: EdgeInsets.fromLTRB(5,5,5,0),alignment: Alignment.center, width:120,
                                                                      child: Text('Capital Market', style: dark12Style,softWrap: true,textAlign: TextAlign.center,)
                                                                  ),
                                                                ]);
                                                          },
                                                        ),
                                                        OpenContainer<bool>(
                                                          transitionType: _transitionType,
                                                          openBuilder: (context, openContainer) =>const _DetailsCard(),
                                                          tappable: false,
                                                          closedShape: const RoundedRectangleBorder(),
                                                          closedElevation: 0,
                                                          closedBuilder: (context, openContainer) {
                                                            return Column(
                                                                mainAxisSize: MainAxisSize.max,
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: <Widget>[
                                                                  RawMaterialButton(
                                                                    onPressed: openContainer,
                                                                    elevation: 2.0,
                                                                    fillColor: projectGray2,
                                                                    child: Image.asset(trading,width: 30,),//,backgroundColor: Colors.green,
                                                                    padding: EdgeInsets.all(10.0),
                                                                    shape: CircleBorder(side: BorderSide(color: projectGray2)),
                                                                  ),
                                                                  Container(
                                                                      padding: EdgeInsets.fromLTRB(5,5,5,0),alignment: Alignment.center, width:120,
                                                                      child: Text('Trading', style: dark12Style,softWrap: true,textAlign: TextAlign.center,)
                                                                  ),
                                                                ]);
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
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
              ],
            )
        );
      },
    );

  }
}

class _DetailsCard extends StatelessWidget {
  const _DetailsCard({this.openContainer,this.id});
  final VoidCallback openContainer;
  final String id;

  @override
  Widget build(BuildContext context) {
    String bg = 'assets/graduatehat.png';
    String assetManagement = 'assets/assetManagement.png';

    return InkWellOverlay(
      openContainer: openContainer,
      height: 300,
      child:  Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          //bg
          AnimatedPositioned(
            top: 0,
            left: MediaQuery.of(context).size.width * 0.02,
            duration: Duration(seconds: 1),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: 2,
              color: projectGray,
            ),
          ),

          //bg
          AnimatedPositioned(
            top: 0,
            right: MediaQuery.of(context).size.width * 0.02,
            duration: Duration(seconds: 1),
            child: Container(
              height: MediaQuery.of(context).size.height,alignment: Alignment.centerRight,
              width: 2,
              color: projectGray,
            ),
          ),

          //dashboard lower
          CustomScrollView(

            slivers: <Widget>[
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return  Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height,
                      child:Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height,
                        child:ListView(
                          scrollDirection: Axis.vertical,
                          padding: EdgeInsets.all(0),
                          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                          children: <Widget>[
                            Container(
                                alignment: Alignment.centerLeft,
                                width: MediaQuery.of(context).size.width,
                                child:IconButton(
                                  icon: Icon(
                                    Icons.arrow_back,color: projectDark,
                                  ),
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height* 0.02,),
                            SizedBox(
                                width: MediaQuery.of(context).size.width ,
                                height: MediaQuery.of(context).size.height* 0.13,
                                child: Stack(
                                  children: [

                                    Positioned(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 0),
                                        child: Container(
                                            height: 3,
                                            width: MediaQuery.of(context).size.width,
                                            color: projectOrange),
                                      ),
                                      top: MediaQuery.of(context).size.height* 0.06,),

                                    Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width,
                                      child: Card(
                                        elevation: 5,
                                        color: accent,shadowColor: projectOrange,
                                        shape: cardShape,
                                        // margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.05,0,MediaQuery.of(context).size.width * 0.05,0),
                                        child: Container(
                                          width: MediaQuery.of(context).size.width * 0.8,
                                          //height: MediaQuery.of(context).size.height * 0.26,
                                          alignment: Alignment.topCenter, padding: EdgeInsets.fromLTRB(5,2,5,2),
                                          child: FlatButton(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Container(
                                                    alignment: Alignment.center,
                                                    width: MediaQuery.of(context).size.width * 0.15,
                                                    child: RawMaterialButton(
                                                      elevation: 2.0,
                                                      fillColor: projectOrange,
                                                      child: Image.asset(assetManagement,width: 30,height: 30,),
                                                      padding: EdgeInsets.all(10.0),
                                                      shape: CircleBorder(side: BorderSide(color: projectGray2)),
                                                    )
                                                ),
                                                Container(
                                                    padding: EdgeInsets.fromLTRB(10,0,10,0),alignment: Alignment.topLeft,
                                                    width: MediaQuery.of(context).size.width * 0.6,
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                            padding: EdgeInsets.fromLTRB(10,10,0,0),alignment: Alignment.topLeft,
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Text('Introduction', style: dark16BoldStyle,),
                                                                Icon(Icons.lock_open_rounded,color: projectGreen,)
                                                              ],
                                                            )
                                                        ),
                                                        Container(
                                                          padding: EdgeInsets.fromLTRB(10,5,10,10),alignment: Alignment.topLeft,
                                                          child: Text('Understanding the general Overview of Asset Management', style: dark14Style,),
                                                        ),
                                                        Container(
                                                            padding: EdgeInsets.fromLTRB(10,5,10,5),alignment: Alignment.topLeft,
                                                            child: Row(
                                                              children: [
                                                                Text('4/10', style: orange14Style,),
                                                                LinearPercentIndicator(
                                                                  width: MediaQuery.of(context).size.width * 0.4,
                                                                  lineHeight: 10.0,
                                                                  percent: 0.4,
                                                                  backgroundColor: Colors.grey,
                                                                  progressColor: projectOrange,
                                                                ),
                                                              ],
                                                            )
                                                        ),
                                                      ],
                                                    )
                                                ),
                                              ],
                                            ),
                                              padding: EdgeInsets.zero,
                                              onPressed: (){
                                                Navigator.pushNamed(context, '/deepest_learning');
                                              },
                                          )
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                            ),

                            SizedBox(height: MediaQuery.of(context).size.height* 0.02,),
                            SizedBox(
                                width: MediaQuery.of(context).size.width ,
                                height: MediaQuery.of(context).size.height* 0.13,
                                child: Stack(
                                  children: [

                                    Positioned(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 0),
                                        child: Container(
                                            height: 3,
                                            width: MediaQuery.of(context).size.width,
                                            color: projectGray),
                                      ),
                                      top: MediaQuery.of(context).size.height* 0.06,),

                                    Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width,
                                      child: Card(
                                        elevation: 5,
                                        color: accent,shadowColor: projectGray,
                                        child: Container(
                                          width: MediaQuery.of(context).size.width * 0.8,
                                          //height: MediaQuery.of(context).size.height * 0.26,
                                          alignment: Alignment.topCenter, padding: EdgeInsets.fromLTRB(5,2,5,2),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                  alignment: Alignment.center,
                                                  width: MediaQuery.of(context).size.width * 0.15,
                                                  child: RawMaterialButton(
                                                    elevation: 2.0,
                                                    fillColor: projectGray2,
                                                    child: Image.asset(assetManagement,width: 30,height: 30,),
                                                    padding: EdgeInsets.all(10.0),
                                                    shape: CircleBorder(side: BorderSide(color: projectGray2)),
                                                  )
                                              ),
                                              Container(
                                                  padding: EdgeInsets.fromLTRB(10,0,10,0),alignment: Alignment.topLeft,
                                                  width: MediaQuery.of(context).size.width * 0.6,
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        padding: EdgeInsets.fromLTRB(10,10,0,0),alignment: Alignment.topLeft,
                                                        child:  Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text('Introduction', style: dark16BoldStyle,),
                                                            Icon(Icons.lock_outline_rounded,color: projectRed,)
                                                          ],
                                                        )
                                                      ),
                                                      Container(
                                                        padding: EdgeInsets.fromLTRB(10,5,10,10),alignment: Alignment.topLeft,
                                                        child: Text('Understanding the general Overview of Asset Management', style: dark14Style,),
                                                      ),
                                                      Container(
                                                          padding: EdgeInsets.fromLTRB(10,5,10,5),alignment: Alignment.topLeft,
                                                          child: Row(
                                                            children: [
                                                              Text('0/10', style: orange14Style,),
                                                              LinearPercentIndicator(
                                                                width: MediaQuery.of(context).size.width * 0.4,
                                                                lineHeight: 10.0,
                                                                percent: 0,
                                                                backgroundColor: Colors.grey,
                                                                progressColor: projectOrange,
                                                              ),
                                                            ],
                                                          )
                                                      ),
                                                    ],
                                                  )
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                            ),

                            SizedBox(height: MediaQuery.of(context).size.height* 0.02,),
                            SizedBox(
                                width: MediaQuery.of(context).size.width ,
                                height: MediaQuery.of(context).size.height* 0.13,
                                child: Stack(
                                  children: [

                                    Positioned(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 0),
                                        child: Container(
                                            height: 3,
                                            width: MediaQuery.of(context).size.width,
                                            color: projectGray),
                                      ),
                                      top: MediaQuery.of(context).size.height* 0.06,),

                                    Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width,
                                      child: Card(
                                        elevation: 5,
                                        color: accent,shadowColor: projectGray,
                                        child: Container(
                                          width: MediaQuery.of(context).size.width * 0.8,
                                          //height: MediaQuery.of(context).size.height * 0.26,
                                          alignment: Alignment.topCenter, padding: EdgeInsets.fromLTRB(5,2,5,2),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                  alignment: Alignment.center,
                                                  width: MediaQuery.of(context).size.width * 0.15,
                                                  child: RawMaterialButton(
                                                    elevation: 2.0,
                                                    fillColor: projectGray2,
                                                    child: Image.asset(assetManagement,width: 30,height: 30,),
                                                    padding: EdgeInsets.all(10.0),
                                                    shape: CircleBorder(side: BorderSide(color: projectGray2)),
                                                  )
                                              ),
                                              Container(
                                                  padding: EdgeInsets.fromLTRB(10,0,10,0),alignment: Alignment.topLeft,
                                                  width: MediaQuery.of(context).size.width * 0.6,
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                          padding: EdgeInsets.fromLTRB(10,10,0,0),alignment: Alignment.topLeft,
                                                          child:  Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Text('Introduction', style: dark16BoldStyle,),
                                                              Icon(Icons.lock_outline_rounded,color: projectRed,)
                                                            ],
                                                          )
                                                      ),
                                                      Container(
                                                        padding: EdgeInsets.fromLTRB(10,5,10,10),alignment: Alignment.topLeft,
                                                        child: Text('Understanding the general Overview of Asset Management', style: dark14Style,),
                                                      ),
                                                      Container(
                                                          padding: EdgeInsets.fromLTRB(10,5,10,5),alignment: Alignment.topLeft,
                                                          child: Row(
                                                            children: [
                                                              Text('0/10', style: orange14Style,),
                                                              LinearPercentIndicator(
                                                                width: MediaQuery.of(context).size.width * 0.4,
                                                                lineHeight: 10.0,
                                                                percent: 0,
                                                                backgroundColor: Colors.grey,
                                                                progressColor: projectOrange,
                                                              ),
                                                            ],
                                                          )
                                                      ),
                                                    ],
                                                  )
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                            ),

                            SizedBox(height: MediaQuery.of(context).size.height* 0.02,),
                            SizedBox(
                                width: MediaQuery.of(context).size.width ,
                                height: MediaQuery.of(context).size.height* 0.13,
                                child: Stack(
                                  children: [

                                    Positioned(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 0),
                                        child: Container(
                                            height: 3,
                                            width: MediaQuery.of(context).size.width,
                                            color: projectGray),
                                      ),
                                      top: MediaQuery.of(context).size.height* 0.06,),

                                    Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width,
                                      child: Card(
                                        elevation: 5,
                                        color: accent,shadowColor: projectGray,
                                        child: Container(
                                          width: MediaQuery.of(context).size.width * 0.8,
                                          //height: MediaQuery.of(context).size.height * 0.26,
                                          alignment: Alignment.topCenter, padding: EdgeInsets.fromLTRB(5,2,5,2),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                  alignment: Alignment.center,
                                                  width: MediaQuery.of(context).size.width * 0.15,
                                                  child: RawMaterialButton(
                                                    elevation: 2.0,
                                                    fillColor: projectGray2,
                                                    child: Image.asset(assetManagement,width: 30,height: 30,),
                                                    padding: EdgeInsets.all(10.0),
                                                    shape: CircleBorder(side: BorderSide(color: projectGray2)),
                                                  )
                                              ),
                                              Container(
                                                  padding: EdgeInsets.fromLTRB(10,0,10,0),alignment: Alignment.topLeft,
                                                  width: MediaQuery.of(context).size.width * 0.6,
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                          padding: EdgeInsets.fromLTRB(10,10,0,0),alignment: Alignment.topLeft,
                                                          child:  Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Text('Introduction', style: dark16BoldStyle,),
                                                              Icon(Icons.lock_outline_rounded,color: projectRed,)
                                                            ],
                                                          )
                                                      ),
                                                      Container(
                                                        padding: EdgeInsets.fromLTRB(10,5,10,10),alignment: Alignment.topLeft,
                                                        child: Text('Understanding the general Overview of Asset Management', style: dark14Style,),
                                                      ),
                                                      Container(
                                                          padding: EdgeInsets.fromLTRB(10,5,10,5),alignment: Alignment.topLeft,
                                                          child: Row(
                                                            children: [
                                                              Text('0/10', style: orange14Style,),
                                                              LinearPercentIndicator(
                                                                width: MediaQuery.of(context).size.width * 0.4,
                                                                lineHeight: 10.0,
                                                                percent: 0,
                                                                backgroundColor: Colors.grey,
                                                                progressColor: projectOrange,
                                                              ),
                                                            ],
                                                          )
                                                      ),
                                                    ],
                                                  )
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                            ),

                            SizedBox(height: MediaQuery.of(context).size.height* 0.02,),
                            SizedBox(
                                width: MediaQuery.of(context).size.width ,
                                height: MediaQuery.of(context).size.height* 0.13,
                                child: Stack(
                                  children: [

                                    Positioned(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 0),
                                        child: Container(
                                            height: 3,
                                            width: MediaQuery.of(context).size.width,
                                            color: projectGray),
                                      ),
                                      top: MediaQuery.of(context).size.height* 0.06,),

                                    Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width,
                                      child: Card(
                                        elevation: 5,
                                        color: accent,shadowColor: projectGray,
                                        child: Container(
                                          width: MediaQuery.of(context).size.width * 0.8,
                                          //height: MediaQuery.of(context).size.height * 0.26,
                                          alignment: Alignment.topCenter, padding: EdgeInsets.fromLTRB(5,2,5,2),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                  alignment: Alignment.center,
                                                  width: MediaQuery.of(context).size.width * 0.15,
                                                  child: RawMaterialButton(
                                                    elevation: 2.0,
                                                    fillColor: projectGray2,
                                                    child: Image.asset(assetManagement,width: 30,height: 30,),
                                                    padding: EdgeInsets.all(10.0),
                                                    shape: CircleBorder(side: BorderSide(color: projectGray2)),
                                                  )
                                              ),
                                              Container(
                                                  padding: EdgeInsets.fromLTRB(10,0,10,0),alignment: Alignment.topLeft,
                                                  width: MediaQuery.of(context).size.width * 0.6,
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                          padding: EdgeInsets.fromLTRB(10,10,0,0),alignment: Alignment.topLeft,
                                                          child:  Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Text('Introduction', style: dark16BoldStyle,),
                                                              Icon(Icons.lock_outline_rounded,color: projectRed,)
                                                            ],
                                                          )
                                                      ),
                                                      Container(
                                                        padding: EdgeInsets.fromLTRB(10,5,10,10),alignment: Alignment.topLeft,
                                                        child: Text('Understanding the general Overview of Asset Management', style: dark14Style,),
                                                      ),
                                                      Container(
                                                          padding: EdgeInsets.fromLTRB(10,5,10,5),alignment: Alignment.topLeft,
                                                          child: Row(
                                                            children: [
                                                              Text('0/10', style: orange14Style,),
                                                              LinearPercentIndicator(
                                                                width: MediaQuery.of(context).size.width * 0.4,
                                                                lineHeight: 10.0,
                                                                percent: 0,
                                                                backgroundColor: Colors.grey,
                                                                progressColor: projectOrange,
                                                              ),
                                                            ],
                                                          )
                                                      ),
                                                    ],
                                                  )
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                            ),

                            SizedBox(height: MediaQuery.of(context).size.height* 0.02,),
                            SizedBox(
                                width: MediaQuery.of(context).size.width ,
                                height: MediaQuery.of(context).size.height* 0.13,
                                child: Stack(
                                  children: [

                                    Positioned(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 0),
                                        child: Container(
                                            height: 3,
                                            width: MediaQuery.of(context).size.width,
                                            color: projectGray),
                                      ),
                                      top: MediaQuery.of(context).size.height* 0.06,),

                                    Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width,
                                      child: Card(
                                        elevation: 5,
                                        color: accent,shadowColor: projectGray,
                                        child: Container(
                                          width: MediaQuery.of(context).size.width * 0.8,
                                          //height: MediaQuery.of(context).size.height * 0.26,
                                          alignment: Alignment.topCenter, padding: EdgeInsets.fromLTRB(5,2,5,2),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                  alignment: Alignment.center,
                                                  width: MediaQuery.of(context).size.width * 0.15,
                                                  child: RawMaterialButton(
                                                    elevation: 2.0,
                                                    fillColor: projectGray2,
                                                    child: Image.asset(assetManagement,width: 30,height: 30,),
                                                    padding: EdgeInsets.all(10.0),
                                                    shape: CircleBorder(side: BorderSide(color: projectGray2)),
                                                  )
                                              ),
                                              Container(
                                                  padding: EdgeInsets.fromLTRB(10,0,10,0),alignment: Alignment.topLeft,
                                                  width: MediaQuery.of(context).size.width * 0.6,
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                          padding: EdgeInsets.fromLTRB(10,10,0,0),alignment: Alignment.topLeft,
                                                          child:  Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Text('Introduction', style: dark16BoldStyle,),
                                                              Icon(Icons.lock_outline_rounded,color: projectRed,)
                                                            ],
                                                          )
                                                      ),
                                                      Container(
                                                        padding: EdgeInsets.fromLTRB(10,5,10,10),alignment: Alignment.topLeft,
                                                        child: Text('Understanding the general Overview of Asset Management', style: dark14Style,),
                                                      ),
                                                      Container(
                                                          padding: EdgeInsets.fromLTRB(10,5,10,5),alignment: Alignment.topLeft,
                                                          child: Row(
                                                            children: [
                                                              Text('0/10', style: orange14Style,),
                                                              LinearPercentIndicator(
                                                                width: MediaQuery.of(context).size.width * 0.4,
                                                                lineHeight: 10.0,
                                                                percent: 0,
                                                                backgroundColor: Colors.grey,
                                                                progressColor: projectOrange,
                                                              ),
                                                            ],
                                                          )
                                                      ),
                                                    ],
                                                  )
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                            ),

                          ],
                        ),
                      )
                    );
                  },
                  childCount: 1,
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}