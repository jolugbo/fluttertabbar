import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edurald/models/user/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../main.dart';
import '../../models/strings.dart';
import '../../utills/input_util.dart';
import 'package:uuid/uuid.dart';

Future<bool> createUserWithEmailAndPassword(
    context, String email, String password) async {
  try {
    final response = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.trim(), password: password.trim());
    user = response.user!;
    print("got here");
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
