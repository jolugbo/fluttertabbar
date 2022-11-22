// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Course _$$_CourseFromJson(Map<String, dynamic> json) => _$_Course(
      description: json['description'] as String,
      courseId: json['courseId'] as String,
      courseNum: json['courseNum'] as int,
      createdBy: json['createdBy'] as String?,
      icon: json['icon'] as String?,
      approved: json['approved'] as bool? ?? false,
      courseName: json['courseName'] as String?,
      careers:
          (json['careers'] as List<dynamic>?)?.map((e) => e as String).toList(),
      courseContents: (json['courseContents'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      contributors: (json['contributors'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      users:
          (json['users'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_CourseToJson(_$_Course instance) => <String, dynamic>{
      'description': instance.description,
      'courseId': instance.courseId,
      'courseNum': instance.courseNum,
      'createdBy': instance.createdBy,
      'icon': instance.icon,
      'approved': instance.approved,
      'courseName': instance.courseName,
      'careers': instance.careers,
      'courseContents': instance.courseContents,
      'contributors': instance.contributors,
      'users': instance.users,
    };
