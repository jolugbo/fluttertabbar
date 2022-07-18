import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'styles.dart';

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

Future<bool?> message(String message) => Fluttertoast.showToast(
  msg: message,webShowClose: true,
  toastLength: Toast.LENGTH_LONG,
  gravity: ToastGravity.CENTER,
  timeInSecForIosWeb: 1,
  backgroundColor: projectGreen,
  textColor: accent,
  fontSize: 16.0
);

Future<void> showMyDialog(context,String title,String body) async =>   {
   showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title:  Text(title,textAlign: TextAlign.center,style: blue20Style,),
        content: SingleChildScrollView(
          child: ListBody(
            children:  <Widget>[
              Text(body),
            ],
          ),
        ),
        actions: <Widget>[
          ButtonTheme(
              minWidth: MediaQuery.of(context).size.width ,
              height: 40,
              buttonColor: Colors.transparent,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(color: projectBlue)
                ),
                color: projectBlue,
                child: Text('Ok',style: white18Style,),
                onPressed: () async {
                  Navigator.of(context).pop();
                },
                highlightElevation: 0.8,
              )
          ),
          // OutlineButton(
          //   child:  Text('Approve',style: blue12boldStyle),
          //   onPressed: () {
          //     Navigator.of(context).pop();
          //   },
          // ),
        ],
      );
    },
  )
};
