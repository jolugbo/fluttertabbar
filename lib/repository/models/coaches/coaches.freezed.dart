// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'coaches.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Coaches _$CoachesFromJson(Map<String, dynamic> json) {
  return _Coaches.fromJson(json);
}

/// @nodoc
mixin _$Coaches {
  String get email => throw _privateConstructorUsedError;
  String? get firstname => throw _privateConstructorUsedError;
  String? get lastname => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  List<Social_Media>? get socialMediaProfiles =>
      throw _privateConstructorUsedError;
  List<String>? get career => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoachesCopyWith<Coaches> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoachesCopyWith<$Res> {
  factory $CoachesCopyWith(Coaches value, $Res Function(Coaches) then) =
      _$CoachesCopyWithImpl<$Res>;
  $Res call(
      {String email,
      String? firstname,
      String? lastname,
      String? photoUrl,
      List<Social_Media>? socialMediaProfiles,
      List<String>? career});
}

/// @nodoc
class _$CoachesCopyWithImpl<$Res> implements $CoachesCopyWith<$Res> {
  _$CoachesCopyWithImpl(this._value, this._then);

  final Coaches _value;
  // ignore: unused_field
  final $Res Function(Coaches) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? photoUrl = freezed,
    Object? socialMediaProfiles = freezed,
    Object? career = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstname: firstname == freezed
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String?,
      lastname: lastname == freezed
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      socialMediaProfiles: socialMediaProfiles == freezed
          ? _value.socialMediaProfiles
          : socialMediaProfiles // ignore: cast_nullable_to_non_nullable
              as List<Social_Media>?,
      career: career == freezed
          ? _value.career
          : career // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
abstract class _$$_CoachesCopyWith<$Res> implements $CoachesCopyWith<$Res> {
  factory _$$_CoachesCopyWith(
          _$_Coaches value, $Res Function(_$_Coaches) then) =
      __$$_CoachesCopyWithImpl<$Res>;
  @override
  $Res call(
      {String email,
      String? firstname,
      String? lastname,
      String? photoUrl,
      List<Social_Media>? socialMediaProfiles,
      List<String>? career});
}

/// @nodoc
class __$$_CoachesCopyWithImpl<$Res> extends _$CoachesCopyWithImpl<$Res>
    implements _$$_CoachesCopyWith<$Res> {
  __$$_CoachesCopyWithImpl(_$_Coaches _value, $Res Function(_$_Coaches) _then)
      : super(_value, (v) => _then(v as _$_Coaches));

  @override
  _$_Coaches get _value => super._value as _$_Coaches;

  @override
  $Res call({
    Object? email = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? photoUrl = freezed,
    Object? socialMediaProfiles = freezed,
    Object? career = freezed,
  }) {
    return _then(_$_Coaches(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstname: firstname == freezed
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String?,
      lastname: lastname == freezed
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      socialMediaProfiles: socialMediaProfiles == freezed
          ? _value._socialMediaProfiles
          : socialMediaProfiles // ignore: cast_nullable_to_non_nullable
              as List<Social_Media>?,
      career: career == freezed
          ? _value._career
          : career // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Coaches implements _Coaches {
  const _$_Coaches(
      {required this.email,
      this.firstname,
      this.lastname,
      this.photoUrl,
      final List<Social_Media>? socialMediaProfiles,
      final List<String>? career})
      : _socialMediaProfiles = socialMediaProfiles,
        _career = career;

  factory _$_Coaches.fromJson(Map<String, dynamic> json) =>
      _$$_CoachesFromJson(json);

  @override
  final String email;
  @override
  final String? firstname;
  @override
  final String? lastname;
  @override
  final String? photoUrl;
  final List<Social_Media>? _socialMediaProfiles;
  @override
  List<Social_Media>? get socialMediaProfiles {
    final value = _socialMediaProfiles;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _career;
  @override
  List<String>? get career {
    final value = _career;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Coaches(email: $email, firstname: $firstname, lastname: $lastname, photoUrl: $photoUrl, socialMediaProfiles: $socialMediaProfiles, career: $career)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Coaches &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.firstname, firstname) &&
            const DeepCollectionEquality().equals(other.lastname, lastname) &&
            const DeepCollectionEquality().equals(other.photoUrl, photoUrl) &&
            const DeepCollectionEquality()
                .equals(other._socialMediaProfiles, _socialMediaProfiles) &&
            const DeepCollectionEquality().equals(other._career, _career));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(firstname),
      const DeepCollectionEquality().hash(lastname),
      const DeepCollectionEquality().hash(photoUrl),
      const DeepCollectionEquality().hash(_socialMediaProfiles),
      const DeepCollectionEquality().hash(_career));

  @JsonKey(ignore: true)
  @override
  _$$_CoachesCopyWith<_$_Coaches> get copyWith =>
      __$$_CoachesCopyWithImpl<_$_Coaches>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CoachesToJson(
      this,
    );
  }
}

abstract class _Coaches implements Coaches {
  const factory _Coaches(
      {required final String email,
      final String? firstname,
      final String? lastname,
      final String? photoUrl,
      final List<Social_Media>? socialMediaProfiles,
      final List<String>? career}) = _$_Coaches;

  factory _Coaches.fromJson(Map<String, dynamic> json) = _$_Coaches.fromJson;

  @override
  String get email;
  @override
  String? get firstname;
  @override
  String? get lastname;
  @override
  String? get photoUrl;
  @override
  List<Social_Media>? get socialMediaProfiles;
  @override
  List<String>? get career;
  @override
  @JsonKey(ignore: true)
  _$$_CoachesCopyWith<_$_Coaches> get copyWith =>
      throw _privateConstructorUsedError;
}
