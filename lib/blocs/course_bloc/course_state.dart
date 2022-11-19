part of 'course_bloc.dart';

enum CourseStatus { initial, success, error, loading, selected }

// extension CourseStatusX on CourseStatus {
//   bool get isInitial => this == CourseStatus.initial;
//   bool get isSuccess => this == CourseStatus.success;
//   bool get isError => this == CourseStatus.error;
//   bool get isLoading => this == CourseStatus.loading;
//   bool get isSelected => this == CourseStatus.selected;
// }

class CourseState extends Equatable {
  const CourseState({
    this.status = CourseStatus.initial,
    List<Course>? courses,
    int idSelected = 0,
  })  : courses = courses ?? const [],
        idSelected = idSelected;

  final List<Course> courses;
  final CourseStatus status;
  final int idSelected;

  @override
  List<Object?> get props => [status, courses, idSelected];

  CourseState copyWith(
      {List<Course>? courses, CourseStatus? status, int? idSelected, course}) {
    return CourseState(
      courses: courses ?? this.courses,
      status: status ?? this.status,
      idSelected: idSelected ?? this.idSelected,
    );
  }
}
