part of 'career_bloc.dart';

class CareerEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetCareers extends CareerEvent {}

class SelectCareer extends CareerEvent {
  SelectCareer({
    required this.idSelected,
  });
  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}
