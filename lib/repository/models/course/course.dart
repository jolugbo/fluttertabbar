import 'package:freezed_annotation/freezed_annotation.dart';
part 'course.freezed.dart';
part 'course.g.dart';

@freezed
abstract class Course with _$Course {
  const factory Course({
    required String description,
    required String courseId,
    required int courseNum,
    String? createdBy,
    String? icon,
    @Default(false) bool approved,
    String? courseName,
    List<String>? careers,
    List<String>? courseContents,
    List<String>? contributors,
    List<String>? users,
  }) = _Course;
  factory Course.fromJson(Map<String, dynamic> json) =>
      _$CourseFromJson(json); //⇒
}
