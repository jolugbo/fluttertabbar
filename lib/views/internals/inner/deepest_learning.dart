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
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:edurald/utills/linechart.dart';
import 'package:edurald/utills/pagetransitionutill.dart';
import 'package:edurald/utills/styles.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class deepest_learning extends StatefulWidget {
  deepest_learning({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _DeepestLearningState createState() => _DeepestLearningState();
}

enum Answer { A, B, C, D }

class _DeepestLearningState extends State<deepest_learning>
    with TickerProviderStateMixin {
  var parser = EmojiParser();
  String defaultprofile = 'assets/jolugbo.jpeg';
  String econKing = 'assets/share1.png';
  String ribbon = 'assets/ribbon.jpg';
  String brains = 'assets/share2.png';
  String owen = 'assets/share3.png';
  String alex = 'assets/share4.png';
  String fred = 'assets/share5.png';
  ScrollController scrollController = new ScrollController();
  PanelController panelController = new PanelController();
  CarouselController carouselController = new CarouselController();
  int _current = 0;
  Answer? AnswerSelected;

  final GlobalKey<ScaffoldState> _scaffoldKey1 = GlobalKey<ScaffoldState>();
  ContainerTransitionType _transitionType = ContainerTransitionType.fade;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Widget content1 = Column(
      children: [
        Container(
            width: size.width * 0.95,
            margin: EdgeInsets.fromLTRB(0, 2, 0, 4),
            alignment: Alignment.centerLeft,
            child: Text(
              'Asset management.',
              style: blue25BoldStyle,
              textAlign: TextAlign.left,
            )),
        Container(
            width: size.width,
            height: size.height * 0.65,
            alignment: Alignment.center,
            color: projectGray2,
            child: Scrollbar(
              child: Container(
                  alignment: Alignment.center,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    alignment: Alignment.center,
                    color: accent,
                    height: MediaQuery.of(context).size.height,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.all(20),
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      children: <Widget>[
                        Container(
                            width: MediaQuery.of(context).size.width * 0.95,
                            alignment: Alignment.center,
                            child: Text(
                              'Asset management refers to a systematic approach to the governance and realization of value from the things that a group or entity is responsible for,over their whole life cycles. \n\nIt may apply both to tangible assets (physical objects such as buildings or equipment) and to intangible assets (such as human capital, intellectual property, goodwill or financial assets). \n\nAsset management is a systematic process of developing, operating, maintaining, upgrading, and disposing of assets in the most cost-effective manner (including all costs, risks and performance attributes). \n\nThe term is commonly used in the financial sector to describe people and companies who manage investments on behalf of others.\n\n\ Those include, for example, investment managers that manage the assets of a pension fund. \n\nIt is also increasingly used in both the business world and public infrastructure sectors to ensure a coordinated approach to the optimization of costs, risks, service/ performance and sustainability.',
                              style: dark14Style,
                              textAlign: TextAlign.left,
                            )),
                      ],
                    ),
                  )),
              isAlwaysShown: true,
              controller: scrollController,
              radius: Radius.circular(10),
            )),
        Container(
          //height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  alignment: Alignment.centerRight,
                  child: ButtonTheme(
                      height: 40,
                      buttonColor: Colors.transparent,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        color: accent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Comments',
                              style: blue14Style,
                            ),
                            Stack(
                              children: <Widget>[
                                Icon(
                                  Icons.mode_comment_outlined,
                                  color: projectBlue,
                                  size: 40,
                                ),
                                new Positioned(
                                  top: 10.0,
                                  right: 10.0,
                                  child: Text('621', style: red10Style),
                                )
                              ],
                            ),
                            //Icon(Icons.mode_comment_outlined,color: projectBlue,)
                          ],
                        ),
                        onPressed: () async {
                          panelController.open();
                        },
                      )),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  alignment: Alignment.centerRight,
                  child: ButtonTheme(
                      height: 40,
                      buttonColor: Colors.transparent,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(color: projectBlue)),
                        color: projectBlue,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Continue',
                              style: white18Style,
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: accent,
                            )
                          ],
                        ),
                        onPressed: () async {
                          carouselController.nextPage(duration: Duration(microseconds: 300),curve: Curves.fastOutSlowIn);
                        },
                        highlightElevation: 0.8,
                      )),
                ),
              ],
            )),
      ],
    );
    Widget qAndA1 = Column(
      children: [
        Container(
            width: size.width * 0.95,
            margin: EdgeInsets.fromLTRB(0, 2, 0, 4),
            alignment: Alignment.centerLeft,
            child: Text(
              'Q and A',
              style: blue25BoldStyle,
              textAlign: TextAlign.left,
            )),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.65,
          alignment: Alignment.center, color: projectGray2,
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height * 0.65,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.95,
                          alignment: Alignment.center,
                          color: accent,
                          height: MediaQuery.of(context).size.height,
                          child: ListView(
                            scrollDirection: Axis.vertical,
                            padding: EdgeInsets.all(20),
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            children: <Widget>[
                              Container(
                                  width:
                                  MediaQuery.of(context).size.width * 0.95,
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Which of the following best describes asset management?',
                                    style: dark20Style,
                                    textAlign: TextAlign.left,
                                  )),
                              Container(
                                  width:
                                  MediaQuery.of(context).size.width * 0.95,
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Text(
                                          'Asset management refers to a systematic approach to the governance and realization of value from the things that a group or entity is responsible for, over their whole life cycles',
                                          style: dark15Style,
                                        ),
                                        leading: Radio(
                                          value: Answer.A,
                                          groupValue: AnswerSelected,
                                          onChanged: (Answer? value) {
                                            setState(() {
                                              AnswerSelected = value;
                                            });
                                          },
                                        ),
                                      ),
                                      ListTile(
                                        title: Text(
                                          'Asset management refers to a systematic approach to the governance and realization of value from the things that a group or entity is responsible for, over their whole life cycles',
                                          style: dark15Style,
                                        ),
                                        leading: Radio(
                                          value: Answer.B,
                                          groupValue: AnswerSelected,
                                          onChanged: (Answer? value) {
                                            setState(() {
                                              AnswerSelected = value;
                                            });
                                          },
                                        ),
                                      ),
                                      ListTile(
                                        title: Text(
                                          'Asset management refers to a systematic approach to the governance and realization of value from the things that a group or entity is responsible for, over their whole life cycles',
                                          style: dark15Style,
                                        ),
                                        leading: Radio(
                                          value: Answer.C,
                                          groupValue: AnswerSelected,
                                          onChanged: (Answer? value) {
                                            setState(() {
                                              AnswerSelected = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ));
                  },
                  childCount: 1,
                ),
              ),
            ],
          ),
          //margin: EdgeInsets.all(10),
        ),
        Container(
          //height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  alignment: Alignment.centerRight,
                  child: ButtonTheme(
                      height: 40,
                      buttonColor: Colors.transparent,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        color: accent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Comments',
                              style: blue14Style,
                            ),
                            Stack(
                              children: <Widget>[
                                Icon(
                                  Icons.mode_comment_outlined,
                                  color: projectBlue,
                                  size: 40,
                                ),
                                new Positioned(
                                  top: 10.0,
                                  right: 10.0,
                                  child: Text('621', style: red10Style),
                                )
                              ],
                            ),
                            //Icon(Icons.mode_comment_outlined,color: projectBlue,)
                          ],
                        ),
                        onPressed: () async {
                          panelController.open();
                        },
                      )),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  alignment: Alignment.centerRight,
                  child: ButtonTheme(
                      height: 40,
                      buttonColor: Colors.transparent,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(color: projectBlue)),
                        color: projectBlue,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Check',
                              style: white18Style,
                            ),
                            Text(
                              '?',
                              style: white18Style,
                            ),
                          ],
                        ),
                        onPressed: () async {
                          carouselController.nextPage(duration: Duration(microseconds: 300),curve: Curves.fastOutSlowIn);
                        },
                        highlightElevation: 0.8,
                      )),
                ),
              ],
            )),
      ],
    );
    Widget content2 = Column(
      children: [
        Container(
            width: size.width * 0.95,
            margin: EdgeInsets.fromLTRB(0, 2, 0, 4),
            alignment: Alignment.centerLeft,
            child: Text(
              'Asset management.',
              style: blue25BoldStyle,
              textAlign: TextAlign.left,
            )),
        Container(
            width: size.width,
            height: size.height * 0.65,
            alignment: Alignment.center,
            color: projectGray2,
            child: Scrollbar(
              child: Container(
                  alignment: Alignment.center,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    alignment: Alignment.center,
                    color: accent,
                    height: MediaQuery.of(context).size.height,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.all(20),
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      children: <Widget>[
                        Container(
                            width: MediaQuery.of(context).size.width * 0.95,
                            alignment: Alignment.center,
                            child: Text(
                              'Here is another very important concept about Asset management i have not pieced it together yet but i bet you its important you know it'
                              '. \n\nIt may apply both to tangible assets (physical objects such as buildings or equipment) and to intangible assets (such as human capital,'
                              'intellectual property, goodwill or financial assets). \n\nAsset management is a systematic process of developing, operating, maintaining, upgrading,'
                              'and disposing of assets in the most cost-effective manner (including all costs, risks and performance attributes). \n\nThe term is commonly used in the'
                              'financial sector to describe people and companies who manage investments on behalf of others.\n\n\ Those include, for example, investment managers that manage the assets of a pension fund. \n\nIt'
                              'is also increasingly used in both the business world and public infrastructure sectors to ensure a coordinated approach to the optimization of costs, risks, service/ performance and sustainability.',
                              style: dark14Style,
                              textAlign: TextAlign.left,
                            )),
                      ],
                    ),
                  )),
              isAlwaysShown: true,
              controller: scrollController,
              radius: Radius.circular(10),
            )),
        Container(
          //height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  alignment: Alignment.centerRight,
                  child: ButtonTheme(
                      height: 40,
                      buttonColor: Colors.transparent,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        color: accent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Comments',
                              style: blue14Style,
                            ),
                            Stack(
                              children: <Widget>[
                                Icon(
                                  Icons.mode_comment_outlined,
                                  color: projectBlue,
                                  size: 40,
                                ),
                                new Positioned(
                                  top: 10.0,
                                  right: 10.0,
                                  child: Text('621', style: red10Style),
                                )
                              ],
                            ),
                            //Icon(Icons.mode_comment_outlined,color: projectBlue,)
                          ],
                        ),
                        onPressed: () async {
                          panelController.open();
                        },
                      )),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  alignment: Alignment.centerRight,
                  child: ButtonTheme(
                      height: 40,
                      buttonColor: Colors.transparent,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(color: projectBlue)),
                        color: projectBlue,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Continue',
                              style: white18Style,
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: accent,
                            )
                          ],
                        ),
                        onPressed: () async {
                          carouselController.nextPage(duration: Duration(microseconds: 300),curve: Curves.fastOutSlowIn);
                        },
                        highlightElevation: 0.8,
                      )),
                ),
              ],
            )),
      ],
    );
    Widget qAndA2 = Column(
      children: [
        Container(
            width: size.width * 0.95,
            margin: EdgeInsets.fromLTRB(0, 2, 0, 4),
            alignment: Alignment.centerLeft,
            child: Text(
              'Q and A',
              style: blue25BoldStyle,
              textAlign: TextAlign.left,
            )),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.65,
          alignment: Alignment.center, color: projectGray2,
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height * 0.65,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.95,
                          alignment: Alignment.center,
                          color: accent,
                          height: MediaQuery.of(context).size.height,
                          child: ListView(
                            scrollDirection: Axis.vertical,
                            padding: EdgeInsets.all(20),
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            children: <Widget>[
                              Container(
                                  width:
                                  MediaQuery.of(context).size.width * 0.95,
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Which of the following best describes asset management?',
                                    style: dark20Style,
                                    textAlign: TextAlign.left,
                                  )),
                              Container(
                                  width:
                                  MediaQuery.of(context).size.width * 0.95,
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Text(
                                          'Asset management refers to a systematic approach to the governance and realization of value from the things that a group or entity is responsible for, over their whole life cycles',
                                          style: dark15Style,
                                        ),
                                        leading: Radio(
                                          value: Answer.A,
                                          groupValue: AnswerSelected,
                                          onChanged: (Answer? value) {
                                            setState(() {
                                              AnswerSelected = value;
                                            });
                                          },
                                        ),
                                      ),
                                      ListTile(
                                        title: Text(
                                          'Asset management refers to a systematic approach to the governance and realization of value from the things that a group or entity is responsible for, over their whole life cycles',
                                          style: dark15Style,
                                        ),
                                        leading: Radio(
                                          value: Answer.B,
                                          groupValue: AnswerSelected,
                                          onChanged: (Answer? value) {
                                            setState(() {
                                              AnswerSelected = value;
                                            });
                                          },
                                        ),
                                      ),
                                      ListTile(
                                        title: Text(
                                          'Asset management refers to a systematic approach to the governance and realization of value from the things that a group or entity is responsible for, over their whole life cycles',
                                          style: dark15Style,
                                        ),
                                        leading: Radio(
                                          value: Answer.C,
                                          groupValue: AnswerSelected,
                                          onChanged: (Answer? value) {
                                            setState(() {
                                              AnswerSelected = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ));
                  },
                  childCount: 1,
                ),
              ),
            ],
          ),
          //margin: EdgeInsets.all(10),
        ),
        Container(
          //height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  alignment: Alignment.centerRight,
                  child: ButtonTheme(
                      height: 40,
                      buttonColor: Colors.transparent,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        color: accent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Comments',
                              style: blue14Style,
                            ),
                            Stack(
                              children: <Widget>[
                                Icon(
                                  Icons.mode_comment_outlined,
                                  color: projectBlue,
                                  size: 40,
                                ),
                                new Positioned(
                                  top: 10.0,
                                  right: 10.0,
                                  child: Text('621', style: red10Style),
                                )
                              ],
                            ),
                            //Icon(Icons.mode_comment_outlined,color: projectBlue,)
                          ],
                        ),
                        onPressed: () async {
                          panelController.open();
                        },
                      )),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  alignment: Alignment.centerRight,
                  child: ButtonTheme(
                      height: 40,
                      buttonColor: Colors.transparent,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(color: projectBlue)),
                        color: projectBlue,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Check',
                              style: white18Style,
                            ),
                            Text(
                              '?',
                              style: white18Style,
                            ),
                          ],
                        ),
                        onPressed: () async {
                          carouselController.nextPage(duration: Duration(microseconds: 300),curve: Curves.fastOutSlowIn);
                        },
                        highlightElevation: 0.8,
                      )),
                ),
              ],
            )),
      ],
    );

    List<Widget> carouselItems = [content1, qAndA1,content2, qAndA2];

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
                  color: projectBlue,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: <Widget>[
                ButtonTheme(
                    minWidth: MediaQuery.of(context).size.width * 0.08,
                    height: 50.0,
                    child: RaisedButton(
                      child: Icon(
                        Icons.share_rounded,
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
                        Icons.menu_outlined,
                        color: projectBlue,
                      ),
                      onPressed: () {
                        //Scaffold.of(context).openDrawer();
                      },
                      color: accent,
                    )),
              ],
            ),
            body: Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.95,
                  width: MediaQuery.of(context).size.width,
                  color: projectGray2,
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      //navigation indicator
                      Container(
                        color: projectGray2,
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ButtonTheme(
                                minWidth: 30,
                                height: 30.0,
                                child: RaisedButton(
                                  child: Icon(
                                    Icons.play_arrow_outlined,
                                    color: projectGreen,
                                  ),
                                  onPressed: () {},
                                  color: accent,
                                )),
                            ButtonTheme(
                                minWidth: 30,
                                height: 30.0,
                                child: RaisedButton(
                                  child: Icon(
                                    Icons.question_answer_outlined,
                                    color: (_current >= 1)?projectGreen:projectGray,
                                  ),
                                  onPressed: () {},
                                  color: accent,
                                )),
                            ButtonTheme(
                                minWidth: 30,
                                height: 30.0,
                                child: RaisedButton(
                                  child: Icon(
                                    Icons.play_arrow_outlined,
                                    color: (_current >= 2)?projectGreen:projectGray,
                                  ),
                                  onPressed: () {},
                                  color: accent,
                                )),
                            ButtonTheme(
                                minWidth: 30,
                                height: 30.0,
                                child: RaisedButton(
                                  child: Icon(
                                    Icons.question_answer_outlined,
                                    color: (_current >= 3)?projectGreen:projectGray,
                                  ),
                                  onPressed: () {},
                                  color: accent,
                                )),
                          ],
                        ),
                      ),

                      CarouselSlider(
                        options: CarouselOptions(
                          height: MediaQuery.of(context).size.height * 0.80,
                          aspectRatio: 1 / 1,
                          viewportFraction: 1,
                          initialPage: 0,
                          enableInfiniteScroll: false,scrollPhysics:  NeverScrollableScrollPhysics(),
                          reverse: false,
                          autoPlay: false,
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: false,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          },
                          scrollDirection: Axis.horizontal,pauseAutoPlayOnTouch: false
                        ),carouselController: carouselController,
                        items: [0,1,2,3].map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                  //margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  decoration: BoxDecoration(
                                      //color: Colors.blue
                                      ),
                                  child: carouselItems[i]);
                            },
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                SlidingUpPanel(
                  header: Container(
                    color: projectGray2,
                    child: Container(
                      width: size.width * 0.95,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Comments',style: dark14Style,),
                          Container(
                            alignment: Alignment.center,
                            child: DropdownButton(
                                value: 0,
                                isExpanded: false,
                                items: [
                                  DropdownMenuItem(
                                    child: Text("Most Popular"),
                                    value: 0,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Most Recent"),
                                    value: 1,
                                  ),
                                ],
                                onChanged: (value) {
//                          setState(() {
//                            filter = value;
//                          });
                                }),
                          ),
                        ],
                      ),
                    ),
                    alignment: Alignment.center,
                    width: size.width,height: size.height * 0.05,
                  ),
                  minHeight: size.height * 0,
                  maxHeight: size.height * 0.85,
                  controller: panelController,
                  panel: Scaffold(
                    drawerScrimColor: projectLightGray2,
                    drawerEdgeDragWidth: 0,
                    body:  Container(
                      margin: EdgeInsets.fromLTRB(0, size.height * 0.05, 0, size.height * 0.02),
                      child: ListView(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
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
                                    shape: CircleBorder(side: BorderSide(color: projectGray2)), onPressed: () {  },
                                  )
                              ),
                            ),
                            title: Container(
                              width: size.width * 0.85,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('EconsKing',style: blue12boldStyle,),
                                  Text('03/06/2021',style: dark10Style,),
                                ],
                              ),),
                            subtitle:  Column(
                              children: [
                                Text('I think it is cool to be an investment banker, they are very much responsible for development in a society, they help fund projects that makes society appear civilised'),
                                Container(
                                    width: size.width,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            IconButton(icon: Icon(Icons.thumb_up), onPressed: () {  },),
                                            Text('+500'),
                                            IconButton(icon: Icon(Icons.thumb_down), onPressed: () {  },)
                                          ],
                                        ),
                                        Container(
                                            alignment: Alignment.centerRight,
                                            child: Row(
                                              children: [
                                                IconButton(
                                                  icon: Icon(Icons.comment), onPressed: () {  },
                                                ),
                                                Text('19',style: dark13BoldStyle,)
                                              ],
                                            )
                                        ),
                                      ],
                                    )
                                )

                              ],
                            ),
                            trailing: IconButton(icon: Icon(Icons.more_vert_rounded), onPressed: () {  },),
                            contentPadding: EdgeInsets.all(10),
                          ),
                          ListTile(
                            leading: CircleAvatar(
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
                                    shape: CircleBorder(side: BorderSide(color: projectGray2)), onPressed: () {  },
                                  )
                              ),
                            ),
                            title: Container(
                              width: size.width * 0.85,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Brains',style: blue12boldStyle,),
                                  Text('03/06/2021',style: dark10Style,),
                                ],
                              ),),
                            subtitle:  Column(
                              children: [
                                Text('I think it is cool to be an investment banker, they are very much responsible for development in a society, they help fund projects that makes society appear civilised'),
                                Container(
                                    width: size.width,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            IconButton(icon: Icon(Icons.thumb_up), onPressed: () {  },),
                                            Text('+500'),
                                            IconButton(icon: Icon(Icons.thumb_down), onPressed: () {  },)
                                          ],
                                        ),
                                        Container(
                                            alignment: Alignment.centerRight,
                                            child: Row(
                                              children: [
                                                IconButton(
                                                  icon: Icon(Icons.comment), onPressed: () {  },
                                                ),
                                                Text('24',style: dark13BoldStyle,)
                                              ],
                                            )
                                        ),

                                      ],
                                    )
                                )

                              ],
                            ),
                            trailing: IconButton(icon: Icon(Icons.more_vert_rounded), onPressed: () {  },),
                            contentPadding: EdgeInsets.all(10),
                          )
                        ],
                      ),
                    ),
                    floatingActionButton: FloatingActionButton(

                      onPressed: () {
                        print('got here');
                        setState(() {
                        });
                      },
                      child: Icon(Icons.add_circle),
                      backgroundColor: projectBlue,
                    ),
                    floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
                  )
                )
              ],
            )));
  }
}

class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({required Color color, required double radius})
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
      openContainer: openContainer ?? (){},
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
