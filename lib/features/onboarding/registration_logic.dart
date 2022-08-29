import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edurald/models/user/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../main.dart';
import '../../models/strings.dart';
import '../../utills/input_util.dart';
import 'package:uuid/uuid.dart';

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
  final sample = UserModel(
      email: email,
      unique: userName.toLowerCase().trim(),
      firstName: firstName,
      lastName: lastName,
      displayName: userName,
      photoUrl: photo);
  userRef.doc(currentuser.uid).set(sample.toJson());
}

createCareerStructure() {
  var uuid = Uuid();
  careersRef.doc(uuid.v1()).set({
    "description": "",
    "careerName": "Investment Banking",
    "synonyms": ["finance,investment,banking"],
    "studies": [],
    "userts": [],
    "educators": [],
    "quizes": [],
  });
}

createQuizesStructure() {
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

createCoursesStructure() {
  var uuid = Uuid();
  coursesRef.doc(uuid.v1()).set({
    "course_name": "",
    "description": "",
    "careers": [],
    "educators": [],
    "course_contents": [],
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
