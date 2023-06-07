import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_12/constants.dart';
import 'package:netflix_12/widgets/video_widgets.dart';

import '../../../core/colors/colors.dart';
import '../../core/models/result.dart';
import '../../home/widgets/custom_card.dart';

class ComingSoonWidgets extends StatelessWidget {
  const ComingSoonWidgets({
    Key? key,
    required this.movie,
  }) : super(key: key);
  final Result movie;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                movie.releaseDate!,
                style: const TextStyle(fontSize: 16, color: kgrey),
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(image: movie.backdropPath!),
              kheight,
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    movie.title!,
                    overflow: TextOverflow.visible,
                    style: GoogleFonts.kaushanScript(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  const Row(
                    children: [
                      CustomButton(
                        icon: (Icons.alarm),
                        title: "Remind me",
                        iconsize: 20,
                        textSize: 12,
                      ),
                      KWidth,
                      CustomButton(
                        icon: Icons.info,
                        title: " Info",
                        iconsize: 20,
                        textSize: 12,
                      ),
                      KWidth
                    ],
                  ),
                ],
              ),
              kheight,
              Text('Coming on ${movie.releaseDate}'),
              kheight,
              Text(
                movie.title!,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              kheight,
              Text(
                movie.overview!,
                style: TextStyle(color: kgrey),
              )
            ],
          ),
        ),
      ],
    );
  }
}
