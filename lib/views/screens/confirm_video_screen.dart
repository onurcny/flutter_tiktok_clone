import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants.dart';

class ConfirmVideoScreen extends StatelessWidget {
  const ConfirmVideoScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Confirm Video Screen", style: TextStyle(color: colorMain),),
    );
  }
}