import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? photoUrl;
  final String? email;
  final String? displayName;
  final String? phoneNumber;
  final String? bio;

  User({ this.id, this.firstName, this.lastName,this.photoUrl, this.email, this.displayName, this.phoneNumber, this.bio});

  factory User.fromDocument(DocumentSnapshot doc){
    return User(
      id: doc['id'],
      firstName: doc['firstName'],
      lastName: doc['lastname'],
      photoUrl: doc['photoUrl'],
      email: doc['email'],
      displayName: doc['displayName'],
      phoneNumber: doc['phoneNumber'],
      bio: doc['bio'],
    );
  }
}
