//import 'package:cryptowire/utilities/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animator/animator.dart';


class WidgetAnimator extends StatefulWidget {
  WidgetAnimator({Key key, this.animType, this.component,this.test,this.scaleSize,this.time,this.animPattern,this.pixle,this.xAxis,this.yAxis,this.transition}) : super(key: key);
  final String animType;
  final Widget component;
  final Duration time;
  final double yAxis;
  final double xAxis;
  final double scaleSize;
  final Curve animPattern;
  final Color pixle;
  final Type transition;
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

class imgAnimation extends AnimatedWidget{
  const imgAnimation({Key key, AnimationController controller})
      : super(key: key, listenable: controller,);
  Animation<double> get _progress => listenable;
  @override
  Widget build(BuildContext context) {
    return
      Transform.scale(
        scale: _progress.value+1,
        child: Image(width: MediaQuery.of(context).size.height * 0.4, height: MediaQuery.of(context).size.height * 0.25, image: AssetImage(
            'assets/femi.png'
        )),

      );
  }

}

class ComponentAnimation extends StatelessWidget{
  ComponentAnimation({Key key, this.component,this.time,this.width,this.height,this.transition}) : super(key: key);
  final Widget component;
  final Duration time;
  final double width;
  final double height;
  final Type transition;
  Widget build(BuildContext context) {
    if(transition == RotationTransition){
      return Animator<double>(
        resetAnimationOnRebuild: true,
        duration: time,
        cycles: 2,
        //curve: Curves.bounceInOut,
        repeats:99,
        builder: (_, anim, __) => Center(
          child: RotationTransition(
              alignment: Alignment.center,
              turns: anim.animation,
              child: component
          ),
        ),
      );
    }
    else if(transition == ScaleTransition){
      return Animator<double>(
        resetAnimationOnRebuild: true,
        duration: time,
        cycles: 99,
        curve: Curves.ease,
        builder: (_, anim, __) => Center(
          child: ScaleTransition(
              scale: anim.animation,
              alignment: Alignment.center,
              child: component
          ),
        ),
      );
    }
    else if(transition == PositionedTransition){
      return Animator<double>(
        resetAnimationOnRebuild: true,
        duration: time,
        cycles: 99,
        curve: Curves.ease,
        //repeats: 99,
        builder: (_, anim, __) => Center(
          child: SlideTransition(
              transformHitTests: false,
              position: Tween<Offset>(
                begin: Offset(0.00, -0.05),
                end: const Offset(0.06, 0),
              ).animate(CurvedAnimation(
                  curve: Curves.easeInOut,
                  reverseCurve: Curves.decelerate,
                  parent: anim.animation
              )),
              child: component
          ),
        ),
      );
    }
  }
}


class imgAnimation2 extends StatelessWidget{
  imgAnimation2({Key key, this.url,this.time,this.width,this.height,this.transition,this.beginx,this.endx,this.beginy,this.endy}) : super(key: key);
  final String url;
  final Duration time;
  final double width;
  final double height;
  final double beginx;
  final double endx;
  final double beginy;
  final double endy;
  final Type transition;
  Widget build(BuildContext context) {
    if(transition == RotationTransition){
    return Animator<double>(
      resetAnimationOnRebuild: true,
      duration: time,
      cycles: 2,
      //curve: Curves.bounceInOut,
      repeats:99,
      builder: (_, anim, __) => Center(
        child: RotationTransition(
          alignment: Alignment.center,
        turns: anim.animation,
        child: Image(width: width, height: height, image: AssetImage(
                url
            ),)
        ),
      ),
    );
    }
    else if(transition == ScaleTransition){
      return Animator<double>(
        resetAnimationOnRebuild: true,
        duration: time,
        cycles: 99,
        curve: Curves.bounceInOut,
        builder: (_, anim, __) => Center(
          child: ScaleTransition(
              scale: anim.animation,

              alignment: Alignment.center,
              child: Image(width: width, height: height, image: AssetImage(
                  url
              ),)
          ),
        ),
      );
    }
    else if(transition == PositionedTransition){

      return Animator<double>(
        resetAnimationOnRebuild: true,
        duration: time,
        cycles: 99,
        curve: Curves.ease,
        //repeats: 99,
        builder: (_, anim, __) => Center(
          child: SlideTransition(
            transformHitTests: false,
            position: Tween<Offset>(
              begin: Offset(beginx, beginy),
              end:  Offset(endx, endy),
            ).animate(CurvedAnimation(
                curve: Curves.linear,reverseCurve: Curves.linear,
                parent: anim.animation
            )),
              child: Image(width: width, height: height, image: AssetImage(
                  url
              ),)
          ),
        ),
      );
    }
  }
}
