import 'package:firebase_analytics/firebase_analytics.dart';

 class edurald_analytics {

  Future<void> signInUser(String eventName,String UserId) async {
    final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    await FirebaseAnalytics.instance.logEvent(
      name: eventName,
      parameters: {"user":UserId},
      // callOptions: callOptions,
    );
  }
}