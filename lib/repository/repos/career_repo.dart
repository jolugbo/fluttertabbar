import 'package:edurald/repository/models/career/career.dart';
import 'package:edurald/repository/services/career_services.dart';

class CareerRepository {
  const CareerRepository({
    required this.service,
  });
  final CareerService service;

  // Future<Career> getCareers() async => service.getCareers();

  Future<List<Career>?> getCareers() async => service.getCareers();

  // Future<List<Result>> getGamesByCategory(int genreId) async =>
  //     service.getGamesByCategory(genreId);
}
