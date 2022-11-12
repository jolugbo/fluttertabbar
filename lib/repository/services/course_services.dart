import 'dart:convert';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:edurald/repository/models/career/career.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class CourseService {
  // Future<Game> getGames() async {
  //   final response = await _httpClient.get(
  //     getUrl(url: 'games'),
  //   );
  //   if (response.statusCode == 200) {
  //     if (response.body.isNotEmpty) {
  //       return Game.fromJson(
  //         json.decode(response.body),
  //       );
  //     } else {
  //       throw ErrorEmptyResponse();
  //     }
  //   } else {
  //     throw ErrorGettingGames('Error getting games');
  //   }
  // }
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
  // Future<List<Genre>> getCourses() async {
  //   final response = await _httpClient.get(
  //     getUrl(url: 'genres'),
  //   );
  //   if (response.statusCode == 200) {
  //     if (response.body.isNotEmpty) {
  //       return List<Genre>.from(
  //         json.decode(response.body)['results'].map(
  //               (data) => Genre.fromJson(data),
  //             ),
  //       );
  //     } else {
  //       throw ErrorEmptyResponse();
  //     }
  //   } else {
  //     throw ErrorGettingGames('Error getting genres');
  //   }
  // }

  // Future<List<Result>> getGamesByCategory(int genreId) async {
  //   final response = await _httpClient.get(
  //     getUrl(
  //       url: 'games',
  //       extraParameters: {
  //         'genres': genreId.toString(),
  //       },
  //     ),
  //   );
  //   if (response.statusCode == 200) {
  //     if (response.body.isNotEmpty) {
  //       return List<Result>.from(
  //         json.decode(response.body)['results'].map(
  //               (data) => Result.fromJson(data),
  //             ),
  //       );
  //     } else {
  //       throw ErrorEmptyResponse();
  //     }
  //   } else {
  //     throw ErrorGettingGames('Error getting games');
  //   }
  // }
}
