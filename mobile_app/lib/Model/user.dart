import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String id;
  String firstName;
  String lastName;
  String username;
  int phoneNo;
  bool mute;
  bool deaf;
  bool blind;
  // String icon;

  User(
    this.id, {
    this.firstName,
    this.lastName,
    this.username,
    this.phoneNo,
    this.mute,
    this.deaf,
    this.blind,
    // this.icon
  });

  User.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data;
    this.id = snapshot.documentID;
    this.firstName = data['firstName'];
    this.lastName = data['lastName'];
    this.username = data['username'];
    this.phoneNo = data['phoneNo'];
    this.mute = data['mute'];
    this.deaf = data['deaf'];
    this.blind = data['blind'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      // 'icon': icon,
    };
  }
}