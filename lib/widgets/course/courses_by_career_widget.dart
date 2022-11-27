import 'package:animations/animations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:edurald/gen/assets.gen.dart';
import 'package:edurald/repository/models/career/career.dart';
import 'package:edurald/utills/styles.dart';
import 'package:edurald/widgets/careeer/career_widget.dart';
import 'package:edurald/widgets/course/course_prompts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edurald/blocs/course_bloc/course_bloc.dart';
import 'package:edurald/repository/repos/course_repo.dart';
import 'package:edurald/repository/services/course_services.dart';

typedef CareerCLicked = Function(Career careerSelected);

class CoursesByCareerWidget extends StatelessWidget {
  const CoursesByCareerWidget({
    Key? key,
    required this.career,
    required this.callback,
  }) : super(key: key);

  final Career career;
  final CareerCLicked callback;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    String advisory = Assets.images.advisory.path;
    return Card(
      elevation: 5,
      shape: cardShape,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            OpenContainer<bool>(
                transitionType: ContainerTransitionType.fade,
                openBuilder: (context, openContainer) => CareerWidget(
                      career: career,
                    ),
                tappable: false,
                closedShape: const RoundedRectangleBorder(),
                closedElevation: 0,
                closedBuilder: (context, openContainer) {
                  return GestureDetector(
                      onTap: openContainer,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.topLeft,
                        color: projectLightBlue,
                        child: Text(
                          career.careerName ?? "Career Name",
                          style: blue14BoldStyle,
                        ),
                      ));
                }),
            OpenContainer<bool>(
                transitionType: ContainerTransitionType.fade,
                openBuilder: (context, openContainer) => CareerWidget(
                      career: career,
                    ),
                tappable: false,
                closedShape: const RoundedRectangleBorder(),
                closedElevation: 0,
                closedBuilder: (context, openContainer) {
                  return GestureDetector(
                    onTap: openContainer,
                    child: Container(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                        alignment: Alignment.topLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              career.tag_line,
                              style: dark10Style,
                            ),
                            Text(
                              'View more',
                              style: green12Style,
                            )
                          ],
                        )),
                  );
                }),
            Container(
              color: projectLightBlue,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.12,
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
                  scrollDirection: Axis.horizontal,
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
                                          width: size.width,
                                          alignment: Alignment.topCenter,
                                          height: size.height * 0.1,
                                          child: ListView.separated(
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              return Course_prompt(
                                                  state.courses[index]
                                                      .courseName,
                                                  advisory,
                                                  "1",
                                                  true);
                                            },
                                            separatorBuilder: (_, __) =>
                                                SizedBox(
                                              height: 1,
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
                                                  alignment: Alignment.center,
                                                )
                                              : Container(
                                                  child: Text(
                                                    "Loading...",
                                                    style: blue13boldStyle,
                                                  ),
                                                  alignment: Alignment.center,
                                                );
                                },
                              )));

                      // Container(
                      //   //width: MediaQuery.of(context).size.width * 0.8,
                      //   padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      //   alignment: Alignment.center,
                      //   color: accent,
                      //   child: ListView(
                      //     scrollDirection: Axis.horizontal,
                      //     children: <Widget>[
                      //       Course_prompt("advisory", advisory, "1"),
                      //     ],
                      //   ),
                      // );
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
