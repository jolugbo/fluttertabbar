part of 'university_bloc.dart';

class UniversityEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetUniversities extends UniversityEvent {}

class GetUniversitiesByCareer extends UniversityEvent {
  GetUniversitiesByCareer({
    required this.careerId,
  });
  final String careerId;

  @override
  List<Object?> get props => [careerId];
}

class SelectUniversity extends UniversityEvent {
  SelectUniversity({
    required this.idSelected,
  });
  final String idSelected;

  @override
  List<Object?> get props => [idSelected];
}
