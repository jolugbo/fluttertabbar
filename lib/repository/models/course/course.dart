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
//https://firebasestorage.googleapis.com/v0/b/edurald.appspot.com/o/career_images%2Finvestment_banking.png?alt=media&token=3c9447a9-8fe1-4f1e-a7cb-c0308431f948