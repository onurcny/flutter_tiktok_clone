import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/views/widgets/buttons/button.dart';
import 'package:tiktok_clone/views/widgets/inputs/text_input_field.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "TikTok Clone",
                style: TextStyle(
                  color: colorMain,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Register",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Stack(
              children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(
                        "https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png"),
                    backgroundColor: Colors.black,
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      color: Colors.white,
                      icon: const Icon(Icons.add_a_photo),
                      onPressed: () => authController.pickImage(),
                    )),
              ],
            ),
            TextInputField(
              controller: _usernameController,
              icon: Icons.person,
              labelText: "Username",
              color: colorMain,
            ),
            TextInputField(
              controller: _emailController,
              icon: Icons.email,
              labelText: "Email",
              color: colorMain,
            ),
            TextInputField(
              controller: _passwordController,
              icon: Icons.password,
              isObscure: true,
              labelText: "Password",
              color: colorMain,
            ),
            Button(
              onTap: () => authController.registerUser(
                _usernameController.text,
                _emailController.text,
                _passwordController.text,
                authController.profilePhoto,
              ),
              title: "Register",
              titleColor: Colors.black,
              backgroundColor: colorMain,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account?",
                  style: TextStyle(color: Colors.grey),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          color: colorMain, fontWeight: FontWeight.bold),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
