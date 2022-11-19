//

//               OLUFEMI         ADETOLA             <bold!>JOLUGBO<bold!>

//
import 'package:animations/animations.dart';
import 'package:edurald/blocs/course_bloc/course_bloc.dart';
import 'package:edurald/repository/repos/course_repo.dart';
import 'package:edurald/repository/services/course_services.dart';
import 'package:edurald/blocs/career_bloc/career_bloc.dart';
import 'package:edurald/repository/repos/career_repo.dart';
import 'package:edurald/repository/services/career_services.dart';
import 'package:edurald/widgets/course/courses_by_career_widget.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:edurald/utills/pagetransitionutill.dart';
import 'package:edurald/utills/styles.dart';

import '../../gen/assets.gen.dart';
import '../dashboard/dashboard.dart';

class learn extends StatefulWidget {
  learn({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _LearnPageState createState() => _LearnPageState();
}

class _LearnPageState extends State<learn> with TickerProviderStateMixin {
  String placeholder = Assets.images.ph.path;
  String bgMain = Assets.images.bg.path;
  String advisory = Assets.images.advisory.path;
  String assetManagement = Assets.images.assetManagement.path;
  String capitalMarket = Assets.images.capitalMarket.path;
  String trading = Assets.images.trading.path;
  bool showBreakDown = false;
  bool showdashboard = true;
  bool showinvestment = false;
  bool showtopup = false;
  bool showwallet = false;
  bool showmore = false;
  ContainerTransitionType _transitionType = ContainerTransitionType.fade;
  double lowerDashElementPosition = 0.33;
  int _currentIndex = 0;
  Icon dropDown = Icon(
    Icons.remove_red_eye,
    color: accent,
  );
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: RepositoryProvider(
          create: (context) => CareerRepository(service: CareerService()),
          child: MultiBlocProvider(
              providers: [
                BlocProvider<CareerBloc>(
                  create: (context) => CareerBloc(
                    careerRepository: context.read<CareerRepository>(),
                  )..add(GetCareers()),
                ),
                BlocProvider<CourseBloc>(
                  create: (context) => CourseBloc(
                    courseRepository: context.read<CourseRepository>(),
                  )..add(GetCoursesByCareer()),
                ),
              ],
              child: Stack(
                //overflow: Overflow.visible,
                children: <Widget>[
                  //dashboard lower
                  CustomScrollView(
                    slivers: <Widget>[
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return BlocBuilder<CareerBloc, CareerState>(
                              buildWhen: (previous, current) =>
                                  current.status.isSuccess,
                              builder: (context, state) {
                                return state.status.isSuccess
                                    ? Container(
                                        width: size.width,
                                        alignment: Alignment.topCenter,
                                        height: size.height,
                                        padding: EdgeInsets.fromLTRB(
                                            size.width * 0.01,
                                            size.height * 0.03,
                                            size.width * 0.01,
                                            size.height * 0.1),
                                        child: ListView.separated(
                                          scrollDirection: Axis.vertical,
                                          itemBuilder: (context, index) {
                                            return CoursesByCareerWidget(
                                              career: state.careers[index],
                                              callback: (careerSelected) => {},
                                            );
                                          },
                                          separatorBuilder: (_, __) => SizedBox(
                                            height: 30.0,
                                          ),
                                          itemCount: state.careers.length,
                                        ),
                                      )
                                    : state.status.isLoading
                                        ? Center(
                                            child: CircularProgressIndicator(),
                                          )
                                        : state.status.isError
                                            ? const SizedBox()
                                            : const SizedBox();
                              },
                            );
                          },
                          childCount: 1,
                        ),
                      ),
                    ],
                  ),
                ],
              ))),
    );
  }
}
