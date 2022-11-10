import 'package:edurald/utills/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Course_prompt extends StatefulWidget {
  const Course_prompt({Key? key}) : super(key: key);

  @override
  State<Course_prompt> createState() => _Course_promptState();
}

class _Course_promptState extends State<Course_prompt> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
            onPressed: null,
            elevation: 2.0,
            fillColor: projectGray2,
            child: Image.asset(
              advisory,
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
                'Advisory',
                style: dark12Style,
                softWrap: true,
                textAlign: TextAlign.center,
              )),
        ]);
  }
}
