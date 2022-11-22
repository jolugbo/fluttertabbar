import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edurald/repository/models/career/career.dart';
import 'package:edurald/repository/models/user/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../main.dart';
import '../../repository/models/strings.dart';
import '../../utills/input_util.dart';
import 'package:uuid/uuid.dart';
import 'package:cloud_functions/cloud_functions.dart';

FirebaseFunctions functions = FirebaseFunctions.instance;
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
    showError("Admin not loggedIn firebase error");
    return false;
  } catch (e) {
    print(e.toString());
    showError(e.toString());
    return false;
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////This Region Create User Validity Checks///////////////////////////////////////////////////////////////////
///
///

// Future<bool> userNameExist(String displayname) async {
//   int size = 0;
//   await FirebaseFirestore.instance
//       .collection("users")
//       .where("unique", isEqualTo: displayname.toLowerCase())
//       .get()
//       .then(
//         (res) => {
//           size = res.size,
//           print(size),
//         },
//         onError: (e) => print("Error completing: $e"),
//       );
//   return size >= 1;
// }
Future<bool> userNameExist(String displayname) async {
  HttpsCallable callable =
      FirebaseFunctions.instance.httpsCallable('checkIfUserNameExist');
  final results = await callable.call(<String, dynamic>{
    'displayname': displayname,
  });
  print(results.data);
  return results.data;
}

Future<bool> checkIfEmailExist(String email) async {
  HttpsCallable callable =
      FirebaseFunctions.instance.httpsCallable('checkIfEmailExist');
  final results = await callable.call(<String, dynamic>{
    'email': email,
  });
  print(results.data);
  return results.data;
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

createCareerPath() async {
  var uuid = Uuid();
  try {
    print(user.uid);
    await careersRef.doc(uuid.v1()).set({
      "description": "Understanding Micro and Macro Economics",
      "careerName": "Economics",
      "synonyms": ["Economics,Economics,Economics"],
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

createCourse1() {
  try {
    print("creating History to IB....");
    var uuid = Uuid();

    coursesRef.doc(uuid.v1()).set({
      "courseName": "History to IB",
      "courseId": uuid.v1(),
      "courseNum": 1,
      "icon": "",
      "description": "A brief history on Investment Banking",
      "careers": ["d32bf610-2a4f-11ed-b0e6-e76c95bb498e"],
      "contributors": [],
      "courseContents": [],
      "users": [],
      "createdBy": user.uid
    });
    message("History to IB Created....");
  } catch (e) {
    showError("History to IB not Created");
  }
}

createCourse2() {
  try {
    print("creating Main Subsect of IB Instruments....");
    var uuid = Uuid();

    coursesRef.doc(uuid.v1()).set({
      "courseName": "Main Subsect of IB",
      "courseId": uuid.v1(),
      "courseNum": 2,
      "icon": "",
      "description": "Intro to 4 main Subsect IB",
      "careers": ["d32bf610-2a4f-11ed-b0e6-e76c95bb498e"],
      "contributors": [],
      "courseContents": [],
      "users": [],
      "createdBy": user.uid
    });
    message("Main Subsect of IB Created....");
  } catch (e) {
    showError("Main Subsect of IB not Created");
  }
}

createCourse3() {
  try {
    print("creating Advisory....");
    var uuid = Uuid();
    coursesRef.doc(uuid.v1()).set({
      "courseName": "Initial Public Offerings (IPOs)",
      "courseId": uuid.v1(),
      "courseNum": 3,
      "icon": "",
      "description": "Intro to Advisory",
      "careers": ["d32bf610-2a4f-11ed-b0e6-e76c95bb498e"],
      "contributors": [],
      "courseContents": [],
      "users": [],
      "createdBy": user.uid
    });
    message("Advisory Created....");
  } catch (e) {
    showError("Advisory not Created");
  }
}

createCourse4() {
  try {
    print("creating Asset Management....");
    var uuid = Uuid();
    coursesRef.doc(uuid.v1()).set({
      "courseName": "Asset Management",
      "courseId": uuid.v1(),
      "courseNum": 4,
      "icon": "",
      "description": "Intro to Asset Management",
      "careers": ["d32bf610-2a4f-11ed-b0e6-e76c95bb498e"],
      "contributors": [],
      "courseContents": [],
      "users": [],
      "createdBy": user.uid
    });
    message("Asset Management Created....");
  } catch (e) {
    showError("Asset Management not Created");
  }
}

createCourse5() {
  try {
    print("creating Capital Markets....");
    var uuid = Uuid();
    coursesRef.doc(uuid.v1()).set({
      "courseName": "Capital Markets",
      "courseId": uuid.v1(),
      "courseNum": 5,
      "icon": "",
      "description": "Intro to Capital Markets",
      "careers": ["d32bf610-2a4f-11ed-b0e6-e76c95bb498e"],
      "contributors": [],
      "courseContents": [],
      "users": [],
      "createdBy": user.uid
    });
    message("Capital Markets Created....");
  } catch (e) {
    showError("Capital Markets not Created");
  }
}

createCourse6() {
  try {
    print("creating Trading & Brokerage....");
    var uuid = Uuid();

    coursesRef.doc(uuid.v1()).set({
      "courseName": "Trading & Brokerage",
      "courseId": uuid.v1(),
      "courseNum": 6,
      "icon": "",
      "description": "Intro to Trading & Brokerage",
      "careers": ["d32bf610-2a4f-11ed-b0e6-e76c95bb498e"],
      "contributors": [],
      "courseContents": [],
      "users": [],
      "createdBy": user.uid
    });
    message("Trading & Brokerage Created....");
  } catch (e) {
    showError("Trading & Brokerage not Created");
  }
}

createCourse7() {
  try {
    print("creating Trading Instruments....");
    var uuid = Uuid();

    coursesRef.doc(uuid.v1()).set({
      "courseName": "Trading Instruments",
      "courseId": uuid.v1(),
      "courseNum": 7,
      "icon": "",
      "description": "Intro to Trading Instruments",
      "careers": ["d32bf610-2a4f-11ed-b0e6-e76c95bb498e"],
      "contributors": [],
      "courseContents": [],
      "users": [],
      "createdBy": user.uid
    });
    message("Trading Instruments Created....");
  } catch (e) {
    showError("Trading Instruments not Created");
  }
}

createCourse8() {
  try {
    print("creating Securitizations....");
    var uuid = Uuid();

    coursesRef.doc(uuid.v1()).set({
      "courseName": "Securitizations",
      "courseId": uuid.v1(),
      "courseNum": 8,
      "icon": "",
      "description": "Intro to Securitizations",
      "careers": ["d32bf610-2a4f-11ed-b0e6-e76c95bb498e"],
      "contributors": [],
      "courseContents": [],
      "users": [],
      "createdBy": user.uid
    });
    message("Securitizations Created....");
  } catch (e) {
    showError("Securitizations not Created");
  }
}

createCourse9() {
  try {
    print("creating Mergers and Acquisitions....");
    var uuid = Uuid();
    coursesRef.doc(uuid.v1()).set({
      "courseName": "Mergers and Acquisitions (M&As)",
      "courseId": uuid.v1(),
      "courseNum": 8,
      "icon": "",
      "description": "Intro to M&As",
      "careers": ["d32bf610-2a4f-11ed-b0e6-e76c95bb498e"],
      "contributors": [],
      "courseContents": [],
      "users": [],
      "createdBy": user.uid
    });
    message("Mergers and Acquisitions Created....");
  } catch (e) {
    showError("Mergers and Acquisitions not Created");
  }
}

createCourse10() {
  try {
    print("creating IPOs....");
    var uuid = Uuid();
    coursesRef.doc(uuid.v1()).set({
      "courseName": "Initial Public Offerings (IPOs)",
      "courseId": uuid.v1(),
      "courseNum": 10,
      "icon": "",
      "description": "Intro to (IPOs)",
      "careers": ["d32bf610-2a4f-11ed-b0e6-e76c95bb498e"],
      "contributors": [],
      "courseContents": [],
      "users": [],
      "createdBy": user.uid
    });
    message("IPOs Created....");
  } catch (e) {
    showError("IPOs not Created");
  }
}

createCourse11() {
  try {
    print("creating SEOs....");
    var uuid = Uuid();
    coursesRef.doc(uuid.v1()).set({
      "courseName": "Seasoned Equity Offerings (SEOs)",
      "courseId": uuid.v1(),
      "courseNum": 11,
      "icon": "",
      "description": "Intro to (SEOs)",
      "careers": ["d32bf610-2a4f-11ed-b0e6-e76c95bb498e"],
      "contributors": [],
      "courseContents": [],
      "users": [],
      "createdBy": user.uid
    });
    message("SEOs Created....");
  } catch (e) {
    showError("SEOs not Created");
  }
}

createCourse12() {
  try {
    print("creating Private Placements....");
    var uuid = Uuid();
    coursesRef.doc(uuid.v1()).set({
      "courseName": "Private Placements",
      "courseId": uuid.v1(),
      "courseNum": 12,
      "icon": "",
      "description": "Intro to Private Placements",
      "careers": ["d32bf610-2a4f-11ed-b0e6-e76c95bb498e"],
      "contributors": [],
      "courseContents": [],
      "users": [],
      "createdBy": user.uid
    });
    message("Private Placements Created....");
  } catch (e) {
    showError("Private Placements not Created");
  }
}

createCourse13() {
  try {
    print("creating Bond Issuances....");
    var uuid = Uuid();
    coursesRef.doc(uuid.v1()).set({
      "courseName": "Bond Issuances",
      "courseId": uuid.v1(),
      "courseNum": 13,
      "icon": "",
      "description": "Intro to Bond Issuances",
      "careers": ["d32bf610-2a4f-11ed-b0e6-e76c95bb498e"],
      "contributors": [],
      "courseContents": [],
      "users": [],
      "createdBy": user.uid
    });
    message("Bond Issuances Created....");
  } catch (e) {
    showError("Bond Issuances not Created");
  }
}

createCourse14() {
  try {
    print("creating Loan Syndications....");
    var uuid = Uuid();
    coursesRef.doc(uuid.v1()).set({
      "courseName": "Loan Syndications",
      "courseId": uuid.v1(),
      "courseNum": 14,
      "icon": "",
      "description": "Intro to Loan Syndications",
      "careers": ["d32bf610-2a4f-11ed-b0e6-e76c95bb498e"],
      "contributors": [],
      "courseContents": [],
      "users": [],
      "createdBy": user.uid
    });
    message("Loan Syndications Created....");
  } catch (e) {
    showError("Loan Syndications not Created");
  }
}

createCourse15() {
  try {
    print("creating Restructurings....");
    var uuid = Uuid();

    coursesRef.doc(uuid.v1()).set({
      "courseName": "Restructurings",
      "courseId": uuid.v1(),
      "courseNum": 15,
      "icon": "",
      "description": "Intro to Restructurings",
      "careers": ["d32bf610-2a4f-11ed-b0e6-e76c95bb498e"],
      "contributors": [],
      "courseContents": [],
      "users": [],
      "createdBy": user.uid
    });
    message("Restructurings Created....");
  } catch (e) {
    showError("Restructurings not Created");
  }
}

Future<void> getCoursesByCareer() async {
  try {
    HttpsCallable callable =
        FirebaseFunctions.instance.httpsCallable('getCoursesByCareer');
    final results = await callable.call(<String, dynamic>{
      'careerId': "d32bf610-2a4f-11ed-b0e6-e76c95bb498e",
    });
    print(results.data);
    return results.data;
  } catch (e) {}
}

Future<void> getCareers() async {
  HttpsCallable callable =
      FirebaseFunctions.instance.httpsCallable('getAllCareers');
  final results = await callable();
  print(results.data);
  String careerStrings = json.encode(results.data);
  var careersObjsJson = jsonDecode(careerStrings) as List;
  List<Career> CareerObjs =
      careersObjsJson.map((careerJson) => Career.fromJson(careerJson)).toList();
  for (var i = 0; i < CareerObjs.length; i++) {
    print(CareerObjs[i].careerName);
  }
}
//Bond Issuances, Loan Syndications, Securitizations, Mergers and Acquisitions, Restructurings, Trading Instruments,