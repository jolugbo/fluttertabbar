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
import 'package:project_x/utills/linechart.dart';
import 'package:project_x/utills/pagetransitionutill.dart';
import 'package:project_x/utills/styles.dart';

class deepest_learning extends StatefulWidget {
  deepest_learning({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DeepestLearningState createState() => _DeepestLearningState();
}

class _DeepestLearningState extends State<deepest_learning>
    with TickerProviderStateMixin {
  String defaultprofile = 'assets/jolugbo.jpeg';
  String econKing = 'assets/share1.png';
  String ribbon = 'assets/ribbon.jpg';
  String brains = 'assets/share2.png';
  String owen = 'assets/share3.png';
  String alex = 'assets/share4.png';
  String fred = 'assets/share5.png';
  final GlobalKey<ScaffoldState> _scaffoldKey1 = GlobalKey<ScaffoldState>();
  ContainerTransitionType _transitionType = ContainerTransitionType.fade;

  @override
  State<StatefulWidget> initState() {
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
              alignment: Alignment.center,
              child: Text('Activity Notifications',style: blue14Style,),
            ),
          ),
          body:ListView(
            //padding: const EdgeInsets.all(8),
            children: [
              Container(
                //color: projectLightBlue,
                width: MediaQuery.of(context).size.width * 0.65,
                alignment: Alignment.center,
                child: DropdownButton(
                    value: 0,
                    isExpanded: false,
                    items: [
                      DropdownMenuItem(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Text("Activity type",textAlign: TextAlign.center,style: dark16BoldStyle,),
                        ),
                        value: 0,
                      ),
                      DropdownMenuItem(
                        child: Text("Challenges"),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text("Level Updates"),
                        value: 2,
                      ),
                      DropdownMenuItem(
                          child: Text("Chats"),
                          value: 4
                      )
                    ],
                    onChanged: (value) {
//                          setState(() {
//                            filter = value;
//                          });
                    }),
                //margin: EdgeInsets.all(10),
              ),
              OpenContainer(
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
                            leading:
                            CircleAvatar(
                              radius: 25,
                              child: ClipOval(
                                  child:   RawMaterialButton(
                                    elevation: 2.0,
                                    fillColor: projectBlue,
                                    child: Stack(
                                      children: [
                                        Image.asset(econKing),
                                        Positioned(child: Icon(Icons.flash_on_sharp,color: projectRed,),left: 25,top: 20,)

                                      ],
                                    ),
                                    padding: EdgeInsets.all(3.0),
                                    shape: CircleBorder(side: BorderSide(color: projectGray2)),
                                  )
                              ),
                            ),
                            title:  RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                text: 'Econs King ',style: dark12boldStyle,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'challenged you in',
                                    style: dark10Style,
                                  ),
                                  TextSpan(
                                    text: ' Accounting',
                                    style: blue12boldStyle,
                                  ),
                                  TextSpan(
                                    text: ' 32kp',
                                    style: green12Style,
                                  ),
                                ],
                              ),
                            ),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Text('2 min ago',style: gray11Style),
                              ],
                            ),
                          ),
                        )
                    ),
                  );
                },
              ),
              OpenContainer(
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
                            leading:
                            CircleAvatar(
                              radius: 25,
                              child: ClipOval(
                                  child:   RawMaterialButton(
                                    elevation: 2.0,
                                    fillColor: projectBlue,
                                    child: Stack(
                                      children: [
                                        Image.asset(brains),
                                        Positioned(child: Icon(Icons.flash_on_sharp,color: projectRed,),left: 25,top: 20,)

                                      ],
                                    ),
                                    padding: EdgeInsets.all(3.0),
                                    shape: CircleBorder(side: BorderSide(color: projectGray2)),
                                  )
                              ),
                            ),
                            title:  RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                text: 'Brains ',style: dark12boldStyle,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'challenged you in',
                                    style: dark10Style,
                                  ),
                                  TextSpan(
                                    text: ' Banking',
                                    style: blue12boldStyle,
                                  ),
                                  TextSpan(
                                    text: ' 16kp',
                                    style: green12Style,
                                  ),
                                ],
                              ),
                            ),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Text('10 min ago',style: gray11Style),
                              ],
                            ),
                          ),
                        )
                    ),
                  );
                },
              ),
              OpenContainer(
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
                            leading:
                            CircleAvatar(
                              radius: 25,
                              child: ClipOval(
                                  child:   RawMaterialButton(
                                    elevation: 2.0,
                                    fillColor: projectBlue,
                                    child: Stack(
                                      children: [
                                        Image.asset(alex),
                                        Positioned(child: Icon(Icons.flash_on_sharp,color: projectRed,),left: 25,top: 20,)

                                      ],
                                    ),
                                    padding: EdgeInsets.all(3.0),
                                    shape: CircleBorder(side: BorderSide(color: projectGray2)),
                                  )
                              ),
                            ),
                            title:  RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                text: 'Alex ',style: dark12boldStyle,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'challenged you in',
                                    style: dark10Style,
                                  ),
                                  TextSpan(
                                    text: ' Governance',
                                    style: blue12boldStyle,
                                  ),
                                  TextSpan(
                                    text: ' 32kp',
                                    style: green12Style,
                                  ),
                                ],
                              ),
                            ),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Text('25 min ago',style: gray11Style),
                              ],
                            ),
                          ),
                        )
                    ),
                  );
                },
              ),
              OpenContainer(
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
                            leading:
                            CircleAvatar(
                              radius: 25,
                              child: ClipOval(
                                  child:   RawMaterialButton(
                                    elevation: 2.0,
                                    fillColor: projectBlue,
                                    child: Stack(
                                      children: [
                                        Image.asset(fred),
                                        Positioned(child: Icon(Icons.flash_on_sharp,color: projectRed,),left: 25,top: 20,)

                                      ],
                                    ),
                                    padding: EdgeInsets.all(3.0),
                                    shape: CircleBorder(side: BorderSide(color: projectGray2)),
                                  )
                              ),
                            ),
                            title:  RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                text: 'Fred ',style: dark12boldStyle,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'challenged you in',
                                    style: dark10Style,
                                  ),
                                  TextSpan(
                                    text: ' Economics',
                                    style: blue12boldStyle,
                                  ),
                                  TextSpan(
                                    text: ' 8kp',
                                    style: green12Style,
                                  ),
                                ],
                              ),
                            ),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Text('2 min ago',style: gray11Style),
                              ],
                            ),
                          ),
                        )
                    ),
                  );
                },
              ),
              OpenContainer(
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
                            leading:
                            CircleAvatar(
                              radius: 25,
                              child: ClipOval(
                                  child:   RawMaterialButton(
                                    elevation: 2.0,
                                    fillColor: accent,
                                    child: Image.asset(ribbon),
                                    padding: EdgeInsets.all(3.0),
                                    shape: CircleBorder(),
                                  )
                              ),
                            ),
                            title:  RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                text: 'You have reached ',style: dark10Style,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Level 5',
                                    style: dark12boldStyle,
                                  ),
                                ],
                              ),
                            ),

                            //Text('Mr Jolugbo',style: blue14Style,),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Text('an hour ago',style: gray11Style),
                              ],
                            ),
                          ),
                        )
                    ),
                  );
                },
              ),
              OpenContainer(
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
                            leading:
                            CircleAvatar(
                              radius: 25,
                              child: ClipOval(
                                  child:   RawMaterialButton(
                                    elevation: 2.0,
                                    fillColor: projectBlue,
                                    child: Image.asset(econKing),
                                    padding: EdgeInsets.all(3.0),
                                    shape: CircleBorder(side: BorderSide(color: projectGray2)),
                                  )
                              ),
                            ),
                            title:  RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                text: 'you ',
                                style: dark10Style,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: ' Won ',
                                    style: green12Style,
                                  ),
                                  TextSpan(
                                    text: ' the ',
                                    style: dark10Style,
                                  ),
                                  TextSpan(
                                    text: ' Government ',
                                    style: blue12boldStyle,
                                  ),
                                  TextSpan(
                                    text: 'challenge',
                                    style: dark10Style,
                                  ),
                                ],
                              ),
                            ),

                            //Text('Mr Jolugbo',style: blue14Style,),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Text('2 hours ago',style: gray11Style),
                              ],
                            ),
                          ),
                        )
                    ),
                  );
                },
              ),
              OpenContainer(
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
                            leading:
                            CircleAvatar(
                              radius: 25,
                              child: ClipOval(
                                  child:   RawMaterialButton(
                                    elevation: 2.0,
                                    fillColor: projectBlue,
                                    child: Image.asset(econKing),
                                    padding: EdgeInsets.all(3.0),
                                    shape: CircleBorder(side: BorderSide(color: projectGray2)),
                                  )
                              ),
                            ),
                            title:  RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                text: 'you ',
                                style: dark10Style,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: ' Won ',
                                    style: green12Style,
                                  ),
                                  TextSpan(
                                    text: ' the ',
                                    style: dark10Style,
                                  ),
                                  TextSpan(
                                    text: ' Government ',
                                    style: blue12boldStyle,
                                  ),
                                  TextSpan(
                                    text: 'challenge',
                                    style: dark10Style,
                                  ),
                                ],
                              ),
                            ),

                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Text('2 hours ago',style: gray11Style),
                              ],
                            ),
                          ),
                        )
                    ),
                  );
                },
              ),
              OpenContainer(
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
                            leading:
                            CircleAvatar(
                              radius: 25,
                              child: ClipOval(
                                  child:   RawMaterialButton(
                                    elevation: 2.0,
                                    fillColor: projectBlue,
                                    child: Image.asset(brains),
                                    padding: EdgeInsets.all(3.0),
                                    shape: CircleBorder(side: BorderSide(color: projectGray2)),
                                  )
                              ),
                            ),
                            title:  RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                text: 'you ',
                                style: dark10Style,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: ' Lost ',
                                    style: red14Style,
                                  ),
                                  TextSpan(
                                    text: ' the ',
                                    style: dark10Style,
                                  ),
                                  TextSpan(
                                    text: ' Accounting ',
                                    style: blue12boldStyle,
                                  ),
                                  TextSpan(
                                    text: 'challenge',
                                    style: dark10Style,
                                  ),
                                ],
                              ),
                            ),

                            //Text('Mr Jolugbo',style: blue14Style,),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Text('2 hours ago',style: gray11Style),
                              ],
                            ),
                          ),
                        )
                    ),
                  );
                },
              ),
              OpenContainer(
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
                            leading:
                            CircleAvatar(
                              radius: 25,
                              child: ClipOval(
                                  child:   RawMaterialButton(
                                    elevation: 2.0,
                                    fillColor: projectBlue,
                                    child: Stack(
                                      children: [
                                        Image.asset(econKing),
                                        Positioned(child: Icon(Icons.flash_on_sharp,color: projectRed,),left: 25,top: 20,)

                                      ],
                                    ),
                                    padding: EdgeInsets.all(3.0),
                                    shape: CircleBorder(side: BorderSide(color: projectGray2)),
                                  )
                              ),
                            ),
                            title:  RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                text: 'Econs King ',style: dark12boldStyle,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'started following you',
                                    style: dark10Style,
                                  ),
                                ],
                              ),
                            ),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Text('2 min ago',style: gray11Style),
                              ],
                            ),
                          ),
                        )
                    ),
                  );
                },
              ),
              OpenContainer(
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
                            leading:
                            CircleAvatar(
                              radius: 25,
                              child: ClipOval(
                                  child:   RawMaterialButton(
                                    elevation: 2.0,
                                    fillColor: projectBlue,
                                    child: Stack(
                                      children: [
                                        Image.asset(alex),
                                      ],
                                    ),
                                    padding: EdgeInsets.all(3.0),
                                    shape: CircleBorder(side: BorderSide(color: projectGray2)),
                                  )
                              ),
                            ),
                            title:  RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                text: 'Alex ',style: dark12boldStyle,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Likes your comment on ',
                                    style: dark10Style,
                                  ),
                                  TextSpan(
                                    text: 'Advisory ',
                                    style: blue12boldStyle,
                                  ),
                                ],
                              ),
                            ),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Text('2 min ago',style: gray11Style),
                              ],
                            ),
                          ),
                        )
                    ),
                  );
                },
              ),

