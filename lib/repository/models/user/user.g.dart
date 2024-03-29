// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      email: json['email'] as String,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      displayName: json['displayName'] as String?,
      photoUrl: json['photoUrl'] as String?,
      point: json['point'] as int?,
      socialMedia: (json['socialMedia'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      communities: (json['communities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      careers:
          (json['careers'] as List<dynamic>?)?.map((e) => e as String).toList(),
      studies_taken: (json['studies_taken'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      quiz_taken: (json['quiz_taken'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      bookmarks: (json['bookmarks'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      followers: (json['followers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      followings: (json['followings'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      notifications: (json['notifications'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      unique: json['unique'] as String,
      ratings:
          (json['ratings'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'displayName': instance.displayName,
      'photoUrl': instance.photoUrl,
      'point': instance.point,
      'socialMedia': instance.socialMedia,
      'communities': instance.communities,
      'careers': instance.careers,
      'studies_taken': instance.studies_taken,
      'quiz_taken': instance.quiz_taken,
      'bookmarks': instance.bookmarks,
      'followers': instance.followers,
      'followings': instance.followings,
      'notifications': instance.notifications,
      'unique': instance.unique,
      'ratings': instance.ratings,
    };
