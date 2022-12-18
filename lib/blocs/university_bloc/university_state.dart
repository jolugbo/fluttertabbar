part of 'university_bloc.dart';

enum UniversityStatus { initial, success, error, loading, selected }

extension UniversityStatusX on UniversityStatus {
  bool get isInitial => this == UniversityStatus.initial;
  bool get isSuccess => this == UniversityStatus.success;
  bool get isError => this == UniversityStatus.error;
  bool get isLoading => this == UniversityStatus.loading;
  bool get isSelected => this == UniversityStatus.selected;
}

class UniversityState extends Equatable {
  const UniversityState({
    this.status = UniversityStatus.initial,
    List<Accredited_Institutions>? universities,
    int idSelected = 0,
  })  : universities = universities ?? const [],
        idSelected = idSelected;

  final List<Accredited_Institutions> universities;
  final UniversityStatus status;
  final int idSelected;

  @override
  List<Object?> get props => [status, universities, idSelected];

  UniversityState copyWith(
      {List<Accredited_Institutions>? courses,
      UniversityStatus? status,
      int? idSelected,
      course}) {
    return UniversityState(
      universities: courses ?? this.universities,
      status: status ?? this.status,
      idSelected: idSelected ?? this.idSelected,
    );
  }
}
