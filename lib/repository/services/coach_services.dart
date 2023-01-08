import 'dart:convert';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:edurald/repository/models/career/career.dart';

import '../models/coaches/coaches.dart';

class CoachService {
  Future<List<Coaches>?> getCoaches() async {
    try {
      HttpsCallable callable =
          FirebaseFunctions.instance.httpsCallable('getAllCoaches');
      final results = await callable();
      String respStrings = json.encode(results.data);
      var respObjsJson = jsonDecode(respStrings) as List;
      List<Coaches> coaches = respObjsJson
          .map((coachesJson) => Coaches.fromJson(coachesJson))
          .toList();
      return coaches;
    } catch (Ex) {
      print(Ex);
      return null;
    }
  }

  Future<List<Coaches>?> getCoachesInterest(String UserId) async {
    try {
      HttpsCallable callable =
          FirebaseFunctions.instance.httpsCallable('getAllCoaches');
      final results = await callable();
      String respStrings = json.encode(results.data);
      var respObjsJson = jsonDecode(respStrings) as List;
      List<Coaches> coaches = respObjsJson
          .map((coachesJson) => Coaches.fromJson(coachesJson))
          .toList();
      return coaches;
    } catch (Ex) {
      print(Ex);
      return null;
    }
  }
}
