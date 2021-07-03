import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

// class OpenContainerWrapper extends StatelessWidget {
//   const OpenContainerWrapper({this.closedBuilder,this.transitionType,this.child});
//   final CloseContainerBuilder closedBuilder;
//   final ContainerTransitionType transitionType;
//   final Widget child;
//
//   @override
//   Widget build(BuildContext context) {
//     return OpenContainer<bool>(
//       transitionType: transitionType,
//       openBuilder: (context, openContainer) =>
//      child,tappable: false,
//       closedBuilder: closedBuilder,
//     );
//   }
// }


class InkWellOverlay extends StatefulWidget {
   InkWellOverlay({required this.openContainer,required this.width,required this.height,required this.child,});
  final VoidCallback openContainer;
  final double width;
  final double height;
  final Widget child;


   @override
   InkWellOverlayState createState() => InkWellOverlayState();
}

class InkWellOverlayState extends State<InkWellOverlay> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: InkWell(
        onTap: widget.openContainer,
        child: widget.child,),);
  }
}