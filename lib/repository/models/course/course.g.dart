// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Course _$$_CourseFromJson(Map<String, dynamic> json) => _$_Course(
      description: json['description'] as String,
      createdBy: json['createdBy'] as String?,
      icon: json['icon'] as String?,
      approved: json['approved'] as bool? ?? false,
      course_name: json['course_name'] as String?,
      careers:
          (json['careers'] as List<dynamic>?)?.map((e) => e as String).toList(),
      course_contents: (json['course_contents'] as List<dynamic>?)
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
      'createdBy': instance.createdBy,
      'icon': instance.icon,
      'approved': instance.approved,
      'course_name': instance.course_name,
      'careers': instance.careers,
      'course_contents': instance.course_contents,
      'contributors': instance.contributors,
      'users': instance.users,
    };
