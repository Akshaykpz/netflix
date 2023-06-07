import 'package:flutter/cupertino.dart';
import 'package:netflix_12/serach/widgets/title.dart';

import '../../constants.dart';
import 'fuctions/function.dart';

const imageurl =
    'https://www.themoviedb.org/t/p/w440_and_h660_face/rM5Y0ziZbmpkqW1db2HK3xrzTXj.jpg';

class SearchResultWidgets extends StatelessWidget {
  const SearchResultWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Movies & Tv'),
        kheight,
        ValueListenableBuilder(
            valueListenable: SearchFunction.searchData,
            builder: (context, value, child) {
              return Expanded(
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1 / 1.4,
                  children: List.generate(
                      value.length,
                      (index) => MainCard(
                            image: value[index].posterPath ??
                                'https://www.themoviedb.org/t/p/w440_and_h660_face/rM5Y0ziZbmpkqW1db2HK3xrzTXj.jpg',
                          )),
                ),
              );
            })
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        image: DecorationImage(
            image: NetworkImage('https://image.tmdb.org/t/p/w500$image'),
            fit: BoxFit.cover),
      ),
    );
  }
}
