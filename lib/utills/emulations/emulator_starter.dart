import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../models/strings.dart';
class edurald_emulators {

  edurald_emulators()  {
    _configureFirebaseAuth();
    _configureFirebaseStorage();
    _configureFirebaseFirestore();
  }
}

Future<void> _configureFirebaseAuth() async {
  String configHost = dotenv.env['FIREBASE_EMU_URL'] ?? emulator_url_error;
  //int configPort = dotenv.env['FIREBASE_EMU_URL'] ?? emulator_url_error;
  int configPort = const int.fromEnvironment("AUTH_EMU_PORT");
  // Android emulator must be pointed to 10.0.2.2
  var defaultHost = Platform.isAndroid ? '10.0.2.2' : 'localhost';
  var host = configHost != emulator_url_error ? configHost : defaultHost;
  var port = configPort != 0 ? configPort : 9099;
  await FirebaseAuth.instance.useAuthEmulator(host, port);
  debugPrint('Using Firebase Auth emulator on: $host:$port');
}

Future<void> _configureFirebaseStorage() async {
  String configHost = const String.fromEnvironment("FIREBASE_EMU_URL");
  int configPort = const int.fromEnvironment("STORAGE_EMU_PORT");
  // Android emulator must be pointed to 10.0.2.2
  var defaultHost = Platform.isAndroid ? '10.0.2.2' : 'localhost';
  var host = configHost.isNotEmpty ? configHost : defaultHost;
  var port = configPort != 0 ? configPort : 9199;
  await FirebaseStorage.instance.useStorageEmulator(host, port);
  debugPrint('Using Firebase Storage emulator on: $host:$port');
}

void _configureFirebaseFirestore() {
  String configHost = const String.fromEnvironment("FIREBASE_EMU_URL");
  int configPort = const int.fromEnvironment("DB_EMU_PORT");
  // Android emulator must be pointed to 10.0.2.2
  var defaultHost = Platform.isAndroid ? '10.0.2.2' : 'localhost';
  var host = configHost.isNotEmpty ? configHost : defaultHost;
  var port = configPort != 0 ? configPort : 8080;

  FirebaseFirestore.instance.settings = Settings(
    host: '$host:$port',
    sslEnabled: false,
    persistenceEnabled: false,
  );
  debugPrint('Using Firebase Firestore emulator on: $host:$port');
}