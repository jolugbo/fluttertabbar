import 'dart:convert';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:edurald/repository/models/course/course.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:edurald/repository/models/course/course.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class CourseService {
  Future<List<Course>?> getCoursesByCareer(String careerId) async {
    print("request: ${careerId}");
    try {
      HttpsCallable callable =
          FirebaseFunctions.instance.httpsCallable('getCoursesByCareer');
      var data = {
        "data": {
          'careerId': careerId,
        }
      };
      final results = await callable.call(<String, dynamic>{
        'careerId': careerId,
      });
      String careerStrings = json.encode(results.data);
      //var careersObjsJson = jsonDecode(careerStrings) as List;
      print(careerStrings);
      return List<Course>.from(
        json.decode(careerStrings).map(
              (data) => Course.fromJson(data),
            ),
      );
    } catch (e) {
      print(":)");
      print(e);
    }
  }

  Future<List<Course>?> getCourses() async {
    try {
      HttpsCallable callable =
          FirebaseFunctions.instance.httpsCallable('getAllCourses');
      final results = await callable();
      return List<Course>.from(
        json.decode(results.data).map(
              (data) => Course.fromJson(data),
            ),
      );
    } catch (Ex) {
      return null;
    }
  }
}
