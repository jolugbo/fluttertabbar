import 'package:connectivity/connectivity.dart';
import 'package:edurald/blocs/career_bloc/career_bloc.dart';
import 'package:edurald/blocs/course_bloc/course_bloc.dart';
import 'package:edurald/gen/assets.gen.dart';
import 'package:edurald/repository/repos/career_repo.dart';
import 'package:edurald/repository/repos/course_repo.dart';
import 'package:edurald/repository/services/course_services.dart';
import 'package:edurald/widgets/course/course_prompts.dart';
import 'package:edurald/widgets/course/courses_by_career_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:edurald/repository/models/strings.dart';
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
  String advisory = Assets.images.advisory.path;

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
                    height: size.height,
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
                                    //await getCoursesByCareer();
                                    // I am connected to a wifi network.
                                  }
                                },
                                highlightElevation: 0.8,
                              )),
                        ),
                        Container(
                          height: size.height * 0.5,
                          width: size.width * 0.8,
                          child: RepositoryProvider(
                              create: (context) =>
                                  CourseRepository(service: CourseService()),
                              child: MultiBlocProvider(
                                  providers: [
                                    // BlocProvider<CareerBloc>(
                                    //   create: (context) => CareerBloc(
                                    //     careerRepository: context.read<CareerRepository>(),
                                    //   )..add(GetCareers()),
                                    // ),
                                    BlocProvider<CourseBloc>(
                                      create: (context) => CourseBloc(
                                        courseRepository:
                                            context.read<CourseRepository>(),
                                      )..add(GetCoursesByCareer(
                                          careerId:
                                              "d32bf610-2a4f-11ed-b0e6-e76c95bb498e")),
                                    ),
                                  ],
                                  child: BlocBuilder<CourseBloc, CourseState>(
                                    buildWhen: (previous, current) =>
                                        current.status.isSuccess,
                                    builder: (context, state) {
                                      return state.status.isSuccess
                                          ? Container(
                                              width: size.width,
                                              alignment: Alignment.topCenter,
                                              height: size.height * 0.1,
                                              // padding: EdgeInsets.fromLTRB(
                                              //     size.width * 0.01,
                                              //     size.height * 0.03,
                                              //     size.width * 0.01,
                                              //     size.height * 0.1),
                                              child: ListView.separated(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemBuilder: (context, index) {
                                                  return Course_prompt(
                                                      state.courses[index]
                                                          .course_name,
                                                      advisory,
                                                      "1");
                                                },
                                                separatorBuilder: (_, __) =>
                                                    SizedBox(
                                                  height: 0.0,
                                                ),
                                                itemCount: state.courses.length,
                                              ),
                                            )
                                          : state.status.isLoading
                                              ? Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                )
                                              : state.status.isError
                                                  ? const SizedBox(
                                                      child: Text("Error"),
                                                    )
                                                  : const SizedBox(
                                                      child: Text("Error"),
                                                    );
                                    },
                                  ))),
                        ),
                        Course_prompt(
                            "Advisory", Assets.images.advisory.path, "001"),
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
