import 'package:edurald/utills/styles.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class Course_prompt extends StatelessWidget {
  String? courseName;
  String courseIcon;
  String courseID;

  Course_prompt(this.courseName, this.courseIcon, this.courseID);

  @override
  Widget build(BuildContext context) {
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
        return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
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
                shape: CircleBorder(side: BorderSide(color: projectGray2)),
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
            ]);
      },
    );
  }
}
