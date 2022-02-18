import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/views/screens/auth/signup_screen.dart';
import 'package:tiktok_clone/views/widgets/buttons/button.dart';
import 'package:tiktok_clone/views/widgets/inputs/text_input_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

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
                "Login",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
              onTap: () => authController.loginUser(_emailController.text, _passwordController.text),
              title: "Login",
              titleColor: Colors.black,
              backgroundColor: colorMain,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?", style: TextStyle(color: Colors.grey),),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignupScreen()));
                  }, 
                  child: const Text(
                    "Register", style: TextStyle(
                      color: colorMain,
                      fontWeight: FontWeight.bold
                    ),
                  )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
