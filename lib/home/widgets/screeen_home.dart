import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


import '../../constants.dart';
import '../../core/colors/colors.dart';
import '../../widgets/main_titlecard.dart';

import 'background_card.dart';
import 'functions/function.dart';
import 'number_titlecard.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable: scrollNotifier,
            builder: (BuildContext context, index, _) {
              return NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  ScrollDirection direction = notification.direction;
                  if (direction == ScrollDirection.reverse) {
                    scrollNotifier.value = false;
                  } else {
                    if (direction == ScrollDirection.forward) {
                      scrollNotifier.value = true;
                    }
                  }
                  return true;
                },
                child: Stack(
                  children: [
                    ListView(
                      children: [
                        const BackgroundCard(),
                        Maintitlecard(
                          title: "Released in the Past",
                          category: HomeFunction.comingSoon,
                        ),
                        kheight,
                        Maintitlecard(
                          title: "Trending Now",
                          category: HomeFunction.trending,
                        ),
                        kheight,
                        const NumberTitleCard(
                          title: "Top 10 TV Shows in India Today",
                        ),
                        Maintitlecard(
                          title: "Tense Dramas",
                          category: HomeFunction.nowPlaying,
                        ),
                        kheight,
                        Maintitlecard(
                          title: "South Indian Cinema",
                          category: HomeFunction.topRated,
                        ),
                        kheight,
                      ],
                    ),
                    scrollNotifier.value == true
                        ? AnimatedContainer(
                            duration: const Duration(microseconds: 1000),
                            width: double.infinity,
                            height: 90,
                            color: Colors.black.withOpacity(0.3),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.network(
                                      'https://play-lh.googleusercontent.com/TBRwjS_qfJCSj1m7zZB93FnpJM5fSpMA_wUlFDLxWAb45T9RmwBvQd5cWR5viJJOhkI',
                                      width: 60,
                                      height: 60,
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () async {
                                        await HomeFunction.getTrending();
                                      },
                                      child: const Icon(
                                        Icons.cast,
                                        color: Colors.white,
                                        size: 27,
                                      ),
                                    ),
                                    KWidth,
                                    Container(
                                      width: 30,
                                      height: 30,
                                      color: Colors.blue,
                                    ),
                                    KWidth
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Tv Shows",
                                      style: kHometitleText,
                                    ),
                                    Text(
                                      "Movies",
                                      style: kHometitleText,
                                    ),
                                    Text(
                                      "Categories",
                                      style: kHometitleText,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        : kheight
                  ],
                ),
              );
            }));
  }

  TextButton playbutton() {
    return TextButton.icon(
        onPressed: () {},
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kwhite)),
        icon: const Icon(
          Icons.play_arrow,
          size: 25,
          color: kblack,
        ),
        label: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Play',
            style: TextStyle(fontSize: 20, color: kblack),
          ),
        ));
  }
}
