import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:edurald/models/strings.dart';
import 'package:edurald/utills/styles.dart';
import '../administration/administration_logic.dart';

class functionTest_page extends StatefulWidget {
  functionTest_page({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  functionTest_state createState() => functionTest_state();
}

class functionTest_state extends State<functionTest_page>
    with TickerProviderStateMixin {
  int blurrySize = 0;
  bool showLoader = false;

  void showPopUp(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        //resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
            child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            //overflow: Overflow.visible,
            children: <Widget>[
              AnimatedPositioned(
                  top: 0,
                  duration: Duration(seconds: 1),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                  )),

              //bottom rect
              AnimatedPositioned(
                  top: size.height * 0.1,
                  height: size.height,
                  width: size.width,
                  duration: Duration(seconds: 0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          alignment: Alignment.center,
                          child: ButtonTheme(
                              minWidth: MediaQuery.of(context).size.width * 0.6,
                              height: 40,
                              buttonColor: Colors.transparent,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    side: BorderSide(color: projectBlue)),
                                color: projectBlue,
                                child: Text(
                                  'Fetch Careers',
                                  style: white18Style,
                                ),
                                onPressed: () async {
                                  var connectivityResult = await (Connectivity()
                                      .checkConnectivity());
                                  if (connectivityResult ==
                                      ConnectivityResult.none) {
                                    showPopUp(internet_error);
                                    // Mobile is not Connected to Internet
                                  } else if (connectivityResult ==
                                      ConnectivityResult.mobile) {
                                    // I am connected to a mobile network.
                                  } else if (connectivityResult ==
                                      ConnectivityResult.wifi) {
                                    await getCareers();
                                    // I am connected to a wifi network.
                                  }
                                },
                                highlightElevation: 0.8,
                              )),
                        ),
                      ],
                    ),
                  )),

              AnimatedPositioned(
                  top: 10,
                  duration: Duration(seconds: 1),
                  child: Container(
                    height: size.height * blurrySize,
                    color: Colors.transparent,
                    width: size.width * blurrySize,
                  )),

              if (showLoader)
                AnimatedPositioned(
                  top: MediaQuery.of(context).size.height * 0,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  duration: Duration(milliseconds: 500),
                  child: Center(
                    child: new CircularProgressIndicator(),
                  ),
                )
            ],
          ),
        )));
  }
}
