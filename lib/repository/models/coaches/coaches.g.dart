// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coaches.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Coaches _$$_CoachesFromJson(Map<String, dynamic> json) => _$_Coaches(
      email: json['email'] as String,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      photoUrl: json['photoUrl'] as String?,
      socialMediaProfiles: (json['socialMediaProfiles'] as List<dynamic>?)
          ?.map((e) => Social_Media.fromJson(e as Map<String, dynamic>))
          .toList(),
      career:
          (json['career'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_CoachesToJson(_$_Coaches instance) =>
    <String, dynamic>{
      'email': instance.email,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'photoUrl': instance.photoUrl,
      'socialMediaProfiles': instance.socialMediaProfiles,
      'career': instance.career,
    };
