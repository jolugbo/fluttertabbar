import 'package:freezed_annotation/freezed_annotation.dart';
part 'social_media.freezed.dart';
part 'social_media.g.dart';

@freezed
abstract class Social_Media with _$Social_Media {
  const factory Social_Media({
    String? instagram,
    String? linkedIn,
    String? twitter,
  }) = _Social_Media;
  factory Social_Media.fromJson(Map<String, dynamic> json) =>
      _$Social_MediaFromJson(json); //⇒
}
