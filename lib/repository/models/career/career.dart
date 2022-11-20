import 'package:freezed_annotation/freezed_annotation.dart';
part 'career.freezed.dart';
part 'career.g.dart';

@freezed
abstract class Career with _$Career {
  const factory Career({
    required String description,
    required String career_id,
    String? createdBy,
    @Default(false) bool approved,
    String? careerName,
    int? point,
    List<String>? synonyms,
    List<String>? quizes,
    List<String>? courses,
    List<String>? educators,
    List<String>? users,
  }) = _Career;
  factory Career.fromJson(Map<String, dynamic> json) =>
      _$CareerFromJson(json); //⇒
}
