import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData icon;
  final bool isObscure;
  final double width;
  final double height;
  final Color color;
  final double padding;

  const TextInputField({ 
    Key? key,
    required this.controller,
    required this.labelText,
    required this.icon,
    this.isObscure = false,
    this.width = 260,
    this.height = 50,
    this.color = Colors.blueGrey,
    this.padding = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: SizedBox(
        width: width,
        height: height,
        child: TextField(
          style: const TextStyle(color: Colors.white),
          controller: controller,
          decoration: InputDecoration(
            labelText: labelText,
            prefixIcon: Icon(icon, color: color,),
            focusColor: color,
            fillColor: color,
            hoverColor: color,
            labelStyle: TextStyle(fontSize: 20, color: color),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: color,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: color,
              ),
            ),
          ),
          obscureText: isObscure,
        ),
      ),
    );
  }
}