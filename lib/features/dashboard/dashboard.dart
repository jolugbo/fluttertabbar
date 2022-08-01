//

//               OLUFEMI         ADETOLA             <bold!>JOLUGBO<bold!>

//
import 'package:animations/animations.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:edurald/utills/linechart.dart';
import 'package:edurald/utills/pagetransitionutill.dart';
import 'package:edurald/utills/styles.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import '../community/community.dart';
import '../learn/learn.dart';
import '../discovery/discovery.dart';
import '../challenge/challenge.dart';

class dashboardPage extends StatefulWidget {
  dashboardPage({Key? key, this.title, this.index}) : super(key: key);

  final String? title;
  final int? index;

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<dashboardPage>
    with TickerProviderStateMixin {
  String defaultprofile = 'assets/jolugbo.jpeg';
  bool challeng = false;
  bool discover = false;
  bool chat = false;
  double lowerDashElementPosition = 0.33;
  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ContainerTransitionType _transitionType = ContainerTransitionType.fade;

  static GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  final List<dynamic> _children = [
    [learn(), 'learn'],
    [community(), 'community'],
    [discovery(), 'discovery'],
    [challenge(), 'challenge'],
  ];

  Icon dropDown = Icon(
    Icons.keyboard_arrow_down,
    color: accent,
  );
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var parser = EmojiParser();
    return Scaffold(
      key: _drawerKey,
      drawerScrimColor: projectLightGray2,
      drawerEdgeDragWidth: 0,
      appBar: AppBar(
        iconTheme: IconThemeData(color: projectBlue),
        title: Text(
          _children[_currentIndex][1],
          style: blue14Style,
        ),
        backgroundColor: accent,
        actions: <Widget>[
          ButtonTheme(
              minWidth: MediaQuery.of(context).size.width * 0.08,
              height: 50.0,
              child: RaisedButton(
                child: Icon(
                  Icons.search,
                  color: projectBlue,
                ),
                onPressed: () {
                  //Scaffold.of(context).openDrawer();
                },
                color: accent,
              )),
          ButtonTheme(
              minWidth: MediaQuery.of(context).size.width * 0.08,
              height: 50.0,
              child: RaisedButton(
                child: Icon(
                  Icons.notifications,
                  color: projectBlue,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/notifications');
                },
                color: accent,
              )),
          ButtonTheme(
              minWidth: MediaQuery.of(context).size.width * 0.08,
              height: 50.0,
              child: RaisedButton(
                child: CircleAvatar(
                  radius: 18,
                  child: ClipOval(
                    child: Image.asset(defaultprofile),
                  ),
                ),
                onPressed: () {
                  //Scaffold.of(context).openDrawer();
                },
                color: accent,
              )),
        ],
      ),
      body: _children[_currentIndex][0],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('got here');
          setState(() {
            discover = true;
            _currentIndex = 2;
          });
        },
        child: Icon(Icons.location_searching),
        backgroundColor: (discover) ? projectGreen : projectGray,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: accent,
          selectedLabelStyle:
              (discover | challeng | chat) ? gray11Style : blue12Style,
          unselectedLabelStyle: gray11Style,
          showUnselectedLabels: true,
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.school,
                color: projectGray,
              ),
              activeIcon: Icon(
                Icons.school,
                color: projectBlue,
              ),
              label: 'Learn',
              //title: Text('Learn'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.group,
                color: projectGray,
              ),
              activeIcon: Icon(
                Icons.group,
                color: projectBlue,
              ),
              label: 'Community',
              //title: Text('Community'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.location_searching,
                color: Colors.transparent,
              ),
              activeIcon: Icon(
                Icons.location_searching,
                color: Colors.transparent,
              ),
              label:
                  'Discover', //Text(, style: (discover)? green12Style: gray12Style ,)
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.flash_off,
                color: projectGray,
              ),
              activeIcon: Icon(
                Icons.flash_on,
                color: projectRed,
              ),
              label: 'Challenge',
              // title: Text('Challenge', style: (challeng)? dark14Style : gray11Style,),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.chat_bubble,
                color: projectRed,
              ),
              activeIcon: Icon(
                Icons.chat_bubble,
                color: projectRed,
              ),
              label: 'Chats',
              //title: Text('Chats' ,style: red11Style,),
            ),
          ]),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                height: MediaQuery.of(context).size.height * 0.2,
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                color: projectBlue,
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: CircleAvatar(
                        radius: 30,
                        child: ClipOval(
                          child: Image.asset(defaultprofile),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: MediaQuery.of(context).size.height * 0.04,
                      child: Text('Mr Jolugbo', style: light18Style),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'jolugbofemi@gmail.com',
                        style: white14Style,
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                height: MediaQuery.of(context).size.height * 0.08,
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                // color: accent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        parser.get('trophy').code,
                        textAlign: TextAlign.center,
                        style: dark18Style,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text('Leaderboard', style: blue14Style),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/leaderboard');
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                  height: 0.7,
                  width: MediaQuery.of(context).size.width,
                  color: projectGray),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                height: MediaQuery.of(context).size.height * 0.08,
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                // color: accent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        parser.get('open_book').code,
                        textAlign: TextAlign.center,
                        style: dark18Style,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text('Books', style: blue14Style),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                  height: 0.7,
                  width: MediaQuery.of(context).size.width,
                  color: projectGray),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                height: MediaQuery.of(context).size.height * 0.08,
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                // color: accent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        parser.get('bookmark').code,
                        textAlign: TextAlign.center,
                        style: dark18Style,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text('Bookmarks', style: blue14Style),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                  height: 0.7,
                  width: MediaQuery.of(context).size.width,
                  color: projectGray),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                height: MediaQuery.of(context).size.height * 0.08,
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                // color: accent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        Icons.person_add,
                        size: 20,
                        color: projectBlue,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text('Invite Friends', style: blue14Style),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/share');
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                  height: 0.7,
                  width: MediaQuery.of(context).size.width,
                  color: projectGray),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                height: MediaQuery.of(context).size.height * 0.08,
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                // color: accent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        parser.get('star').code,
                        textAlign: TextAlign.center,
                        style: dark18Style,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text('Rate Us', style: blue14Style),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                  height: 0.7,
                  width: MediaQuery.of(context).size.width,
                  color: projectGray),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                height: MediaQuery.of(context).size.height * 0.08,
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                // color: accent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        parser.get('memo').code,
                        textAlign: TextAlign.center,
                        style: dark18Style,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text('Feedback', style: blue14Style),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                  height: 0.7,
                  width: MediaQuery.of(context).size.width,
                  color: projectGray),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                height: MediaQuery.of(context).size.height * 0.08,
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                // color: accent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        parser.get('gear').code,
                        textAlign: TextAlign.center,
                        style: dark18Style,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text('Settings', style: blue14Style),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.fromLTRB(5, 30, 5, 20),
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                color: projectLightGray,
                height: MediaQuery.of(context).size.height * 0.1,
                child: Text(
                  'Live Chat',
                  textAlign: TextAlign.center,
                  style: red14Style,
                )),
            ...List.generate(5, (index) {
              return OpenContainer<bool>(
                transitionType: _transitionType,
                openBuilder: (context, openContainer) => const _ChartCard(),
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
                          child: Image.asset(defaultprofile),
                        ),
                      ),
                      title: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Jolugbo',
                            style: blue14Style,
                          ),
                        ],
                      ),
                      subtitle: Column(
                        children: <Widget>[
                          Text(
                            'Hi Femi whats the rates of mmf today',
                            style: gray12Style,
                          ),
//                          Padding(
//                            padding: EdgeInsets.symmetric(horizontal: 10.0),
//                            child: Container(
//                                height: 0.7,
//                                width: MediaQuery.of(context).size.width,
//                                color: accent),
//                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      if (index != 4) {
        chat = false;
        _currentIndex = index;
        discover = false;
        (index == 3) ? challeng = true : challeng = false;
        //(index == 2) ? discover = true:discover = false;
      } else {
        chat = true;
        _drawerKey.currentState!.openEndDrawer();
      }
    });
  }
}

