import 'package:edurald/utills/imageanimations.dart';
import 'package:edurald/utills/styles.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class Course_prompt extends StatelessWidget {
  String? courseName;
  String courseIcon;
  int courseID;
  bool displayVertical;

  Course_prompt(
      this.courseName, this.courseIcon, this.courseID, this.displayVertical);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return OpenContainer<bool>(
      transitionType: ContainerTransitionType.fade,
      openBuilder: (context, openContainer) => Container(),
      //     const _DetailsCard(
      //   id: 'Asset Management',
      // ),
      tappable: false,
      closedShape: const RoundedRectangleBorder(),
      closedElevation: 0,
      closedBuilder: (context, openContainer) {
        return WidgetAnimator(
          component: (displayVertical)
              ? Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                      RawMaterialButton(
                        onPressed: openContainer,
                        elevation: 2.0,
                        fillColor: projectGray2,
                        child: Image.asset(
                          courseIcon,
                          width: 30,
                          height: 30,
                        ),
                        padding: EdgeInsets.all(10.0),
                        shape:
                            CircleBorder(side: BorderSide(color: projectGray2)),
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                          alignment: Alignment.center,
                          width: 120,
                          child: Text(
                            courseName ?? "test",
                            style: dark12Style,
                            softWrap: true,
                            textAlign: TextAlign.center,
                          )),
                    ])
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                      Container(
                          height: size.height * 0.05,
                          width: size.width * 0.1,
                          padding: EdgeInsets.fromLTRB(10, 5, 5, 0),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "" + courseID.toString() + ".",
                            style: dark16BoldStyle,
                            softWrap: true,
                            textAlign: TextAlign.left,
                          )),
                      Container(
                          padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                          alignment: Alignment.centerLeft,
                          width: size.width * 0.4,
                          child: Text(
                            courseName ?? "test",
                            style: dark12Style,
                            softWrap: true,
                            textAlign: TextAlign.left,
                          )),
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 5, 2, 0),
                        alignment: Alignment.centerLeft,
                        width: size.width * 0.187,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.people_alt_rounded,
                              color: projectGray,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.01,
                            ),
                            Text(
                              '0',
                              style: gray12Style,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.arrow_circle_right_rounded, color: projectGray)
                    ]),
          transition: ScaleTransition,
          animPattern: Curves.easeIn,
          pixle: Colors.transparent,
          time: Duration(seconds: 1),
          animType: "nothing",
          xAxis: 0,
          yAxis: 0,
        );
      },
    );
  }
}
