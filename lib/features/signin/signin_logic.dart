import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twitter_login/twitter_login.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../main.dart';

//this handles facebook  signins
Future<UserCredential> signInWithFacebook() async {
  final LoginResult loginResult = await FacebookAuth.instance
      .login(permissions: ['email', 'public_profile']);
  final OAuthCredential facebookAuthCredential =
      FacebookAuthProvider.credential(loginResult.accessToken!.token);
  return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
}

//this handles google signins
Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;
  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );
  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

//this handles twitter signins
Future<UserCredential> signInWithTwitter() async {
  var tokens = await authsRef.doc("twitter").get();

  // Create a TwitterLogin instance
  final twitterLogin = new TwitterLogin(
    apiKey: tokens.data()?["API_Key"],
    apiSecretKey: tokens.data()?["Secret"],
    redirectURI: 'twittersdk://',
  );

  // Trigger the sign-in flow
  final authResult = await twitterLogin.login();

  // Create a credential from the access token
  final twitterAuthCredential = TwitterAuthProvider.credential(
    accessToken: authResult.authToken!,
    secret: authResult.authTokenSecret!,
  );
  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance
      .signInWithCredential(twitterAuthCredential);
}

Future<bool> signInWithEmailPassword(String email, String password) async {
  try {
    final response = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(), password: password.trim());
    user = response.user!;
    return true;
  } on FirebaseAuthException catch (e) {
    return false;
  } catch (e) {
    return false;
  }
}
