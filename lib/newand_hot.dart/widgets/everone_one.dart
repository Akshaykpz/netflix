import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../core/colors/colors.dart';
import '../../core/models/result.dart';
import '../../home/widgets/custom_card.dart';
import '../../widgets/video_widgets.dart';

class EveryonesWathingWidgets extends StatelessWidget {
  const EveryonesWathingWidgets({
    Key? key,
    required this.movies,
  }) : super(key: key);
  final Result movies;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight,
        Text(
          movies.title ?? 'unknown',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        kheight,
        Text(
          movies.overview ?? 'Unknown',
          style: const TextStyle(color: kgrey),
        ),
        kheight50,
        VideoWidget(image: movies.backdropPath!),
        kheight,
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              icon: (Icons.share),
              title: "Share",
              iconsize: 25,
              textSize: 16,
            ),
            KWidth,
            CustomButton(
              icon: (Icons.add),
              title: "My List",
              iconsize: 25,
              textSize: 16,
            ),
            KWidth,
            CustomButton(
              icon: (Icons.play_arrow),
              title: " Play",
              iconsize: 25,
              textSize: 16,
            ),
            KWidth,
          ],
        )
      ],
    );
  }
}
