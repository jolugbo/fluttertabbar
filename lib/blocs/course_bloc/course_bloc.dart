import 'package:edurald/repository/models/course/course.dart';
import 'package:edurald/repository/repos/course_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'course_state.dart';
part 'course_event.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseBloc({
    required this.courseRepository,
  }) : super(const CourseState()) {
    on<GetCourses>(_mapGetCoursesEventToState);
    on<GetCoursesByCareer>(_mapGetCoursesByCareerEventToState);
  }
  final CourseRepository courseRepository;

  void _mapGetCoursesEventToState(
      GetCourses event, Emitter<CourseState> emit) async {
    emit(state.copyWith(status: CourseStatus.loading));
    try {
      final courses = await courseRepository.getCourses();
      print("got heree");
      print(courses);
      emit(
        state.copyWith(
          status: CourseStatus.success,
          courses: courses,
        ),
      );
    } catch (error, stacktrace) {
      print(stacktrace);
      emit(state.copyWith(status: CourseStatus.error));
    }
  }

  void _mapGetCoursesByCareerEventToState(
      GetCoursesByCareer event, Emitter<CourseState> emit) async {
    emit(state.copyWith(status: CourseStatus.loading));
    try {
      final courses = await courseRepository.getCoursesByCareer();
      print("got heree");
      print(courses);
      emit(
        state.copyWith(
          status: CourseStatus.success,
          courses: courses,
        ),
      );
    } catch (error, stacktrace) {
      print(stacktrace);
      emit(state.copyWith(status: CourseStatus.error));
    }
  }
}
