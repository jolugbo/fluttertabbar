// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'course.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Course _$CourseFromJson(Map<String, dynamic> json) {
  return _Course.fromJson(json);
}

/// @nodoc
mixin _$Course {
  String get description => throw _privateConstructorUsedError;
  String? get createdBy => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  bool get approved => throw _privateConstructorUsedError;
  String? get course_name => throw _privateConstructorUsedError;
  List<String>? get careers => throw _privateConstructorUsedError;
  List<String>? get course_contents => throw _privateConstructorUsedError;
  List<String>? get contributors => throw _privateConstructorUsedError;
  List<String>? get users => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourseCopyWith<Course> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseCopyWith<$Res> {
  factory $CourseCopyWith(Course value, $Res Function(Course) then) =
      _$CourseCopyWithImpl<$Res>;
  $Res call(
      {String description,
      String? createdBy,
      String? icon,
      bool approved,
      String? course_name,
      List<String>? careers,
      List<String>? course_contents,
      List<String>? contributors,
      List<String>? users});
}

/// @nodoc
class _$CourseCopyWithImpl<$Res> implements $CourseCopyWith<$Res> {
  _$CourseCopyWithImpl(this._value, this._then);

  final Course _value;
  // ignore: unused_field
  final $Res Function(Course) _then;

  @override
  $Res call({
    Object? description = freezed,
    Object? createdBy = freezed,
    Object? icon = freezed,
    Object? approved = freezed,
    Object? course_name = freezed,
    Object? careers = freezed,
    Object? course_contents = freezed,
    Object? contributors = freezed,
    Object? users = freezed,
  }) {
    return _then(_value.copyWith(
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: createdBy == freezed
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      approved: approved == freezed
          ? _value.approved
          : approved // ignore: cast_nullable_to_non_nullable
              as bool,
      course_name: course_name == freezed
          ? _value.course_name
          : course_name // ignore: cast_nullable_to_non_nullable
              as String?,
      careers: careers == freezed
          ? _value.careers
          : careers // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      course_contents: course_contents == freezed
          ? _value.course_contents
          : course_contents // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      contributors: contributors == freezed
          ? _value.contributors
          : contributors // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      users: users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
abstract class _$$_CourseCopyWith<$Res> implements $CourseCopyWith<$Res> {
  factory _$$_CourseCopyWith(_$_Course value, $Res Function(_$_Course) then) =
      __$$_CourseCopyWithImpl<$Res>;
  @override
  $Res call(
      {String description,
      String? createdBy,
      String? icon,
      bool approved,
      String? course_name,
      List<String>? careers,
      List<String>? course_contents,
      List<String>? contributors,
      List<String>? users});
}

/// @nodoc
class __$$_CourseCopyWithImpl<$Res> extends _$CourseCopyWithImpl<$Res>
    implements _$$_CourseCopyWith<$Res> {
  __$$_CourseCopyWithImpl(_$_Course _value, $Res Function(_$_Course) _then)
      : super(_value, (v) => _then(v as _$_Course));

  @override
  _$_Course get _value => super._value as _$_Course;

  @override
  $Res call({
    Object? description = freezed,
    Object? createdBy = freezed,
    Object? icon = freezed,
    Object? approved = freezed,
    Object? course_name = freezed,
    Object? careers = freezed,
    Object? course_contents = freezed,
    Object? contributors = freezed,
    Object? users = freezed,
  }) {
    return _then(_$_Course(
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: createdBy == freezed
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      approved: approved == freezed
          ? _value.approved
          : approved // ignore: cast_nullable_to_non_nullable
              as bool,
      course_name: course_name == freezed
          ? _value.course_name
          : course_name // ignore: cast_nullable_to_non_nullable
              as String?,
      careers: careers == freezed
          ? _value._careers
          : careers // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      course_contents: course_contents == freezed
          ? _value._course_contents
          : course_contents // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      contributors: contributors == freezed
          ? _value._contributors
          : contributors // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      users: users == freezed
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Course implements _Course {
  const _$_Course(
      {required this.description,
      this.createdBy,
      this.icon,
      this.approved = false,
      this.course_name,
      final List<String>? careers,
      final List<String>? course_contents,
      final List<String>? contributors,
      final List<String>? users})
      : _careers = careers,
        _course_contents = course_contents,
        _contributors = contributors,
        _users = users;

  factory _$_Course.fromJson(Map<String, dynamic> json) =>
      _$$_CourseFromJson(json);

  @override
  final String description;
  @override
  final String? createdBy;
  @override
  final String? icon;
  @override
  @JsonKey()
  final bool approved;
  @override
  final String? course_name;
  final List<String>? _careers;
  @override
  List<String>? get careers {
    final value = _careers;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _course_contents;
  @override
  List<String>? get course_contents {
    final value = _course_contents;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _contributors;
  @override
  List<String>? get contributors {
    final value = _contributors;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _users;
  @override
  List<String>? get users {
    final value = _users;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Course(description: $description, createdBy: $createdBy, icon: $icon, approved: $approved, course_name: $course_name, careers: $careers, course_contents: $course_contents, contributors: $contributors, users: $users)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Course &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.createdBy, createdBy) &&
            const DeepCollectionEquality().equals(other.icon, icon) &&
            const DeepCollectionEquality().equals(other.approved, approved) &&
            const DeepCollectionEquality()
                .equals(other.course_name, course_name) &&
            const DeepCollectionEquality().equals(other._careers, _careers) &&
            const DeepCollectionEquality()
                .equals(other._course_contents, _course_contents) &&
            const DeepCollectionEquality()
                .equals(other._contributors, _contributors) &&
            const DeepCollectionEquality().equals(other._users, _users));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(createdBy),
      const DeepCollectionEquality().hash(icon),
      const DeepCollectionEquality().hash(approved),
      const DeepCollectionEquality().hash(course_name),
      const DeepCollectionEquality().hash(_careers),
      const DeepCollectionEquality().hash(_course_contents),
      const DeepCollectionEquality().hash(_contributors),
      const DeepCollectionEquality().hash(_users));

  @JsonKey(ignore: true)
  @override
  _$$_CourseCopyWith<_$_Course> get copyWith =>
      __$$_CourseCopyWithImpl<_$_Course>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CourseToJson(
      this,
    );
  }
}

abstract class _Course implements Course {
  const factory _Course(
      {required final String description,
      final String? createdBy,
      final String? icon,
      final bool approved,
      final String? course_name,
      final List<String>? careers,
      final List<String>? course_contents,
      final List<String>? contributors,
      final List<String>? users}) = _$_Course;

  factory _Course.fromJson(Map<String, dynamic> json) = _$_Course.fromJson;

  @override
  String get description;
  @override
  String? get createdBy;
  @override
  String? get icon;
  @override
  bool get approved;
  @override
  String? get course_name;
  @override
  List<String>? get careers;
  @override
  List<String>? get course_contents;
  @override
  List<String>? get contributors;
  @override
  List<String>? get users;
  @override
  @JsonKey(ignore: true)
  _$$_CourseCopyWith<_$_Course> get copyWith =>
      throw _privateConstructorUsedError;
}
