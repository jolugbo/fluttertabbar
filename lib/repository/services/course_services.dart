import 'dart:convert';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:edurald/repository/models/course/course.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:edurald/repository/models/course/course.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class CourseService {
  Future<List<Course>?> getCoursesByCareer() async {
    try {
      HttpsCallable callable =
          FirebaseFunctions.instance.httpsCallable('getCoursesByCareer');
      final results = await callable.call(<String, dynamic>{
        'careerId': "d32bf610-2a4f-11ed-b0e6-e76c95bb498e",
      });
      print(results.data);
      return results.data;
    } catch (e) {}
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
