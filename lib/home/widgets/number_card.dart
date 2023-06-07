import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';


import '../../constants.dart';
import '../../core/colors/colors.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index, required this.image});
  final int index;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 40,
              height: 200,
            ),
            Container(
              width: 130,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: kradius10,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage('https://image.tmdb.org/t/p/w500$image'),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 13,
          bottom: -30,
          child: BorderedText(
            strokeColor: kwhite,
            strokeWidth: 10.0,
            child: Text(
              "${index + 1}",
              style: const TextStyle(
                  fontSize: 140,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                  decorationColor: Colors.black),
            ),
          ),
        )
      ],
    );
  }
}
