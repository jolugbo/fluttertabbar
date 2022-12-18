import 'package:freezed_annotation/freezed_annotation.dart';
part 'accredited_institutions.freezed.dart';
part 'accredited_institutions.g.dart';

@freezed
abstract class Accredited_Institutions with _$Accredited_Institutions {
  const factory Accredited_Institutions({
    required String logo,
    required String name,
    required String website,
  }) = _Accredited_Institutions;
  factory Accredited_Institutions.fromJson(Map<String, dynamic> json) =>
      _$Accredited_InstitutionsFromJson(json); //⇒
}
