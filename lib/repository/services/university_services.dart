import 'dart:convert';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:edurald/repository/models/course/course.dart';
import 'package:edurald/repository/models/universities/accredited_institutions.dart';

class UniversityService {
  Future<List<Accredited_Institutions>?> getUniversitiesByCareers(
      String careerId) async {
    try {
      HttpsCallable callable =
          FirebaseFunctions.instance.httpsCallable('getUniversitiesByCareer');
      var data = {
        "data": {
          'careerId': careerId,
        }
      };
      final results = await callable.call(<String, dynamic>{
        'careerId': careerId,
      });
      String universityStrings = json.encode(results.data);
      print(universityStrings);
      return List<Accredited_Institutions>.from(
        json.decode(universityStrings).map(
              (data) => Accredited_Institutions.fromJson(data),
            ),
      );

      // final results = await callable();
      // String careerStrings = json.encode(results.data);
      // var careersObjsJson = jsonDecode(careerStrings) as List;
      // List<Accredited_Institutions> careers = careersObjsJson
      //     .map((careerJson) => Accredited_Institutions.fromJson(careerJson))
      //     .toList();
      // return careers;
    } catch (Ex) {
      print(Ex);
      return null;
    }
  }

  Future<List<Accredited_Institutions>?> getUniversities() async {
    try {
      HttpsCallable callable =
          FirebaseFunctions.instance.httpsCallable('getUniversitiesByCareer');
      final results = await callable();
      return List<Accredited_Institutions>.from(
        json.decode(results.data).map(
              (data) => Accredited_Institutions.fromJson(data),
            ),
      );
    } catch (Ex) {
      return null;
    }
  }
}
