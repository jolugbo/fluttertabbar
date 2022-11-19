part of 'course_bloc.dart';

class CourseEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetCourses extends CourseEvent {}

class GetCoursesByCareer extends CourseEvent {}

class SelectCourse extends CourseEvent {
  SelectCourse({
    required this.idSelected,
  });
  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}
