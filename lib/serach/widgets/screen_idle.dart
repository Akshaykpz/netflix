import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_12/serach/widgets/title.dart';

import '../../constants.dart';
import '../../core/colors/colors.dart';
import '../../core/models/result.dart';
import '../../home/widgets/functions/function.dart';

const imageurl =
    "https://www.themoviedb.org/t/p/w500_and_h282_face/xVFpOIVdVn5ZUq1QIf0UJcZWjO2.jpg";

class SearchIdelWidget extends StatelessWidget {
  SearchIdelWidget({super.key});
  final List movie = HomeFunction.comingSoon + HomeFunction.nowPlaying;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTextTitle(title: "Top Searches"),
        kheight,
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: ((context, index) =>
                  TopSearchItemtile(movies: movie[index])),
              separatorBuilder: ((context, index) => kheight20),
              itemCount: movie.length),
        )
      ],
    );
  }
}

class TopSearchItemtile extends StatelessWidget {
  const TopSearchItemtile({super.key, required this.movies});
  final Result movies;
  @override
  Widget build(BuildContext context) {
    final ScreenWitdh = MediaQuery.of(context).size.width;
    return Row(
      children: [
        (Container(
          width: ScreenWitdh * 0.35,
          height: 65,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://image.tmdb.org/t/p/w500${movies.posterPath}'))),
        )),
        Expanded(
            child: Text(
          movies.title ?? 'Unknown',
          style: const TextStyle(
              color: kwhite, fontWeight: FontWeight.bold, fontSize: 16),
        )),
        const CircleAvatar(
          backgroundColor: kwhite,
          radius: 25,
          child: CircleAvatar(
            backgroundColor: kblack,
            radius: 23,
            child: Icon(
              CupertinoIcons.play_fill,
              color: kwhite,
            ),
          ),
        )
        // Icon(CupertinoIcons.play)
      ],
    );
  }
}
