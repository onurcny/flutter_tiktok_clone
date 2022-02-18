import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/models/user.dart' as model;
import 'package:tiktok_clone/views/screens/auth/login_screen.dart';
import 'package:tiktok_clone/views/screens/home_screen.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  late Rx<User?> _user;
  late Rx<File?> _pickedImage;

  User? get user => _user.value;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, _setInitialScreen);
  }

  void _setInitialScreen(User? user) {
    if(user == null){
      Get.offAll(() => LoginScreen());
    } else {
      Get.offAll(() => const HomeScreen());
    }
  }

  File? get profilePhoto => _pickedImage.value;

  void pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      Get.snackbar("Profile Picture",
          "You have successfully selected your profile picture!");
    }
    _pickedImage = Rx<File?>(File(pickedImage!.path));
  }

  Future<String> _uploadToStorage(File image) async {
    Reference ref = firebaseStorage
        .ref()
        .child("profilePhotos")
        .child(firebaseAuth.currentUser!.uid);
    UploadTask upTask = ref.putFile(image);
    TaskSnapshot snap = await upTask;
    String url = await snap.ref.getDownloadURL();
    return url;
  }

  void registerUser(
      String username, String email, String password, File? image) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        UserCredential credential = await firebaseAuth
            .createUserWithEmailAndPassword(email: email, password: password);
        String url = await _uploadToStorage(image);
        model.User user = model.User(
            uid: credential.user!.uid,
            username: username,
            email: email,
            profilePhoto: url);
        await firestore
            .collection('users')
            .doc(credential.user!.uid)
            .set(user.toJson());
        Get.snackbar("Creating Account", "You have successfully signed in.");
      } else {
        Get.snackbar(
            "Error While Creating Account", "Please enter all the fields.");
      }
    } catch (e) {
      Get.snackbar("Error While Creating Account", e.toString());
    }
  }

  void loginUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        print("login success");
      } else {
        Get.snackbar("Error While Loging In", "Please enter all the fields.");
      }
    } catch (e) {
      Get.snackbar("Error While Loging In", e.toString());
    }
  }

  void logoutUser() async {
    try{
      await firebaseAuth.signOut();
    }catch(e){
      Get.snackbar("Error While Loging Out", e.toString());
    }
  }
}
