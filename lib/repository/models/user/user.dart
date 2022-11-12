import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required String email,
    String? firstName,
    String? lastName,
    String? displayName,
    String? photoUrl,
    int? point,
    List<String>? socialMedia,
    List<String>? communities,
    List<String>? careers,
    List<String>? studies_taken,
    List<String>? quiz_taken,
    List<String>? bookmarks,
    List<String>? followers,
    List<String>? followings,
    List<String>? notifications,
    required String unique,
    List<int>? ratings,
  }) = _UserModel;
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json); //⇒
}
