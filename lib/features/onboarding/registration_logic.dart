import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../main.dart';
import '../../models/strings.dart';
import '../../utills/input_util.dart';
import '../signin/signin_logic.dart';

Future<bool> createUser(context, String email, String password) async {
  try {
    final response = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.trim(), password: password.trim());
    user = response;
    showMyDialog(context, "Account Verification", account_verification_msg);
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      showError('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      showError('An account already exists for that email.');
    }
    return false;
  } catch (e) {
    return false;
  }
}

saveUserToFirestore(currentuser, String email, String firstName,
    String lastName, String userName, String photo) {
  userRef.doc(currentuser.uid).set({
    "email": user.user?.email ?? email.trim(),
    "firstName": firstName.trim(),
    "lastName": lastName.trim(),
    "displayName": userName.trim(),
    "photo": photo,
    "point": 30,
    "socialMedia": {},
    "communities": {},
    "training": {},
    "bookmarks": {},
    "ratings": 0,
    "friends": {
      "followers": {},
      "followings": {},
    },
    "notifications": {},
    "unique": userName.trim().toLowerCase(),
  });
}

//this region makes user validity checks
Future<bool> userNameExist(String displayname) async {
  int size = 0;
  await FirebaseFirestore.instance
      .collection("users")
      .where("unique", isEqualTo: displayname.toLowerCase())
      .get()
      .then(
        (res) => {
          size = res.size,
          print(size),
        },
        onError: (e) => print("Error completing: $e"),
      );
  return size >= 1;
}

Future<bool> mailExist(String email) async {
  int size = 0;
  await FirebaseFirestore.instance
      .collection("users")
      .where("email", isEqualTo: email.toLowerCase())
      .get()
      .then(
        (res) => {
          size = res.size,
        },
        onError: (e) => print("Error completing: $e"),
      );
  return size >= 1;
}

Future<bool> userExist() async {
  final docRef = await userRef.doc(user.user?.uid).get().then(
    (DocumentSnapshot doc) {
      if (doc.exists) {
        return true;
      } else
        return false;
    },
    onError: (e) => print("Error getting document: $e"),
  );
  return docRef;
}
