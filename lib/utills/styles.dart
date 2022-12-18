import 'dart:ui';

import 'package:flutter/material.dart';

Color accent = Color(0xFFFFFFFF);
Color projectOrange = Color(0xFFFFBF00);
Color projectRed = Colors.red;
Color projectGreen = Color(0xFF00A843);
Color projectGreen2 = Color(0xFF9DE700);
Color projectDeepGreen = Color(0xFF008234);
Color projectBlue = Color(0xFF083E9E);
Color projectBlue2 = Color(0xFF448AFF);
Color projectLightBlue = Color(0xFFE3F2FD);
Color projectPurple = Color(0xFF794D92);
Color projectPurple2 = Color(0xFFE6DEF4);
Color projectPink = Color(0xFFDD4CF4);
Color projectGray = Color(0xFF979797);
Color projectGray2 = Color(0xFFF3F3F3);
Color projectOverlayLightPurple = Color.fromRGBO(0, 0, 0, 0.53);
Color projectLightPurple = Color.fromRGBO(121, 77, 146, 0.1); //(0xFF794d921a);
Color projectLightGray = Color(0xFF323a56);
Color projectLightGray2 = Color(0xFFF2EDF4);
Color projectDark = Color(0xFF1D1D1D);
Color projectLightDark = Color(0xFF323a56);
Color projectYellow = Color(0xFFFFE600);

String generalFont = 'Montserrat';
String factFont = 'RubikGemstones';

