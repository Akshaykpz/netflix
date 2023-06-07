import 'package:flutter/material.dart';


import '../../core/colors/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.icon,
      required this.title,
      this.iconsize = 30,
      this.textSize = 18})
      : super(key: key);
  final IconData icon;
  final String title;
  final double iconsize;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kwhite,
          size: iconsize,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: textSize,
          ),
        )
      ],
    );
  }
}
