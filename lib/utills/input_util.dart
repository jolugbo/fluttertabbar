import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Widget input({
//  LoadingStatus status,
//  String error,
//  TextEditingController controller,
//  Function(String) changeCallback,
//  String hint,
//  bool obscure = false,
//  TextInputType type = TextInputType.text,
//  FocusNode node
//}) => Padding(
//  padding: new EdgeInsets.only(right: node.hasFocus?16.0:32.0,top: 16.0, left:node.hasFocus?16.0:0.0),
//  child: Container(
//    alignment: new Alignment(0.5, 0.5),
//    height: 56.0,
//    decoration: BoxDecoration(
//      color: paydayLightPurple,
//      border: Border(bottom: BorderSide(
//          color: node.hasFocus?paydayGreen:paydayLightPurple,
//          width:1.0
//      )),
//    ),
//    child:  Padding(
//      padding: const EdgeInsets.only(left: 16.0,bottom: 8.0),
//      child: new TextField(
//        textAlignVertical: TextAlignVertical.bottom,
//        textAlign: TextAlign.left,
//        maxLines: 1,
//        focusNode: node,
//        style: TextStyle(
//            fontSize: 18.0
//        ),
//        obscureText: obscure,
//        keyboardType: type,
//        controller: controller,
//        decoration: InputDecoration(
//          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: paydayGreen),),
//        ),
//        onChanged: (value){
//          changeCallback(value);
//        },
//      ),
//    ),
//  ),
//);

Widget error(String error) => Padding(
  padding: EdgeInsets.only(top: 2.0),
  child: new Text(error,
    style: TextStyle(
        fontSize: 10.0,
        color: Colors.red
    ),
  ),
);
