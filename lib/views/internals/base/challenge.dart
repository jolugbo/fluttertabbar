//

//               OLUFEMI         ADETOLA             <bold!>JOLUGBO<bold!>

//
import 'package:animations/animations.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project_x/utills/imageanimations.dart';
import 'package:project_x/utills/pagetransitionutill.dart';
import 'package:project_x/utills/styles.dart';

import 'community.dart';

class challenge extends StatefulWidget {
  challenge({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<challenge>
    with TickerProviderStateMixin {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ContainerTransitionType _transitionType = ContainerTransitionType.fade;
  List<String> images = ['assets/share1.png','assets/share2.png','assets/share3.png','assets/share4.png','assets/share5.png','assets/share6.png','assets/share7.png','assets/jolugbo.jpeg','assets/angella.png','assets/eniola.png'];
  List<String> names = ['econsKing','brains','owen','alex','fred','brainchild','egghead','Femi','Angella','Eniola'];
  List<String> courseList = ['Governance','Economics','Advisory','Trading','Accounting'];
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
            Scaffold(
              key: _scaffoldKey,
              body: Stack(
                children: <Widget>[
                  AnimatedPositioned(
                    top: 0,
                    duration: Duration(seconds: 1),
                    child: Container(
                      height:MediaQuery.of(context).size.height,
                      width:MediaQuery.of(context).size.width,
                      child: Column(
                        children: <Widget>[
                          Container(
                            width:MediaQuery.of(context).size.width,//color: projectRed,
                            padding: EdgeInsets.fromLTRB(10,5,0,5),
                            child: Text('New Challenge',style: dark16BoldStyle,),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 0,right: 0,bottom: 5,top: 5),
                            child: Container(
                              width:MediaQuery.of(context).size.width,color: projectRed,
                              height: 2,
                            ),
                          ),
                          Container(
                            height:MediaQuery.of(context).size.height* 0.4,
                            width:MediaQuery.of(context).size.width,
                            child: Scrollbar(
                              child: ListView.builder(
                                itemCount: 5,
                                itemBuilder: (context, index) => OpenContainer<bool>(
                                  transitionType: _transitionType,
                                  openBuilder: (context, openContainer) =>const _ChallengeCard(),
                                  tappable: false,
                                  closedShape: const RoundedRectangleBorder(),
                                  closedElevation: 0,
                                  closedBuilder: (context, openContainer) {
                                    return ListTile(
                                      onTap: openContainer,
                                      title: ListTile(
                                        leading: CircleAvatar(
                                          radius: 18,
                                          child: ClipOval(
                                            child: Image.asset(images[5 - index]),
                                          ),
                                        ),
                                        title:Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            //Text(names[5 - index],style: blue14Style,),
                                            RichText(
                                              textAlign: TextAlign.left,
                                              text: TextSpan(
                                                text: names[5 - index],style: dark12boldStyle,
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: ' challenged you in',
                                                    style: dark10Style,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Container(
                                                  color: projectGray, padding: EdgeInsets.all(5),
                                                  child: Text(courseList[index],style: white11Style,),
                                                ),
                                                Container(
                                                  width: 10,
                                                ),
                                                Text(' 32kp',
                                                  style: green12Style,
                                                ),
                                              ],
                                            ),

                                          ],
                                        ),
                                        subtitle: Text('30/10/2020',style: gray12Style,),
                                      ),
                                    );
                                  },
                                ),),
                            ),
                            padding: EdgeInsets.fromLTRB(0,0,0,15),
                          ),
                          Container(
                            width:MediaQuery.of(context).size.width,//color: projectRed,
                            padding: EdgeInsets.fromLTRB(10,5,0,5),
                            child: Text('Completed Challenge',style: dark16BoldStyle,),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 0,right: 0,bottom: 5,top: 5),
                            child: Container(
                              width:MediaQuery.of(context).size.width,color: projectGray,
                              height: 2,
                            ),
                          ),
                          Container(
                            height:MediaQuery.of(context).size.height* 0.4,
                            width:MediaQuery.of(context).size.width * 0.95,
                            child: Scrollbar(
                              child: ListView.builder(
                                itemCount: 10,
                                itemBuilder: (context, index) => OpenContainer<bool>(
                                  transitionType: _transitionType,
                                  openBuilder: (context, openContainer) =>const _WeaponCard(),
                                  tappable: false,
                                  closedShape: const RoundedRectangleBorder(),
                                  closedElevation: 0,
                                  closedBuilder: (context, openContainer) {
                                    return ListTile(
                                      onTap: openContainer,
                                      title: ListTile(
                                        leading: CircleAvatar(
                                          radius: 18,
                                          child: ClipOval(
                                            child: Image.asset(images[index]),
                                          ),
                                        ),
                                        title:Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(names[index],style: blue14Style,),
                                            Row(
                                              children: <Widget>[
                                                Container(
                                                  color: projectGray, padding: EdgeInsets.all(5),
                                                  child: Text('Economics',style: white11Style,),
                                                ),
                                                Container(
                                                  width: 5,
                                                ),
                                                Container(
                                                  color: projectGreen, padding: EdgeInsets.all(5),
                                                  child: Text('YOU WON',style: white11Style,),
                                                ),
                                                Container(
                                                  width: 10,
                                                ),
                                                RichText(
                                                  textAlign: TextAlign.center,
                                                  text: TextSpan(
                                                    text: '',
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text: '5',
                                                        style: dark11BoldStyle,
                                                      ),
                                                      TextSpan(
                                                        text: ' : ',
                                                        style: dark10BoldStyle,
                                                      ),
                                                      TextSpan(
                                                        text: '2',
                                                        style: dark11BoldStyle,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        subtitle: Text('30/10/2020',style: gray12Style,),
                                      ),
                                    );
                                  },
                                ),),
                            )
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                heroTag: 'challenge',
                onPressed: () {
                  //_WeaponCard();
                  setState(() {
                  });
                },
                child: Icon(Icons.flash_on),
                backgroundColor: projectGreen,
              ),


              floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            )
        );
      },
    );
  }
}

class _ChallengeCard extends StatelessWidget {
  const _ChallengeCard({this.openContainer});
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

class _ChallengeReadyCard extends StatelessWidget {
  const _ChallengeReadyCard({this.openContainer});
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


class _WeaponCard extends StatelessWidget {
  const _WeaponCard({this.openContainer});
  final VoidCallback openContainer;

  @override
  Widget build(BuildContext context) {
    String defaultprofile = 'assets/jolugbo.jpeg';
    ContainerTransitionType _transitionType = ContainerTransitionType.fade;
    List<String> images = ['assets/ph.jpg','assets/capitalMarket.png','assets/advisory.png','assets/assetManagement.png','assets/capitalMarket.png','assets/ph.jpg','assets/bg.png','assets/advisory.png','assets/assetManagement.png','assets/capitalMarket.png'];
    List<String> names = ['Asset Management','Advisory','Capital Market','Advisory','Asset Management','Advisory','Capital Market','Asset Management','Advisory','Capital Market'];

    return InkWellOverlay(
      openContainer: openContainer,
      //height: 300,
      width: 300,
      child: Dialog(
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    color: projectLightBlue,alignment: Alignment.center,
                    child: Row(
                      children: [
                        Container(
                          color: Colors.transparent,alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.12,
                          margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: RawMaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            elevation: 2.0,
                            fillColor: accent,
                            child: Icon(Icons.arrow_back),
                            padding: EdgeInsets.all(5.0),
                            shape: CircleBorder(
                                side: BorderSide(color: accent,)
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.transparent,
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.12,
                        ),
                        Container(
                          color: Colors.transparent,
                          height: MediaQuery.of(context).size.height * 0.05,alignment: Alignment.center,
                          child: Text('Choose your Interest',style: dark16BoldStyle),
                        ),
                      ],
                    )
                  ),
                  Container(
                      color: projectLightBlue,alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.7,
                      child:Scrollbar(
                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) => OpenContainer<bool>(
                            transitionType: _transitionType,
                            openBuilder: (context, openContainer) => const _ChallengeReadyCard(),
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
                                      // width: MediaQuery.of(context).size.width * 0.95,
                                      child: ListTile(
                                        leading: RawMaterialButton(
                                          onPressed: openContainer,
                                          elevation: 2.0,
                                          fillColor: projectGray2,
                                          child: Image.asset(images[index],height: 30,width: 30,),
                                          padding: EdgeInsets.all(10.0),
                                          shape: CircleBorder(side: BorderSide(color: projectGray2)),
                                        ),
                                        title: Text(names[index],style: blue14Style,),
//                                        subtitle: Row(
//                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                          mainAxisSize: MainAxisSize.max,
//                                          children: <Widget>[
//                                            // Text(points[index],style: gray11Style),
//                                            Text((index + 1).toString())
//                                          ],
//                                        ),
                                      ),
                                    )
                                ),
                              );
                            },
                          ),),
                      ),

                  ),
                ],
              ),
            ),
//            ListTile(
//              title: Text('Header Text'),
//              subtitle: Text('body Text'),
//            ),
//            Padding(
//              padding: const EdgeInsets.only(left: 16,right: 16,bottom: 16,),
//              child: Text(
//                'Lorem ipsum dolor sit amet, consectetur ''adipiscing elit, sed do eiusmod tempor. Lorem ipsum dolor sit amet, consectetur ''adipiscing elit, sed do eiusmod tempor. Lorem ipsum dolor sit amet, consectetur ''adipiscing elit, sed do eiusmod tempor. Lorem ipsum dolor sit amet, consectetur ''adipiscing elit, sed do eiusmod tempor. Lorem ipsum dolor sit amet, consectetur ''adipiscing elit, sed do eiusmod tempor. Lorem ipsum dolor sit amet, consectetur ''adipiscing elit, sed do eiusmod tempor. Lorem ipsum dolor sit amet, consectetur ''adipiscing elit, sed do eiusmod tempor. Lorem ipsum dolor sit amet, consectetur ''adipiscing elit, sed do eiusmod tempor. Lorem ipsum dolor sit amet, consectetur ''adipiscing elit, sed do eiusmod tempor.',
//                style: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.black54,inherit: false,),
//              ),
//            ),
          ],),
      ),
    );
  }
}