import 'package:flutter/material.dart';
import 'package:netflix_12/mainpage/widgets/bottom_nav.dart';

import '../fastlaugh/screen_fast.dart';

import '../home/widgets/screeen_home.dart';
import '../newand_hot.dart/screen_newand_hot.dart';
import '../presentation/downloads/screen_download.dart';
import '../serach/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});
  final List pages = [
    const ScreenHome(),
    const ScreenNewAndHot(),
    const ScreenFastLaugh(),
    const ScreenSearch(),
    ScreenDownloads(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexchangenotifier,
          builder: (context, index, child) {
            return pages[index];
          },
        ),
      ),
      bottomNavigationBar: const BottomNavigationWidgets(),
    );
  }
}
