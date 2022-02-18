import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/controllers/auth_controller.dart';
import 'package:tiktok_clone/views/screens/add_video_screen.dart';
import 'package:tiktok_clone/views/screens/profile_screen.dart';

// COLORS
const Color colorMain = Color(0xffb21e35);

// PAGES

const pages = [
  Text("Home Screen", style: TextStyle(color: Colors.white),),
  Text("Search Screen", style: TextStyle(color: Colors.white),),
  AddVideoScreen(),
  Text("Messages Screen", style: TextStyle(color: Colors.white),),
  ProfileScreen(),
];

// FIREBASE
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

// CONTROLLERS
var authController = AuthController.instance;