//                ...List.generate(10, (index) {
//                  return OpenContainer<bool>(
//                    transitionType: _transitionType,
//                    openBuilder: (context, openContainer) =>const _DetailsCard(),
//                    tappable: false,
//                    closedShape: const RoundedRectangleBorder(),
//                    closedElevation: 0,
//                    closedBuilder: (context, openContainer) {
//                      return ListTile(
//                        onTap: openContainer,
//                        title: Card(
//                            clipBehavior: Clip.antiAlias,
//                            elevation: 5,
//                            shape: cardShape,
//                            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
//                            child: Container(
//                              width: MediaQuery.of(context).size.width * 0.95,
//                              child: ListTile(
//                                leading: CircleAvatar(
//                                  radius: 18,
//                                  child: ClipOval(
//                                    child: Image.asset(defaultprofile),
//                                  ),
//                                ),
//                                title: Text('Mr Jolugbo',style: blue14Style,),
//                                subtitle: Row(
//                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                  mainAxisSize: MainAxisSize.max,
//                                  children: <Widget>[
//                                    Text('1000000000 CP',style: gray11Style),
//                                    Text((index + 1).toString())
//                                  ],
//                                ),
//                              ),
//                            )
//                        ),
//                      );
//                    },
//                  );
//                }),

            ],
          ),
        )
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

class _DetailsCard extends StatelessWidget {
  const _DetailsCard({this.openContainer});
  final VoidCallback openContainer;

  @override
  Widget build(BuildContext context) {
    String defaultprofile = 'assets/jolugbo.jpeg';

    return InkWellOverlay(
      openContainer: openContainer,
      height: 300,
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
              style: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.black54,inherit: false,),
            ),
          ),
        ],),
    );
  }
}

