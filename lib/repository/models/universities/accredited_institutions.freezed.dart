// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'accredited_institutions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Accredited_Institutions _$Accredited_InstitutionsFromJson(
    Map<String, dynamic> json) {
  return _Accredited_Institutions.fromJson(json);
}

/// @nodoc
mixin _$Accredited_Institutions {
  String get logo => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get website => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $Accredited_InstitutionsCopyWith<Accredited_Institutions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Accredited_InstitutionsCopyWith<$Res> {
  factory $Accredited_InstitutionsCopyWith(Accredited_Institutions value,
          $Res Function(Accredited_Institutions) then) =
      _$Accredited_InstitutionsCopyWithImpl<$Res>;
  $Res call({String logo, String name, String website});
}

/// @nodoc
class _$Accredited_InstitutionsCopyWithImpl<$Res>
    implements $Accredited_InstitutionsCopyWith<$Res> {
  _$Accredited_InstitutionsCopyWithImpl(this._value, this._then);

  final Accredited_Institutions _value;
  // ignore: unused_field
  final $Res Function(Accredited_Institutions) _then;

  @override
  $Res call({
    Object? logo = freezed,
    Object? name = freezed,
    Object? website = freezed,
  }) {
    return _then(_value.copyWith(
      logo: logo == freezed
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      website: website == freezed
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_Accredited_InstitutionsCopyWith<$Res>
    implements $Accredited_InstitutionsCopyWith<$Res> {
  factory _$$_Accredited_InstitutionsCopyWith(_$_Accredited_Institutions value,
          $Res Function(_$_Accredited_Institutions) then) =
      __$$_Accredited_InstitutionsCopyWithImpl<$Res>;
  @override
  $Res call({String logo, String name, String website});
}

/// @nodoc
class __$$_Accredited_InstitutionsCopyWithImpl<$Res>
    extends _$Accredited_InstitutionsCopyWithImpl<$Res>
    implements _$$_Accredited_InstitutionsCopyWith<$Res> {
  __$$_Accredited_InstitutionsCopyWithImpl(_$_Accredited_Institutions _value,
      $Res Function(_$_Accredited_Institutions) _then)
      : super(_value, (v) => _then(v as _$_Accredited_Institutions));

  @override
  _$_Accredited_Institutions get _value =>
      super._value as _$_Accredited_Institutions;

  @override
  $Res call({
    Object? logo = freezed,
    Object? name = freezed,
    Object? website = freezed,
  }) {
    return _then(_$_Accredited_Institutions(
      logo: logo == freezed
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      website: website == freezed
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Accredited_Institutions implements _Accredited_Institutions {
  const _$_Accredited_Institutions(
      {required this.logo, required this.name, required this.website});

  factory _$_Accredited_Institutions.fromJson(Map<String, dynamic> json) =>
      _$$_Accredited_InstitutionsFromJson(json);

  @override
  final String logo;
  @override
  final String name;
  @override
  final String website;

  @override
  String toString() {
    return 'Accredited_Institutions(logo: $logo, name: $name, website: $website)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Accredited_Institutions &&
            const DeepCollectionEquality().equals(other.logo, logo) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.website, website));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(logo),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(website));

  @JsonKey(ignore: true)
  @override
  _$$_Accredited_InstitutionsCopyWith<_$_Accredited_Institutions>
      get copyWith =>
          __$$_Accredited_InstitutionsCopyWithImpl<_$_Accredited_Institutions>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_Accredited_InstitutionsToJson(
      this,
    );
  }
}

abstract class _Accredited_Institutions implements Accredited_Institutions {
  const factory _Accredited_Institutions(
      {required final String logo,
      required final String name,
      required final String website}) = _$_Accredited_Institutions;

  factory _Accredited_Institutions.fromJson(Map<String, dynamic> json) =
      _$_Accredited_Institutions.fromJson;

  @override
  String get logo;
  @override
  String get name;
  @override
  String get website;
  @override
  @JsonKey(ignore: true)
  _$$_Accredited_InstitutionsCopyWith<_$_Accredited_Institutions>
      get copyWith => throw _privateConstructorUsedError;
}
