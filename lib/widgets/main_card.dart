import 'package:flutter/material.dart';

import '../constants.dart';

class Maincard extends StatelessWidget {
  const Maincard({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 130,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: kradius10,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage("https://image.tmdb.org/t/p/w500$imageUrl"),
        ),
      ),
    );
  }
}
