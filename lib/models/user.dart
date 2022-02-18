import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String uid;
  String username;
  String email;
  String profilePhoto;

  User(
      {required this.uid,
      required this.username,
      required this.email,
      this.profilePhoto =
          "https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png"});

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "username": username,
        "email": email,
        "profilePhoto": profilePhoto,
      };

  static User fromSnap(DocumentSnapshot snapshot) {
    var snap = snapshot.data() as Map<String, dynamic>;
    return User(
      uid: snap["uid"],
      username: snap["username"],
      email: snap["email"],
      profilePhoto: snap["profilePhoto"],
    );
  }
}
