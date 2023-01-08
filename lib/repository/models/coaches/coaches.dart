import 'package:freezed_annotation/freezed_annotation.dart';

import '../social_media/social_media.dart';
part 'coaches.freezed.dart';
part 'coaches.g.dart';

@freezed
abstract class Coaches with _$Coaches {
  const factory Coaches({
    required String email,
    String? firstname,
    String? lastname,
    String? photoUrl,
    List<Social_Media>? socialMediaProfiles,
    List<String>? career,
  }) = _Coaches;
  factory Coaches.fromJson(Map<String, dynamic> json) =>
      _$CoachesFromJson(json); //⇒
}
