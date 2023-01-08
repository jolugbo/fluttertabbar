// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'social_media.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Social_Media _$Social_MediaFromJson(Map<String, dynamic> json) {
  return _Social_Media.fromJson(json);
}

/// @nodoc
mixin _$Social_Media {
  String? get instagram => throw _privateConstructorUsedError;
  String? get linkedIn => throw _privateConstructorUsedError;
  String? get twitter => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $Social_MediaCopyWith<Social_Media> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Social_MediaCopyWith<$Res> {
  factory $Social_MediaCopyWith(
          Social_Media value, $Res Function(Social_Media) then) =
      _$Social_MediaCopyWithImpl<$Res>;
  $Res call({String? instagram, String? linkedIn, String? twitter});
}

/// @nodoc
class _$Social_MediaCopyWithImpl<$Res> implements $Social_MediaCopyWith<$Res> {
  _$Social_MediaCopyWithImpl(this._value, this._then);

  final Social_Media _value;
  // ignore: unused_field
  final $Res Function(Social_Media) _then;

  @override
  $Res call({
    Object? instagram = freezed,
    Object? linkedIn = freezed,
    Object? twitter = freezed,
  }) {
    return _then(_value.copyWith(
      instagram: instagram == freezed
          ? _value.instagram
          : instagram // ignore: cast_nullable_to_non_nullable
              as String?,
      linkedIn: linkedIn == freezed
          ? _value.linkedIn
          : linkedIn // ignore: cast_nullable_to_non_nullable
              as String?,
      twitter: twitter == freezed
          ? _value.twitter
          : twitter // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_Social_MediaCopyWith<$Res>
    implements $Social_MediaCopyWith<$Res> {
  factory _$$_Social_MediaCopyWith(
          _$_Social_Media value, $Res Function(_$_Social_Media) then) =
      __$$_Social_MediaCopyWithImpl<$Res>;
  @override
  $Res call({String? instagram, String? linkedIn, String? twitter});
}

/// @nodoc
class __$$_Social_MediaCopyWithImpl<$Res>
    extends _$Social_MediaCopyWithImpl<$Res>
    implements _$$_Social_MediaCopyWith<$Res> {
  __$$_Social_MediaCopyWithImpl(
      _$_Social_Media _value, $Res Function(_$_Social_Media) _then)
      : super(_value, (v) => _then(v as _$_Social_Media));

  @override
  _$_Social_Media get _value => super._value as _$_Social_Media;

  @override
  $Res call({
    Object? instagram = freezed,
    Object? linkedIn = freezed,
    Object? twitter = freezed,
  }) {
    return _then(_$_Social_Media(
      instagram: instagram == freezed
          ? _value.instagram
          : instagram // ignore: cast_nullable_to_non_nullable
              as String?,
      linkedIn: linkedIn == freezed
          ? _value.linkedIn
          : linkedIn // ignore: cast_nullable_to_non_nullable
              as String?,
      twitter: twitter == freezed
          ? _value.twitter
          : twitter // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Social_Media implements _Social_Media {
  const _$_Social_Media({this.instagram, this.linkedIn, this.twitter});

  factory _$_Social_Media.fromJson(Map<String, dynamic> json) =>
      _$$_Social_MediaFromJson(json);

  @override
  final String? instagram;
  @override
  final String? linkedIn;
  @override
  final String? twitter;

  @override
  String toString() {
    return 'Social_Media(instagram: $instagram, linkedIn: $linkedIn, twitter: $twitter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Social_Media &&
            const DeepCollectionEquality().equals(other.instagram, instagram) &&
            const DeepCollectionEquality().equals(other.linkedIn, linkedIn) &&
            const DeepCollectionEquality().equals(other.twitter, twitter));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(instagram),
      const DeepCollectionEquality().hash(linkedIn),
      const DeepCollectionEquality().hash(twitter));

  @JsonKey(ignore: true)
  @override
  _$$_Social_MediaCopyWith<_$_Social_Media> get copyWith =>
      __$$_Social_MediaCopyWithImpl<_$_Social_Media>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_Social_MediaToJson(
      this,
    );
  }
}

abstract class _Social_Media implements Social_Media {
  const factory _Social_Media(
      {final String? instagram,
      final String? linkedIn,
      final String? twitter}) = _$_Social_Media;

  factory _Social_Media.fromJson(Map<String, dynamic> json) =
      _$_Social_Media.fromJson;

  @override
  String? get instagram;
  @override
  String? get linkedIn;
  @override
  String? get twitter;
  @override
  @JsonKey(ignore: true)
  _$$_Social_MediaCopyWith<_$_Social_Media> get copyWith =>
      throw _privateConstructorUsedError;
}