class _ChartCard extends StatelessWidget {
  const _ChartCard({this.openContainer});
  final VoidCallback? openContainer;

  @override
  Widget build(BuildContext context) {
    String defaultprofile = 'assets/jolugbo.jpeg';

    return InkWellOverlay(
      openContainer: openContainer ?? () {},
      height: 300,
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Stack(
              children: <Widget>[
                Container(
                  color: projectLightBlue,
                  child: Center(
                    child: Image.asset(
                      defaultprofile,
                      width: 100,
                    ),
                  ),
                ),
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
                    child: Icon(
                        Icons.arrow_back), //,backgroundColor: Colors.green,
                    padding: EdgeInsets.all(5.0),
                    shape: CircleBorder(
                        side: BorderSide(
                      color: accent,
                    )),
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
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 16,
            ),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur '
              'adipiscing elit, sed do eiusmod tempor. Lorem ipsum dolor sit amet, consectetur '
              'adipiscing elit, sed do eiusmod tempor. Lorem ipsum dolor sit amet, consectetur '
              'adipiscing elit, sed do eiusmod tempor. Lorem ipsum dolor sit amet, consectetur '
              'adipiscing elit, sed do eiusmod tempor. Lorem ipsum dolor sit amet, consectetur '
              'adipiscing elit, sed do eiusmod tempor. Lorem ipsum dolor sit amet, consectetur '
              'adipiscing elit, sed do eiusmod tempor. Lorem ipsum dolor sit amet, consectetur '
              'adipiscing elit, sed do eiusmod tempor. Lorem ipsum dolor sit amet, consectetur '
              'adipiscing elit, sed do eiusmod tempor. Lorem ipsum dolor sit amet, consectetur '
              'adipiscing elit, sed do eiusmod tempor.',
            ),
          ),
        ],
      ),
    );
  }
}
