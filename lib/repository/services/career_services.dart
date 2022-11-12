import 'dart:convert';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:edurald/repository/models/career/career.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class CareerService {
  Future<List<Career>?> getCareers() async {
    try {
      HttpsCallable callable =
          FirebaseFunctions.instance.httpsCallable('getAllCareers');
      final results = await callable();
      return List<Career>.from(
        json.decode(results.data).map(
              (data) => Career.fromJson(data),
            ),
      );
    } catch (Ex) {
      return null;
    }
  }
}
