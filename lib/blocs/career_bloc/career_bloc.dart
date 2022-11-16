import 'package:edurald/repository/models/career/career.dart';
import 'package:edurald/repository/repos/career_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'career_state.dart';
part 'career_event.dart';

class CareerBloc extends Bloc<CareerEvent, CareerState> {
  CareerBloc({
    required this.careerRepository,
  }) : super(const CareerState()) {
    on<GetCareers>(_mapGetCareersEventToState);
    // on<SelectCategory>(_mapSelectCategoryEventToState);
  }
  final CareerRepository careerRepository;

  void _mapGetCareersEventToState(
      GetCareers event, Emitter<CareerState> emit) async {
    emit(state.copyWith(status: CareerStatus.loading));
    try {
      final careers = await careerRepository.getCareers();
      print("got heree");
      print(careers);
      emit(
        state.copyWith(
          status: CareerStatus.success,
          careers: careers,
        ),
      );
    } catch (error, stacktrace) {
      print(stacktrace);
      emit(state.copyWith(status: CareerStatus.error));
    }
  }

  // void _mapSelectCategoryEventToState(
  //     SelectCategory event, Emitter<CategoryState> emit) async {
  //   emit(
  //     state.copyWith(
  //       status: CategoryStatus.selected,
  //       idSelected: event.idSelected,
  //     ),
  //   );
  // }
}
