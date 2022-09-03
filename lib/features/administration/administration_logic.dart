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
      user = response.user!;
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
        email: "eduraldapp@gmail.com", password: "TAEASAOJ");
    if (response.user != null) {
      user = response.user!;
      message("Admin loggedIn");
      return true;
    }
    return false;
  } on FirebaseAuthException catch (e) {
    print(e.toString());
    showError("Admin not loggedIn");
    return false;
  } catch (e) {
    print(e.toString());
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
  final docRef = await userRef.doc(user.uid).get().then(
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
///////////////////////////////////////This Region Creates Structure SetUps///////////////////////////////////////////////////////////////////
///
///

createCareerPath() {
  var uuid = Uuid();
  try {
    print("got here");
    careersRef.doc(uuid.v1()).set({
      "description":
          "Land a Job in Investment Banking. Learn about IPOs, Bonds, M&A, Trading, LBOs, Valuation etc",
      "careerName": "Investment Banking",
      "synonyms": ["finance,investment,banking"],
      "courses": [],
      "users": [],
      "educators": ["eduraldApp"],
      "quizes": [],
      "createdBy": user.uid,
      "approved": true
    });
    message("Career Path Created");
  } catch (e) {
    showError("Career Path not Created");
  }
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
    "createdBy": user.uid
  });
}

createCourse0() {
  try {
    print("creating History to IB....");
    var uuid = Uuid();
    coursesRef.doc(uuid.v1()).set({
      "course_name": "History to IB",
      "icon": "",
      "description": "A brief history on Investment Banking",
      "careers": ["d32bf610-2a4f-11ed-b0e6-e76c95bb498e"],
      "educators": [],
      "course_contents": [],
      "createdBy": user.uid
    });
    message("History to IB Created....");
  } catch (e) {
    showError("History to IB  not Created");
  }
}

createCourse1() {
  try {
    print("creating Main Subsect of IB....");
    var uuid = Uuid();
    coursesRef.doc(uuid.v1()).set({
      "course_name": "Main Subsect of IB",
      "icon": "",
      "description": "Intro to 4 main Subsect IB",
      "careers": ["d32bf610-2a4f-11ed-b0e6-e76c95bb498e"],
      "educators": [],
      "course_contents": [],
      "createdBy": user.uid
    });
    message("Main Subsect of IB Created....");
  } catch (e) {
    showError("Main Subsect of IB not Created");
  }
}

createCourse2() {
  try {
    print("creating Capital Markets....");
    var uuid = Uuid();
    coursesRef.doc(uuid.v1()).set({
      "course_name": "Capital Markets",
      "icon": "",
      "description": "Intro to Capital Markets",
      "careers": ["d32bf610-2a4f-11ed-b0e6-e76c95bb498e"],
      "educators": [],
      "course_contents": [],
      "createdBy": user.uid
    });
    message("Capital Markets Created....");
  } catch (e) {
    showError(e.toString());
    print(e.toString());
    showError("Capital Markets not Created");
  }
}

createCourse3() {
  try {
    print("creating Asset Management....");
    var uuid = Uuid();
    coursesRef.doc(uuid.v1()).set({
      "course_name": "Asset Management",
      "icon": "",
      "description": "Intro to Asset Management",
      "careers": ["d32bf610-2a4f-11ed-b0e6-e76c95bb498e"],
      "educators": [],
      "course_contents": [],
      "createdBy": user.uid
    });
    message("Asset Management Created....");
  } catch (e) {
    showError("Asset Management not Created");
  }
}

createCourse4() {
  try {
    print("creating Advisory....");
    var uuid = Uuid();
    coursesRef.doc(uuid.v1()).set({
      "course_name": "Advisory",
      "icon": "",
      "description": "Intro to Advisory",
      "careers": ["d32bf610-2a4f-11ed-b0e6-e76c95bb498e"],
      "educators": [],
      "course_contents": [],
      "createdBy": user.uid
    });
    message("Advisory Created....");
  } catch (e) {
    showError("Advisory not Created");
  }
}

createCourse5() {
  try {
    print("creating Trading & Brokerage....");
    var uuid = Uuid();

    coursesRef.doc(uuid.v1()).set({
      "course_name": "Trading & Brokerage",
      "icon": "",
      "description": "Intro to Trading & Brokerage",
      "careers": ["d32bf610-2a4f-11ed-b0e6-e76c95bb498e"],
      "educators": [],
      "course_contents": [],
      "createdBy": user.uid
    });
    message("Trading & Brokerage Created....");
  } catch (e) {
    showError("Trading & Brokerage not Created");
  }
}
