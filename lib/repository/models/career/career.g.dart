// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'career.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Career _$$_CareerFromJson(Map<String, dynamic> json) => _$_Career(
      description: json['description'] as String,
      career_id: json['career_id'] as String,
      createdBy: json['createdBy'] as String?,
      approved: json['approved'] as bool? ?? false,
      careerName: json['careerName'] as String?,
      point: json['point'] as int?,
      synonyms: (json['synonyms'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      quizes:
          (json['quizes'] as List<dynamic>?)?.map((e) => e as String).toList(),
      courses:
          (json['courses'] as List<dynamic>?)?.map((e) => e as String).toList(),
      educators: (json['educators'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      users:
          (json['users'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_CareerToJson(_$_Career instance) => <String, dynamic>{
      'description': instance.description,
      'career_id': instance.career_id,
      'createdBy': instance.createdBy,
      'approved': instance.approved,
      'careerName': instance.careerName,
      'point': instance.point,
      'synonyms': instance.synonyms,
      'quizes': instance.quizes,
      'courses': instance.courses,
      'educators': instance.educators,
      'users': instance.users,
    };
