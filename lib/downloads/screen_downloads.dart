import 'dart:math';

import 'package:flutter/material.dart';

import '../constants.dart';
import '../core/colors/colors.dart';
import '../home/widgets/functions/function.dart';
import '../widgets/app_bar.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});
  final List _Widgets = [
    const SmartDownloads(),
    Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarwidget(
              title: "Downloads",
            )),
        body: ListView.separated(
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) => _Widgets[index],
            separatorBuilder: (context, index) => const SizedBox(
                  height: 25,
                ),
            itemCount: _Widgets.length));
  }
}

//section 1

class SmartDownloads extends StatelessWidget {
  const SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        KWidth,
        Icon(
          Icons.settings,
          color: kwhite,
        ),
        KWidth,
        Text("Smart Downloads")
      ],
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});
  final List imagelist = [
    HomeFunction.comingSoon[6].posterPath,
    HomeFunction.nowPlaying[4].posterPath, HomeFunction.topRated[1].posterPath
    // "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/v7UF7ypAqjsFZFdjksjQ7IUpXdn.jpg",
    // "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg",
    // "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/aKx1ARwG55zZ0GpRvU2WrGrCG9o.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          "Indroducing Downloads for you",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kwhite, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        kheight,
        const Text(
          textAlign: TextAlign.center,
          "We will download a personalised selection of\nmovies and shows for you,so there's\nis always somthing to watch on your\ndevice",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        kheight,
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(alignment: Alignment.center, children: [
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.grey.withOpacity(0.5),
                radius: size.width * 0.4,
              ),
            ),
            DownloadsImagewidgets(
              imagelist: imagelist[0],
              margin: const EdgeInsets.only(left: 170, top: 50),
              angle: 25,
              size: Size(size.width * 0.35, size.width * 0.55),
            ),
            DownloadsImagewidgets(
              imagelist: imagelist[1],
              margin: const EdgeInsets.only(right: 170, top: 50),
              angle: -20,
              size: Size(size.width * 0.35, size.width * 0.55),
            ),
            DownloadsImagewidgets(
              imagelist: imagelist[2],
              radius: 8,
              margin: const EdgeInsets.only(bottom: 35, top: 50),
              size: Size(size.width * 0.4, size.width * 0.6),
            ),
          ]),
        ),
      ],
    );
  }
}

//section3

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: kbuttbottoncolorblue,
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'SetUp',
                style: TextStyle(
                    color: kwhite, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        kheight,
        MaterialButton(
          color: kwhite,
          onPressed: () {},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'See what you can download',
              style: TextStyle(
                  color: kblack, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}

class DownloadsImagewidgets extends StatelessWidget {
  const DownloadsImagewidgets(
      {Key? key,
      required this.imagelist,
      this.angle = 0,
      required this.margin,
      required this.size,
      this.radius = 10})
      : super(key: key);

  final String imagelist;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Container(
            // margin: margin,
            width: size.width,
            height: size.height,
            // color: kblack,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://image.tmdb.org/t/p/w500$imagelist'))),
          ),
        ),
      ),
    );
  }
}
