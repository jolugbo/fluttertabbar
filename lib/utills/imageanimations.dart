//import 'package:cryptowire/utilities/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animator/animator.dart';


class WidgetAnimator extends StatefulWidget {
  WidgetAnimator({Key? key, this.animType,required this.component,this.test,this.scaleSize,required this.time,required this.animPattern,this.pixle,required this.xAxis,required this.yAxis,this.transition}) : super(key: key);
  final String? animType;
  final Widget component;
  final Duration time;
  final double yAxis;
  final double xAxis;
  final double? scaleSize;
  final Curve animPattern;
  final Color? pixle;
  final Type? transition;
  var test;

  @override
  WidgetAnimatorState createState() => WidgetAnimatorState();
}

class WidgetAnimatorState extends State<WidgetAnimator> {

  @override
  Widget build(BuildContext context) {
    if(widget.transition == Transform){
      return AnimatedContainer(
          duration: widget.time,
          key: widget.key,
          curve: widget.animPattern,
          color: widget.pixle,
          transform: Matrix4.identity()
            ..translate(widget.xAxis,widget.yAxis),
          child: widget.component
      );
    }

    else if(widget.transition == ScaleTransition){
      return AnimatedContainer(
        duration: widget.time,
        curve: widget.animPattern,
        color: widget.pixle,
        height: widget.scaleSize,
        child: widget.component,

        //transform: Matrix4.identity()..scale(widget.scaleSize),
      );
    }

    else {
      return AnimatedContainer(
          duration: widget.time,
          key: widget.key,
          curve: widget.animPattern,
          color: widget.pixle,
          transform: Matrix4.identity()..scale(widget.scaleSize),
          child: widget.component
      );
    }
  }
}




