import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Color backgroundColor;
  final double width;
  final double height;
  final String title;
  final Color titleColor;
  final GestureTapCallback? onTap;
  final double radius;

  const Button(
      {Key? key,
      this.backgroundColor = Colors.blue,
      this.width = 250,
      this.height = 50,
      this.title = "Title",
      this.titleColor = Colors.white,
      this.onTap,
      this.radius = 10})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(primary: backgroundColor),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: titleColor,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
        child: Center(
          child: InkWell(
            onTap: () => onTap!(),
            child: Text(
              title,
              style: TextStyle(
                  color: titleColor, fontWeight: FontWeight.w700, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
