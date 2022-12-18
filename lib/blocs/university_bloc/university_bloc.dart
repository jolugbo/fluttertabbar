import 'package:edurald/repository/repos/university_repo.dart';
import 'package:edurald/repository/models/universities/accredited_institutions.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'university_state.dart';
part 'university_event.dart';

class UniversityBloc extends Bloc<UniversityEvent, UniversityState> {
  UniversityBloc({
    required this.universityRepository,
  }) : super(const UniversityState()) {
    on<GetUniversities>(_mapGetUniversitiesEventToState);
    on<GetUniversitiesByCareer>(_mapGetUniversitiesByCareerEventToState);
  }
  final UniversityRepository universityRepository;

  void _mapGetUniversitiesEventToState(
      GetUniversities event, Emitter<UniversityState> emit) async {
    emit(state.copyWith(status: UniversityStatus.loading));
    try {
      final universities = await universityRepository.getUniversities();
      print(universities);
      emit(
        state.copyWith(
          status: UniversityStatus.success,
          courses: universities,
        ),
      );
    } catch (error, stacktrace) {
      print(stacktrace);
      emit(state.copyWith(status: UniversityStatus.error));
    }
  }

  void _mapGetUniversitiesByCareerEventToState(
      GetUniversitiesByCareer event, Emitter<UniversityState> emit) async {
    emit(state.copyWith(status: UniversityStatus.loading));
    try {
      final courses =
          await universityRepository.getUniversitiesByCareer(event.careerId);
      print("got heree");
      print(courses);
      print(event.careerId);
      emit(
        state.copyWith(
          status: UniversityStatus.success,
          courses: courses,
        ),
      );
    } catch (error, stacktrace) {
      print(stacktrace);
      emit(state.copyWith(status: UniversityStatus.error));
    }
  }
}
