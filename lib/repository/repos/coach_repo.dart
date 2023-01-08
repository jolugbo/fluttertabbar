import '../models/coaches/coaches.dart';
import '../services/coach_services.dart';

class CoachRepository {
  const CoachRepository({
    required this.service,
  });
  final CoachService service;

  Future<List<Coaches>?> getCoaches() async => service.getCoaches();

  Future<List<Coaches>?> getCoachesInterest(String UserId) async =>
      service.getCoachesInterest(UserId);
}
