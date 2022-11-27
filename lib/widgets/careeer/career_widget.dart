import 'package:edurald/gen/assets.gen.dart';
import 'package:edurald/repository/models/career/career.dart';
import 'package:edurald/utills/styles.dart';
import 'package:flutter/material.dart';
import 'package:float_column/float_column.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:edurald/widgets/course/course_prompts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edurald/blocs/course_bloc/course_bloc.dart';
import 'package:edurald/repository/repos/course_repo.dart';
import 'package:edurald/repository/services/course_services.dart';

class CareerWidget extends StatelessWidget {
  const CareerWidget({
    Key? key,
    required this.career,
  }) : super(key: key);

  final Career career;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    String advisory = Assets.images.advisory.path;
    return Stack(children: [
      AnimatedPositioned(
          top: size.height * 0.02,
          duration: Duration(seconds: 1),
          child: Container(
            color: Colors.transparent,
            height: size.height * 0.04,
            width: size.width * 0.1,
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: RawMaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              elevation: 5.0,
              fillColor: accent,
              child: Icon(Icons.cancel,
                  color: projectRed), //,backgroundColor: Colors.green,
              padding: EdgeInsets.all(5.0),
              shape: CircleBorder(
                  side: BorderSide(
                color: Colors.transparent,
              )),
            ),
          )),
      AnimatedPositioned(
        top: size.height * 0.01,
        duration: Duration(seconds: 1),
        child: Container(
          height: size.height * 0.15,
          width: size.width,
          child: Center(
            child: Text(
              career.careerName ?? "Career Name",
              style: blue25BoldStyle,
            ),
          ),
        ),
      ),
      AnimatedPositioned(
        top: size.height * 0.12,
        left: 10,
        right: 10,
        duration: Duration(seconds: 1),
        child: Container(
            alignment: Alignment.center,
            width: size.width,
            height: size.height * 0.9,
            //color: projectBlue2,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Container(
                  width: size.width,
                  child: Text(
                    "What this major is about.",
                    style: blue14BoldStyle,
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Container(
                    color: accent,
                    alignment: Alignment.center,
                    width: size.width,
                    child: FloatColumn(
                      children: [
                        Floatable(
                          float: FCFloat.end,
                          maxWidthPercentage: 0.4,
                          padding: const EdgeInsetsDirectional.only(end: 2),
                          child: Image.network(
                            career.icon ?? Assets.images.advisory.path,
                            width: size.width * 0.3,
                          ),
                        ),
                        WrappableText(
                            text: TextSpan(
                                text: career.description, style: dark14Style),
                            padding: EdgeInsets.only(right: 15)),
                      ],
                    )),
                SizedBox(height: size.height * 0.03),
                Container(
                  width: size.width,
                  child: Text(
                    "How to know if this is for you.",
                    style: blue14BoldStyle,
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Container(
                  width: size.width,
                  child: Text(
                    career.career_fit,
                    style: dark14Style,
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  width: size.width,
                  child: Text(
                    "College courses.",
                    style: blue14BoldStyle,
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Container(
                  width: size.width,
                  child: Text(
                    "listed below are some of the areas of knowledge this career path covers",
                    style: dark14Style,
                  ),
                ),
                Container(
                  //color: projectLightBlue,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height * 0.38,
                      aspectRatio: 1,
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: false,
                      autoPlayInterval: Duration(seconds: 4),
                      autoPlayAnimationDuration: Duration(seconds: 1),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        // setState(() {
                        //   //_current = index;
                        // });
                      },
                      scrollDirection: Axis.vertical,
                    ),
                    items: [0, 1, 2].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return RepositoryProvider(
                              create: (context) =>
                                  CourseRepository(service: CourseService()),
                              child: MultiBlocProvider(
                                  providers: [
                                    BlocProvider<CourseBloc>(
                                      create: (context) => CourseBloc(
                                        courseRepository:
                                            context.read<CourseRepository>(),
                                      )..add(GetCoursesByCareer(
                                          careerId: career.career_id)),
                                    ),
                                  ],
                                  child: BlocBuilder<CourseBloc, CourseState>(
                                    buildWhen: (previous, current) =>
                                        current.status.isSuccess,
                                    builder: (context, state) {
                                      return state.status.isSuccess
                                          ? Container(
                                              width: size.width * 0.65,
                                              alignment: Alignment.topLeft,
                                              height: size.height * 0.35,
                                              color: projectLightBlue,
                                              child: ListView.separated(
                                                scrollDirection: Axis.vertical,
                                                clipBehavior: Clip.hardEdge,
                                                itemBuilder: (context, index) {
                                                  return Course_prompt(
                                                      state.courses[index]
                                                          .courseName,
                                                      advisory,
                                                      "1",
                                                      false);
                                                },
                                                separatorBuilder: (_, __) =>
                                                    SizedBox(
                                                  height: 10,
                                                ),
                                                itemCount: state.courses.length,
                                              ),
                                            )
                                          : state.status.isLoading
                                              ? Container(
                                                  child: Text(
                                                    "Loading...",
                                                    style: blue13boldStyle,
                                                  ),
                                                  alignment: Alignment.center,
                                                )
                                              : state.status.isError
                                                  ? Container(
                                                      child: Text(
                                                        "Error...",
                                                        style: red13boldStyle,
                                                      ),
                                                      alignment:
                                                          Alignment.center,
                                                    )
                                                  : Container(
                                                      child: Text(
                                                        "Loading...",
                                                        style: blue13boldStyle,
                                                      ),
                                                      alignment:
                                                          Alignment.center,
                                                    );
                                    },
                                  )));
                        },
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  width: size.width,
                  child: Text(
                    "How to know if this is for you.",
                    style: blue14BoldStyle,
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Container(
                  width: size.width,
                  child: Text(
                    career.career_fit,
                    style: dark14Style,
                  ),
                ),
              ],
            )),
      ),
    ]);
  }
}
