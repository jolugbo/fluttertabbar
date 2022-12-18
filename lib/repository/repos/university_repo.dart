import 'package:edurald/repository/models/universities/accredited_institutions.dart';
import 'package:edurald/repository/services/university_services.dart';

class UniversityRepository {
  const UniversityRepository({
    required this.service,
  });
  final UniversityService service;

  Future<List<Accredited_Institutions>?> getUniversities() async =>
      service.getUniversities();

  Future<List<Accredited_Institutions>?> getUniversitiesByCareer(
          String careerId) async =>
      service.getUniversitiesByCareers(careerId);
}
