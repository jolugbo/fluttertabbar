part of 'course_bloc.dart';

class CourseEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetCourses extends CourseEvent {}

class GetCoursesByCareer extends CourseEvent {
  GetCoursesByCareer({
    required this.careerId,
  });
  final String careerId;

  @override
  List<Object?> get props => [careerId];
}

class SelectCourse extends CourseEvent {
  SelectCourse({
    required this.idSelected,
  });
  final String idSelected;

  @override
  List<Object?> get props => [idSelected];
}
