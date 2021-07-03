//

//               OLUFEMI         ADETOLA             <bold!>JOLUGBO<bold!>

//
import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:edurald/utills/pagetransitionutill.dart';
import 'package:edurald/utills/styles.dart';

class leaderboard extends StatefulWidget {
  leaderboard({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _LeaderboardState createState() => _LeaderboardState();
}

class _LeaderboardState extends State<leaderboard>
    with TickerProviderStateMixin {
  List<String> images = ['assets/share1.png','assets/share2.png','assets/share3.png','assets/share4.png','assets/share5.png','assets/share6.png','assets/share7.png','assets/jolugbo.jpeg','assets/angella.png','assets/eniola.png'];
  List<String> names = ['econsKing','brains','owen','alex','fred','brainchild','egghead','Femi','Angella','Eniola'];
  List<String> points = ['2060kp','1295kp','1200kp','980kp','765kp','540kp','510kp','502kp','400kp','400kp'];
  final GlobalKey<ScaffoldState> _scaffoldKey1 = GlobalKey<ScaffoldState>();
  ContainerTransitionType _transitionType = ContainerTransitionType.fade;
  late Country _selected;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child:Scaffold(
            key: _scaffoldKey1,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: accent,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,color: projectDark,
                ),
                onPressed: (){
                  Navigator.pop(context);
                },),
              title: Container(
                alignment: Alignment.centerLeft,
                child: Text('Brainiacs',style: blue14Style,),
              ),
              bottom:
              TabBar(
                indicator: CircleTabIndicator(color: projectBlue, radius: 5),
                tabs: <Widget>[
                  Tab(
                    child:
                    Text('Following', style: dark16BoldStyle),
                  ),
                  Tab(
                    child: Text(
                      'Local',
                      style: dark16BoldStyle,
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Global',
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
                    Container(
                      color: projectLightBlue,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text('Your Network',style: blue14Style,),
                            padding: EdgeInsets.fromLTRB(20,0,0,0),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: DropdownButton(
                                value: 1,
                                isExpanded: false,
                                items: [
                                  DropdownMenuItem(
                                    child: Text("60M"),
                                    value: 0,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("24H"),
                                    value: 1,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("7D"),
                                    value: 2,
                                  ),
                                  DropdownMenuItem(
                                      child: Text("4W"),
                                      value: 4
                                  ),
                                  DropdownMenuItem(
                                      child: Text("12M"),
                                      value: 4
                                  ),
                                  DropdownMenuItem(
                                      child: Text("All Time Guru"),
                                      value: 4
                                  )
                                ],
                                onChanged: (value) {
//                          setState(() {
//                            filter = value;
//                          });
                                }),
                            padding: EdgeInsets.fromLTRB(0,0,20,0),
                          ),

                        ],
                      ),
                      //padding: EdgeInsets.all(10),
                    ),
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
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.95,
                                child: ListTile(
                                  leading: CircleAvatar(
                                    radius: 18,
                                    child: ClipOval(
                                      child: Image.asset(images[index]),
                                    ),
                                  ),
                                  title: Text(names[index],style: blue14Style,),
                                  subtitle: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Text(points[index],style: gray11Style),
                                      Text((index + 1).toString())
                                    ],
                                  ),
                                ),
                              )
                            ),
                          );
                        },
                      );
                    }),
                  ],
                ),
                ListView(
                  children: [
                    Container(
                      color: projectLightBlue,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: CountryPicker(
                              dense: false,
                              showFlag: true,  //displays flag, true by default
                              showDialingCode: false, //displays dialing code, false by default
                              showName: true, //displays country name, true by default
                              showCurrency: false, //eg. 'British pound'
                              showCurrencyISO: true, //eg. 'GBP'
                              onChanged: (Country country) {
                                setState(() {
                                  _selected = country;
                                });
                              },
                              selectedCountry: _selected,
                            ),
                            padding: EdgeInsets.fromLTRB(20,0,0,0),
                          ),
                          Container(
                            child: DropdownButton(
                                value: 1,
                                isExpanded: false,
                                items: [
                                  DropdownMenuItem(
                                    child: Text("60M"),
                                    value: 0,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("24H"),
                                    value: 1,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("7D"),
                                    value: 2,
                                  ),
                                  DropdownMenuItem(
                                      child: Text("4W"),
                                      value: 4
                                  ),
                                  DropdownMenuItem(
                                      child: Text("12M"),
                                      value: 4
                                  ),
                                  DropdownMenuItem(
                                      child: Text("All Time Guru"),
                                      value: 4
                                  )
                                ],
                                onChanged: (value) {
//                          setState(() {
//                            filter = value;
//                          });
                                }),
                            padding: EdgeInsets.fromLTRB(0,0,20,0),
                          ),
                        ],
                      ),
                      //padding: EdgeInsets.all(10),
                    ),
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
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.95,
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      radius: 18,
                                      child: ClipOval(
                                        child: Image.asset(images[index]),
                                      ),
                                    ),
                                    title: Text(names[index],style: blue14Style,),
                                    subtitle: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Text(points[index],style: gray11Style),
                                        Text((index + 1).toString())
                                      ],
                                    ),
                                  ),
                                )
                            ),
                          );
                        },
                      );
                    }),
                  ],
                ),
                ListView(
                  children: [
                    Container(
                      color: projectLightBlue,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text('Global Brainiacs',style: blue14Style,),
                            padding: EdgeInsets.fromLTRB(20,0,0,0),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: DropdownButton(
                                value: 1,
                                isExpanded: false,
                                items: [
                                  DropdownMenuItem(
                                    child: Text("60M"),
                                    value: 0,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("24H"),
                                    value: 1,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("7D"),
                                    value: 2,
                                  ),
                                  DropdownMenuItem(
                                      child: Text("4W"),
                                      value: 4
                                  ),
                                  DropdownMenuItem(
                                      child: Text("12M"),
                                      value: 4
                                  ),
                                  DropdownMenuItem(
                                      child: Text("All Time Guru"),
                                      value: 4
                                  )
                                ],
                                onChanged: (value) {
//                          setState(() {
//                            filter = value;
//                          });
                                }),
                            padding: EdgeInsets.fromLTRB(0,0,20,0),
                          ),

                        ],
                      ),
                      //padding: EdgeInsets.all(10),
                    ),
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
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.95,
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      radius: 18,
                                      child: ClipOval(
                                        child: Image.asset(images[index]),
                                      ),
                                    ),
                                    title: Text(names[index],style: blue14Style,),
                                    subtitle: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Text(points[index],style: gray11Style),
                                        Text((index + 1).toString())
                                      ],
                                    ),
                                  ),
                                )
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
    );
  }
}

class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({required Color color,  required double radius})
      : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([void onChanged]) => _painter;
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
        offset + Offset(cfg.size!.width / 2, cfg.size!.height - radius - 5);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}

class _DetailsCard extends StatelessWidget {
  const _DetailsCard({this.openContainer});
  final VoidCallback? openContainer;

  @override
  Widget build(BuildContext context) {
    String defaultprofile = 'assets/jolugbo.jpeg';

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
                  color: projectLightBlue,
                  child: Center(
                    child: Image.asset(defaultprofile,width: 100,),
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
            subtitle: Text('body Text'),
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

