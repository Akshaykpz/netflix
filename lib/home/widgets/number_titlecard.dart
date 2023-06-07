import 'package:flutter/material.dart';


import '../../constants.dart';
import '../../widgets/main_title.dart';
import 'functions/function.dart';
import 'number_card.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Maintitle(title: title),
        kheight,
        kheight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              10,
              ((index) => NumberCard(
                    index: index,
                    image: HomeFunction.comingSoon[index].posterPath!,
                  )),
            ),
          ),
        )
      ],
    );
  }
}
