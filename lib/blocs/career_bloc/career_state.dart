part of 'career_bloc.dart';

enum CareerStatus { initial, success, error, loading, selected }

extension CategoryStatusX on CareerStatus {
  bool get isInitial => this == CareerStatus.initial;
  bool get isSuccess => this == CareerStatus.success;
  bool get isError => this == CareerStatus.error;
  bool get isLoading => this == CareerStatus.loading;
  bool get isSelected => this == CareerStatus.selected;
}

class CareerState extends Equatable {
  const CareerState({
    this.status = CareerStatus.initial,
    List<Career>? careers,
    int idSelected = 0,
  })  : careers = careers ?? const [],
        idSelected = idSelected;

  final List<Career> careers;
  final CareerStatus status;
  final int idSelected;

  @override
  List<Object?> get props => [status, careers, idSelected];

  CareerState copyWith({
    List<Career>? careers,
    CareerStatus? status,
    int? idSelected,
  }) {
    return CareerState(
      careers: careers ?? this.careers,
      status: status ?? this.status,
      idSelected: idSelected ?? this.idSelected,
    );
  }
}
