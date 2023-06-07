import 'package:flutter/material.dart';

import 'home/widgets/functions/function.dart';
import 'mainpage/sceenmain_page.dart';
import 'newand_hot.dart/widgets/functions/function.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    splash(context);
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDmmMZIyhtPhFrPgNJluXUJYJXROSX8Ua67A&usqp=CAU'),
      )),
    );
  }
}

Future<void> splash(BuildContext context) async {
  await HomeFunction.getComingSoon();
  await HomeFunction.gettopRated();
  await HomeFunction.getNowPlaying();
  await NewAndHotFunctions.getDiscover();
  HomeFunction.getTrending().whenComplete(
    () => Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => ScreenMainPage(),
      ),
    ),
  );
}
