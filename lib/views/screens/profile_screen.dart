import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/models/user.dart';
import 'package:tiktok_clone/views/widgets/buttons/button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Button(
          backgroundColor: colorMain,
          title: "Logout",
          radius: 5,
          // onTap: () { showOptionsDialog(context); },
          onTap: () { firebaseAuth.signOut(); },
        ),
      ),
    );
  }
}