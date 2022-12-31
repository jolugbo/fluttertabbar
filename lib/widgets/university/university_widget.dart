import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:edurald/repository/models/universities/accredited_institutions.dart';
import 'package:edurald/utills/styles.dart';
import 'package:flutter/material.dart';

class university_prompt extends StatelessWidget {
  Accredited_Institutions? university;

  university_prompt(this.university);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Accordion(
        headerBackgroundColorOpened: projectBlue2,
        scaleWhenAnimating: true,
        contentHorizontalPadding: 0,
        disableScrolling: true,
        openAndCloseAnimation: true,
        headerPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
        sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
        sectionClosingHapticFeedback: SectionHapticFeedback.light,
        children: [
          AccordionSection(
              isOpen: false,
              headerBackgroundColor: projectBlue2,
              rightIcon: Icon(Icons.arrow_downward_sharp, color: accent),
              headerBackgroundColorOpened: projectBlue,
              paddingBetweenClosedSections: 10,
              header: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(5),
                child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: size.width * 0.15,
                        alignment: Alignment.centerLeft,
                        child: Image.network(
                          university!.logo,
                          height: size.height * 0.06,
                        ),
                      ),
                      Container(
                          width: size.width * 0.5,
                          //padding: EdgeInsets.fromLTRB(0, 5, 5, 0),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            university!.name,
                            style: light14BoldStyle,
                            softWrap: true,
                            textAlign: TextAlign.left,
                          )),
                    ]),
              ),
              content: Container(
                  color: projectLightGray2, height: size.height * 0.2))
        ]);
  }

  //   OpenContainer<bool>(
  //     transitionType: ContainerTransitionType.fade,
  //     openBuilder: (context, openContainer) => Container(),
  //     //     const _DetailsCard(
  //     //   id: 'Asset Management',
  //     // ),
  //     tappable: false,
  //     closedShape: const RoundedRectangleBorder(),
  //     closedElevation: 0,
  //     closedBuilder: (context, openContainer) {
  //       return WidgetAnimator(
  //         component: Row(
  //             mainAxisSize: MainAxisSize.min,
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: <Widget>[
  //               Container(
  //                 width: size.width * 0.15,
  //                 alignment: Alignment.centerLeft,
  //                 child: Image.network(
  //                   university!.logo,
  //                   height: size.height * 0.1,
  //                 ),
  //               ),
  //               Container(
  //                   width: size.width * 0.6,
  //                   padding: EdgeInsets.fromLTRB(0, 5, 5, 0),
  //                   alignment: Alignment.centerLeft,
  //                   child: Text(
  //                     university!.name,
  //                     style: dark15Style,
  //                     softWrap: true,
  //                     textAlign: TextAlign.left,
  //                   )),
  //               Icon(Icons.arrow_circle_right_rounded, color: projectGreen)
  //             ]),
  //         transition: ScaleTransition,
  //         animPattern: Curves.easeIn,
  //         pixle: Color.fromARGB(0, 15, 0, 0),
  //         time: Duration(seconds: 1),
  //         animType: "nothing",
  //         xAxis: 0,
  //         yAxis: 0,
  //       );
  //     },
  //   );
  // }
}