final dark32Style = TextStyle(
  color: projectDark,
  fontFamily: generalFont,
  fontSize: 32.0,
  height: 1,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
);
final factStyle = TextStyle(
  color: projectDark,
  fontFamily: factFont,
  fontSize: 14.0,
  height: 1.5,
  //fontStyle: FontStyle.,
  //fontWeight: FontWeight.bold,
);
final light14Style = TextStyle(
  color: accent,
  fontFamily: generalFont,
  fontSize: 14.0,
  height: 1,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
);
final light10Style = TextStyle(
  color: accent,
  fontFamily: generalFont,
  fontSize: 10.0,
  height: 1,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.bold,
);
final light18Style = TextStyle(
  color: accent,
  fontFamily: generalFont,
  fontSize: 18.0,
  height: 1,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
);
final purple16Style = TextStyle(
  color: projectPurple,
  fontFamily: generalFont,
  fontSize: 16.0,
  height: 1,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
);
final dark10Style = TextStyle(
  color: projectDark,
  fontFamily: generalFont,
  fontSize: 10.0,
  height: 1,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
);
final dark12Style = TextStyle(
  color: projectDark,
  fontFamily: generalFont,
  fontSize: 12.0,
  height: 1,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
);
final dark12boldStyle = TextStyle(
  color: projectDark,
  fontFamily: generalFont,
  fontSize: 12.0,
  height: 1,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.bold,
);
final dark10BoldStyle = TextStyle(
  color: projectDark,
  fontFamily: generalFont,
  fontSize: 10.0,
  height: 1,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.bold,
);
final dark11BoldStyle = TextStyle(
  color: projectDark,
  fontFamily: generalFont,
  fontSize: 11.0,
  height: 1,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.bold,
);
final dark14Style = TextStyle(
  color: projectDark,
  fontFamily: generalFont,
  fontSize: 14.0,
  height: 1.5,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
);
final dark13BoldStyle = TextStyle(
  color: projectDark,
  fontFamily: generalFont,
  fontSize: 13.0,
  height: 1,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.bold,
);
final dark13Style = TextStyle(
  color: projectDark,
  fontFamily: generalFont,
  fontSize: 13.0,
  height: 1,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
);
final dark16Style = TextStyle(
  color: projectDark,
  fontFamily: generalFont,
  fontSize: 16.0,
  height: 1,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
);
final dark16BoldStyle = TextStyle(
  color: projectDark,
  fontFamily: generalFont,
  fontSize: 16.0,
  height: 1,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.bold,
);
final dark18Style = TextStyle(
  color: projectDark,
  fontFamily: generalFont,
  fontSize: 18.0,
  height: 1,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
);
final dark20Style = TextStyle(
  color: projectDark,
  fontFamily: generalFont,
  fontSize: 20.0,
  height: 1,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
);
final dark25Style = TextStyle(
  color: projectDark,
  fontFamily: generalFont,
  fontSize: 25.0,
  height: 1,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
);
final dark15Style = TextStyle(
  color: projectDark,
  fontFamily: generalFont,
  fontSize: 15.0,
  height: 1,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
);
final dark25BoldStyle = TextStyle(
  color: projectDark,
  fontFamily: generalFont,
  fontSize: 25.0,
  height: 1.2,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.bold,
);
final darkNormal25Style = TextStyle(
  color: projectDark,
  fontFamily: generalFont,
  fontSize: 25.0,
  height: 1.2,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
);
final darkNormal18Style = TextStyle(
  color: projectDark,
  fontFamily: generalFont,
  fontSize: 18.0,
  height: 1.2,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
);
final darkSemiBold19Style = TextStyle(
  color: projectDark,
  fontFamily: generalFont,
  fontSize: 19.0,
  height: 1.2,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w600,
);
final green10Style = TextStyle(
  color: projectGreen,
  fontFamily: generalFont,
  fontSize: 10.0,
  height: 1,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.bold,
);
final green12Style = TextStyle(
  color: projectGreen,
  fontFamily: generalFont,
  fontSize: 12.0,
  height: 1.5,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.bold,
);
final green14BoldStyle = TextStyle(
  color: projectGreen,
  fontFamily: generalFont,
  fontSize: 14.0,
  height: 1.5,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.bold,
);
final green18Style = TextStyle(
  color: projectGreen,
  fontFamily: generalFont,
  fontSize: 18.0,
  height: 1.5,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
);
final darkMediumStyle = TextStyle(
  color: projectDark,
  fontFamily: generalFont,
  fontSize: 20.0,
  height: 1,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
);
final buttonDefaultStyle = TextStyle(
  color: projectGreen,
  fontFamily: generalFont,
  fontSize: 14.0,
  height: 1,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
);
final buttonLightStyle = TextStyle(
  color: accent,
  fontFamily: generalFont,
  fontSize: 14.0,
  height: 1,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
);
final buttonDarkStyle = TextStyle(
  color: projectDark,
  fontFamily: generalFont,
  fontSize: 14.0,
  height: 1,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
);
final white11Style = TextStyle(
  color: accent,
  fontFamily: generalFont,
  fontSize: 11.0,
  height: 1,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
);
final white12BoldStyle = TextStyle(
  color: accent,
  fontFamily: factFont,
  fontSize: 12.0,
  height: 1,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.bold,
);
final white12Style = TextStyle(
  color: accent,
  fontFamily: generalFont,
  fontSize: 12.0,
  height: 1,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
);
final white14Style = TextStyle(
  color: accent,
  fontFamily: generalFont,
  fontSize: 14.0,
  height: 1,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
);
final white18Style = TextStyle(
  color: accent,
  fontFamily: generalFont,
  fontSize: 18.0,
  height: 1,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
);
final white25Style = TextStyle(
  color: accent,
  fontFamily: generalFont,
  fontSize: 25.0,
  height: 1,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
);
final gray11Style = TextStyle(
  color: projectGray,
  fontFamily: generalFont,
  fontSize: 11.0,
  height: 1,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
);
final gray14Style = TextStyle(
  color: projectGray,
  fontFamily: generalFont,
  fontSize: 14.0,
  height: 1,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
);
final gray25Style = TextStyle(
  color: projectGray,
  fontFamily: generalFont,
  fontSize: 25.0,
  height: 1,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
);
final orange14Style = TextStyle(
  color: projectOrange,
  fontFamily: generalFont,
  fontSize: 14.0,
  height: 1,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
);
final gray19Style = TextStyle(
  color: projectGray,
  fontFamily: generalFont,
  fontSize: 15.0,
  height: 1,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
);
final gray12Style = TextStyle(
  color: projectGray,
  fontFamily: generalFont,
  fontSize: 12.0,
  height: 1,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
);
final blue12Style = TextStyle(
  color: projectBlue,
  fontFamily: generalFont,
  fontSize: 12.0,
  height: 1,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
);
final blue12boldStyle = TextStyle(
  color: projectBlue,
  fontFamily: generalFont,
  fontSize: 12.0,
  height: 1,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.bold,
);
final blue13boldStyle = TextStyle(
  color: projectBlue,
  fontFamily: generalFont,
  fontSize: 13.0,
  height: 1,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.bold,
);
final red13boldStyle = TextStyle(
  color: projectRed,
  fontFamily: generalFont,
  fontSize: 13.0,
  height: 1,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.bold,
);
final blue14BoldStyle = TextStyle(
  color: projectBlue,
  fontFamily: generalFont,
  fontSize: 14.0,
  height: 1,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.bold,
);
final blue14Style = TextStyle(
  color: projectBlue,
  fontFamily: generalFont,
  fontSize: 14.0,
  height: 1,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
);
final blue20Style = TextStyle(
  color: projectBlue,
  fontFamily: generalFont,
  fontSize: 20.0,
  height: 1,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
);
final blue25BoldStyle = TextStyle(
  color: projectBlue,
  fontFamily: generalFont,
  fontSize: 25.0,
  height: 1.2,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.bold,
);
final grayUnderline15Style = TextStyle(
    color: projectGray,
    fontFamily: generalFont,
    fontSize: 15.0,
    height: 1,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.underline);
final securityStyle = TextStyle(
  color: accent,
  fontFamily: 'CM Sans Serif',
  fontSize: 20.0,
  height: 1.5,
  fontWeight: FontWeight.w900,
);
final securityStyle2 = TextStyle(
  //color: landingBG,
  fontFamily: 'CM Sans Serif',
  fontSize: 18.0,
  height: 1.5,
  fontWeight: FontWeight.w900,
);
final red10Style = TextStyle(
  color: projectRed,
  fontFamily: generalFont,
  fontSize: 10.0,
  height: 1,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.bold,
);
final red11Style = TextStyle(
  color: projectRed,
  fontFamily: generalFont,
  fontSize: 11.0,
  height: 1,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.bold,
);
final red14Style = TextStyle(
  color: projectRed,
  fontFamily: generalFont,
  fontSize: 14.0,
  height: 1,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.bold,
);
final tokenBox = BoxDecoration(
  border: Border.all(
    color: projectBlue,
    //width: 5.0,
  ),
);
final tokenButtons = BoxDecoration(
  shape: BoxShape.circle,
  border: Border.all(
    color: accent,
    //width: 5.0,
  ),
);
final buttonShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(10.0),
);
final textFieldDecoration = InputDecoration(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: projectGreen),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: projectGreen),
    ),
    border: UnderlineInputBorder(
      borderSide: BorderSide(color: projectGreen),
    ));
final cardShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(10.0),
);
