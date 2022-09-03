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
    print("creating IPOs....");
    var uuid = Uuid();
    coursesRef.doc(uuid.v1()).set({
      "course_name": "Initial Public Offerings (IPOs)",
      "icon": "",
      "description": "Intro to (IPOs)",
      "careers": ["d32bf610-2a4f-11ed-b0e6-e76c95bb498e"],
      "educators": [],
      "course_contents": [],
      "createdBy": user.uid
    });
    message("IPOs Created....");
  } catch (e) {
    showError("IPOs not Created");
  }
}

createCourse1() {
  try {
    //You will learn about the mechanics of Initial Public Offerings, Seasoned Equity Offerings, Private Placements
    print("creating SEOs....");
    var uuid = Uuid();
    coursesRef.doc(uuid.v1()).set({
      "course_name": "Seasoned Equity Offerings (SEOs)",
      "icon": "",
      "description": "Intro to (SEOs)",
      "careers": ["d32bf610-2a4f-11ed-b0e6-e76c95bb498e"],
      "educators": [],
      "course_contents": [],
      "createdBy": user.uid
    });
    message("SEOs Created....");
  } catch (e) {
    showError("SEOs not Created");
  }
}

createCourse2() {
  try {
    print("creating Private Placements....");
    var uuid = Uuid();
    coursesRef.doc(uuid.v1()).set({
      "course_name": "Private Placements",
      "icon": "",
      "description": "Intro to Private Placements",
      "careers": ["d32bf610-2a4f-11ed-b0e6-e76c95bb498e"],
      "educators": [],
      "course_contents": [],
      "createdBy": user.uid
    });
    message("Private Placements Created....");
  } catch (e) {
    showError("Private Placements not Created");
  }
}

createCourse3() {
  try {
    print("creating Bond Issuances....");
    var uuid = Uuid();
    coursesRef.doc(uuid.v1()).set({
      "course_name": "Bond Issuances",
      "icon": "",
      "description": "Intro to Bond Issuances",
      "careers": ["d32bf610-2a4f-11ed-b0e6-e76c95bb498e"],
      "educators": [],
      "course_contents": [],
      "createdBy": user.uid
    });
    message("Bond Issuances Created....");
  } catch (e) {
    showError("Bond Issuances not Created");
  }
}

createCourse4() {
  try {
    print("creating Loan Syndications....");
    var uuid = Uuid();
    coursesRef.doc(uuid.v1()).set({
      "course_name": "Loan Syndications",
      "icon": "",
      "description": "Intro to Loan Syndications",
      "careers": ["d32bf610-2a4f-11ed-b0e6-e76c95bb498e"],
      "educators": [],
      "course_contents": [],
      "createdBy": user.uid
    });
    message("Loan Syndications Created....");
  } catch (e) {
    showError("Loan Syndications not Created");
  }
}

createCourse5() {
  try {
    print("creating Securitizations....");
    var uuid = Uuid();

    coursesRef.doc(uuid.v1()).set({
      "course_name": "Securitizations",
      "icon": "",
      "description": "Intro to Securitizations",
      "careers": ["d32bf610-2a4f-11ed-b0e6-e76c95bb498e"],
      "educators": [],
      "course_contents": [],
      "createdBy": user.uid
    });
    message("Securitizations Created....");
  } catch (e) {
    showError("Securitizations not Created");
  }
}

createCourse6() {
  try {
    print("creating Mergers and Acquisitions....");
    var uuid = Uuid();
    coursesRef.doc(uuid.v1()).set({
      "course_name": "Mergers and Acquisitions (M&As)",
      "icon": "",
      "description": "Intro to M&As",
      "careers": ["d32bf610-2a4f-11ed-b0e6-e76c95bb498e"],
      "educators": [],
      "course_contents": [],
      "createdBy": user.uid
    });
    message("Mergers and Acquisitions Created....");
  } catch (e) {
    showError("Mergers and Acquisitions not Created");
  }
}

createCourse7() {
  try {
    print("creating Restructurings....");
    var uuid = Uuid();

    coursesRef.doc(uuid.v1()).set({
      "course_name": "Restructurings",
      "icon": "",
      "description": "Intro to Restructurings",
      "careers": ["d32bf610-2a4f-11ed-b0e6-e76c95bb498e"],
      "educators": [],
      "course_contents": [],
      "createdBy": user.uid
    });
    message("Restructurings Created....");
  } catch (e) {
    showError("Restructurings not Created");
  }
}

createCourse8() {
  try {
    print("creating Trading Instruments....");
    var uuid = Uuid();

    coursesRef.doc(uuid.v1()).set({
      "course_name": "Trading Instruments",
      "icon": "",
      "description": "Intro to Trading Instruments",
      "careers": ["d32bf610-2a4f-11ed-b0e6-e76c95bb498e"],
      "educators": [],
      "course_contents": [],
      "createdBy": user.uid
    });
    message("Trading Instruments Created....");
  } catch (e) {
    showError("Trading Instruments not Created");
  }
}
//Bond Issuances, Loan Syndications, Securitizations, Mergers and Acquisitions, Restructurings, Trading Instruments,