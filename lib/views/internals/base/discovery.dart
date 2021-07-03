//

//               OLUFEMI         ADETOLA             <bold!>JOLUGBO<bold!>

//
import 'package:animations/animations.dart';
import 'package:expandable/expandable.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:edurald/utills/linechart.dart';
import 'package:edurald/utills/pagetransitionutill.dart';
import 'package:edurald/utills/styles.dart';

import 'community.dart';
import 'learn.dart';

class discovery extends StatefulWidget {
  discovery({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _DiscoveryState createState() => _DiscoveryState();
}

class _DiscoveryState extends State<discovery>
    with TickerProviderStateMixin {
  String leafIcon = 'assets/leaficon.png';
  String bgMain = 'assets/purplebg.png';
  String dashActive = 'assets/dashboardactive.png';
  String dashInactive = 'assets/dashboardinactive.png';
  String vacationicon = 'assets/vacationicon.png';
  String investmentactive = 'assets/investmentactive.png';
  String bankicon = 'assets/bankicon.png';
  String mastercardlogo = 'assets/mastercardlogo.png';
  String infoicon = 'assets/infoicon.png';
  String copyIcon = 'assets/copyicon.png';
  String groupGoalIcon = 'assets/groupgoalicon.png';
  String goalicon = 'assets/smallgoalicon.png';
  String more = 'assets/more.png';
  String cardbackground = 'assets/cardbackground.png';
  String portfolioicon = 'assets/portfolioicon.png';
  String morebutton = 'assets/morebutton.png';
  String vector = 'assets/vector.png';
  String fixedincomeicon = 'assets/fixedincomeicon.png';
  String mmfchart = 'assets/mmfchart.png';
  String defaultprofile = 'assets/jolugbo.jpeg';
  String MA = 'assets/MA.png';
  double lowerDashElementPosition = 0.33;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Icon dropDown = Icon(Icons.keyboard_arrow_down,color: accent,);
  ContainerTransitionType _transitionType = ContainerTransitionType.fade;

  @override
  void initState() {
    super.initState();
  }
  _getSeriesData() {
    List<charts.Series<PopulationData, String>> series = [
      charts.Series(
          id: "Population",
          data: samplePopulationData,
          domainFn: (PopulationData series, _) => series.year.toString(),
          measureFn: (PopulationData series, _) => series.population,
          colorFn: (PopulationData series, _) => series.barColor
      )
    ];
    return series;
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      // Adding [ValueKey] to make sure that the widget gets rebuilt when// changing type.
      key: ValueKey(_transitionType),
      onGenerateRoute: (settings) {
        return MaterialPageRoute<void>(builder: (context) =>
            DefaultTabController(
                length: 2,
                child:Scaffold(
                    key: _scaffoldKey,
                    appBar: AppBar(
                      automaticallyImplyLeading: false,
                      backgroundColor: accent,
                      title: Container(
                        alignment: Alignment.center,
                        child: Text('Explore New Discoveries',style: blue14Style,),
                      ),
                      bottom:TabBar(
                        indicator: CircleTabIndicator(color: projectBlue, radius: 5),
                        tabs: <Widget>[
                          Tab(
                            child:
                            Text('Case Study', style: dark16BoldStyle),
                          ),
                          Tab(
                            child: Text(
                              'Insights',
                              style: dark16BoldStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                    body: TabBarView(
                      children: <Widget>[
                        ListView(
                          children: [
                            ...List.generate(10, (index) {
                              return OpenContainer<bool>(
                                transitionType: _transitionType,
                                openBuilder: (context, openContainer) =>const _DetailsCard(),
                                tappable: false,
                                closedShape: const RoundedRectangleBorder(),
                                closedElevation: 0,
                                closedBuilder: (context, openContainer) {
                                  return ListTile(
                                    onTap: openContainer,
                                    title: Card(
                                      clipBehavior: Clip.antiAlias,
                                      elevation: 5,
                                      shape: cardShape,
                                      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      child: Column(
                                        children: [
                                          ListTile(
                                            leading: CircleAvatar(
                                              radius: 18,
                                              child: ClipOval(
                                                child: Image.asset(defaultprofile),
                                              ),
                                            ),
                                            title: Text('Project X acquired for \$1 Billion',style: blue14Style,),
                                            subtitle: Text('#aquisition')
//                                            Container(
//                                              width:MediaQuery.of(context).size.width,
//                                              child: Row(
//                                                mainAxisSize: MainAxisSize.min,
//                                                mainAxisAlignment: MainAxisAlignment.start,
//                                                children: <Widget>[
//                                                  ButtonBar(
//                                                    alignment: MainAxisAlignment.start,
//                                                    children: [
//                                                      FlatButton(
//                                                        textColor: const Color(0xFF6200EE),
//                                                        onPressed: () {
//                                                          // Perform some action
//                                                        },
//                                                        child: const Text('#aquisition'),
//                                                      ),
//                                                    ],
//                                                  ),
//                                                ],
//                                              ),
//                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Text(
                                              'BlackRock announces the acquisition of Project X for a value of \$10 Billion ...read more',
                                              style: dark14Style,
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.center, //color: projectLightBlue,
                                            width:MediaQuery.of(context).size.width,
                                            child: Image.asset(MA),
                                          ),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            width:MediaQuery.of(context).size.width,
                                            height:MediaQuery.of(context).size.height * 0.1, color: projectGray,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment: CrossAxisAlignment.start,mainAxisSize: MainAxisSize.max,
                                              children: [
                                                ButtonTheme(
                                                    minWidth: MediaQuery.of(context).size.width * 0.05,
                                                    buttonColor: accent,
                                                    child: RaisedButton(
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                                          side: BorderSide(color: accent)
                                                      ),
                                                      //color: armonePurple,
                                                      child: Row(
                                                        children: [
                                                          Icon(Icons.favorite_border_sharp),
                                                          Text('100k',style: dark10BoldStyle,),
                                                        ],
                                                      ),
                                                      onPressed: () => {

                                                      },
                                                      highlightElevation: 20,
                                                    )),
                                                ButtonTheme(
                                                    minWidth: MediaQuery.of(context).size.width * 0.05,
                                                    buttonColor: accent,
                                                    child: RaisedButton(
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                                          side: BorderSide(color: accent)
                                                      ),
                                                      color: accent,
                                                      child: Row(
                                                        children: [
                                                          Icon(Icons.comment_bank_outlined),
                                                          Text('11k',style: dark10BoldStyle,),
                                                        ],
                                                      ),
                                                      onPressed: () => {

                                                      },
                                                      highlightElevation: 20,
                                                    )),
                                                ButtonTheme(
                                                    minWidth: MediaQuery.of(context).size.width * 0.05,
                                                    buttonColor: accent,
                                                    child: RaisedButton(
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                                          side: BorderSide(color: accent)
                                                      ),
                                                      color: accent,
                                                      child: Icon(Icons.bookmark_border_outlined),
                                                      onPressed: () => {

                                                      },
                                                      highlightElevation: 20,
                                                    )),
                                                ButtonTheme(
                                                    minWidth: MediaQuery.of(context).size.width * 0.05,
                                                    buttonColor: accent,
                                                    child: RaisedButton(
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                                          side: BorderSide(color: accent)
                                                      ),
                                                      color: accent,
                                                      child: Icon(Icons.share_outlined),
                                                      onPressed: () => {

                                                      },
                                                      highlightElevation: 20,
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            }),
                          ],
                        ),
                        ListView(
                          children: [
                            ...List.generate(10, (index) {
                              return OpenContainer<bool>(
                                transitionType: _transitionType,
                                openBuilder: (context, openContainer) =>const _DetailsCard(),
                                tappable: false,
                                closedShape: const RoundedRectangleBorder(),
                                closedElevation: 0,
                                closedBuilder: (context, openContainer) {
                                  return ListTile(
                                    onTap: openContainer,
                                    title: Card(
                                      clipBehavior: Clip.antiAlias,
                                      elevation: 5,
                                      shape: cardShape,
                                      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      child: Column(
                                        children: [
                                          ListTile(
                                            leading: CircleAvatar(
                                              radius: 18,
                                              child: ClipOval(
                                                child: Image.asset(defaultprofile),
                                              ),
                                            ),
                                            title: Text('Population growth by country',style: blue14Style,),
                                            subtitle: Text(
                                              'click view more for more analysis',
                                              style: TextStyle(color: Colors.black.withOpacity(0.6)),
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.center, color: projectLightBlue,
                                            width:MediaQuery.of(context).size.width,
                                            child: Icon(Icons.group),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            color: projectLightBlue,
                                            width:MediaQuery.of(context).size.width,
                                            height:MediaQuery.of(context).size.height * 0.35,
                                            child:Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: <Widget>[
                                                    Text(
                                                      "Population of U.S. over the years",
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold
                                                      ),
                                                    ),
                                                    SizedBox(height: 20,),
                                                    Expanded(
                                                      child: charts.BarChart(
                                                        _getSeriesData(),
                                                        animate: true,vertical: true,
                                                        domainAxis: charts.OrdinalAxisSpec(
                                                            renderSpec: charts.SmallTickRendererSpec(labelRotation: 60)
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(8.0),
                                            width:MediaQuery.of(context).size.width,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: <Widget>[
                                                ButtonBar(
                                                  alignment: MainAxisAlignment.start,
                                                  children: [
                                                    RaisedButton(
                                                      textColor: projectBlue,
                                                      onPressed: () {
                                                        openContainer();
                                                      },
                                                      child: Text('View More',style: blue14Style,),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                    mainAxisSize: MainAxisSize.max,
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: <Widget>[
                                                      IconButton(icon: Icon(Icons.favorite), onPressed: (){},color: projectRed,),
                                                      IconButton(icon: Icon(Icons.share), onPressed: (){},color: projectGray,)
                                                    ])
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            }),
                          ],
                        ),
                      ],
                    )
                )
            )
        );
      },
    );
  }
}


class _DetailsCard extends StatelessWidget {
  const _DetailsCard({this.openContainer});
  final VoidCallback? openContainer;

  @override
  Widget build(BuildContext context) {
    String MA = 'assets/MA.png';

    return InkWellOverlay(
      openContainer: openContainer??(){},
      height: 300,width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Stack(
              children: <Widget>[
                Container(
                  child: Center(
                    child: Image.asset(MA),
                  ),),
                Container(
                  color: Colors.transparent,
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.12,
                  margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
                  child: RawMaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    elevation: 2.0,
                    fillColor: accent,
                    child: Icon(Icons.arrow_back),//,backgroundColor: Colors.green,
                    padding: EdgeInsets.all(5.0),
                    shape: CircleBorder(
                        side: BorderSide(color: accent,)
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text('Header Text'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('01/03/2021'),
                Container(
                  alignment: Alignment.centerLeft,
                  width:MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,mainAxisSize: MainAxisSize.max,
                    children: [
                      ButtonTheme(
                          minWidth: MediaQuery.of(context).size.width * 0.05,
                          buttonColor: accent,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                side: BorderSide(color: accent)
                            ),
                            //color: armonePurple,
                            child: Row(
                              children: [
                                Icon(Icons.favorite_border_sharp),
                                Text('100k',style: dark10BoldStyle,),
                              ],
                            ),
                            onPressed: () => {

                            },
                            highlightElevation: 20,
                          )),
                      ButtonTheme(
                          minWidth: MediaQuery.of(context).size.width * 0.05,
                          buttonColor: accent,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                side: BorderSide(color: accent)
                            ),
                            color: accent,
                            child: Row(
                              children: [
                                Icon(Icons.comment_bank_outlined),
                                Text('11k',style: dark10BoldStyle,),
                              ],
                            ),
                            onPressed: () => {

                            },
                            highlightElevation: 20,
                          )),
                      ButtonTheme(
                          minWidth: MediaQuery.of(context).size.width * 0.05,
                          buttonColor: accent,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                side: BorderSide(color: accent)
                            ),
                            color: accent,
                            child: Icon(Icons.bookmark_border_outlined),
                            onPressed: () => {

                            },
                            highlightElevation: 20,
                          )),
                      ButtonTheme(
                          minWidth: MediaQuery.of(context).size.width * 0.05,
                          buttonColor: accent,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                side: BorderSide(color: accent)
                            ),
                            color: accent,
                            child: Icon(Icons.share_outlined),
                            onPressed: () => {

                            },
                            highlightElevation: 20,
                          )),
                    ],
                  ),
                ),
              ],
            )
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16,right: 16,bottom: 16,),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur ''adipiscing elit, sed do eiusmod tempor. Lorem ipsum dolor sit amet, consectetur ''adipiscing elit, sed do eiusmod tempor. Lorem ipsum dolor sit amet, consectetur ''adipiscing elit, sed do eiusmod tempor. Lorem ipsum dolor sit amet, consectetur ''adipiscing elit, sed do eiusmod tempor. Lorem ipsum dolor sit amet, consectetur ''adipiscing elit, sed do eiusmod tempor. Lorem ipsum dolor sit amet, consectetur ''adipiscing elit, sed do eiusmod tempor. Lorem ipsum dolor sit amet, consectetur ''adipiscing elit, sed do eiusmod tempor. Lorem ipsum dolor sit amet, consectetur ''adipiscing elit, sed do eiusmod tempor. Lorem ipsum dolor sit amet, consectetur ''adipiscing elit, sed do eiusmod tempor.',

            ),
          ),
        ],),
    );
  }
}

