import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edurald/models/user/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../main.dart';
import '../../models/strings.dart';
import '../../utills/input_util.dart';
import 'package:uuid/uuid.dart';

createAdmin() async {
  try {
    final response = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: "eduraldapp@gmail.com", password: "TAEASAOJ");
    if (response.user != null) {
      user = response;
      message("Admin Created");
    }
    return true;
  } on FirebaseAuthException catch (e) {
    showError('Admin not created.');
    return false;
  } catch (e) {
    showError('Admin not created.');
    return false;
  }
}

loginAsAdmin() async {
  try {
    final response = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(), password: password.trim());
    user = response;
    message("Admin loggedIn");
    return true;
  } on FirebaseAuthException catch (e) {
    showError("Admin not loggedIn");
    return false;
  } catch (e) {
    showError("Admin not loggedIn");
    return false;
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////This Region Create User Validity Checks///////////////////////////////////////////////////////////////////
///
///
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

Future<bool> checkIfEmailExist(String email) async {
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

Future<bool> checkIfUserExist() async {
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

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////This Region Creates DB Structures///////////////////////////////////////////////////////////////////
///
///

createCareerPath() {
  var uuid = Uuid();
  careersRef.doc(user.user?.uid).set({
    "description": "",
    "careerName": "Investment Banking",
    "synonyms": ["finance,investment,banking"],
    "studies": [],
    "users": [],
    "educators": [],
    "quizes": [],
  });
}

createQuiz() {
  var uuid = Uuid();
  quizesRef.doc(uuid.v1()).set({
    "question": "",
    "options": [],
    "answer": "",
    "careers": [],
    "courses": [],
    "comments": [],
  });
}

createCourses() {
  var uuid = Uuid();
  coursesRef.doc(uuid.v1()).set({
    "course_name": "",
    "description": "",
    "careers": [],
    "educators": [],
    "course_contents": [],
  });
}
