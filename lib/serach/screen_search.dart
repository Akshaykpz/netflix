import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_12/serach/widgets/fuctions/function.dart';
import 'package:netflix_12/serach/widgets/screen_idle.dart';
import 'package:netflix_12/serach/widgets/serach_reslt.dart';


import '../constants.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                onChanged: (value) async {
                  SearchFunction.searchResult(value);
                },
                backgroundColor: Colors.grey.withOpacity(0.4),
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,
                ),
                suffixIcon: const Icon(
                  CupertinoIcons.xmark_circle_fill,
                  color: Colors.grey,
                ),
                style: const TextStyle(color: Colors.white),
              ),
              kheight,
              Expanded(
                  child: ValueListenableBuilder(
                valueListenable: SearchFunction.searchData,
                builder: (context, value, child) {
                  return value.isEmpty
                      ? SearchIdelWidget()
                      : const SearchResultWidgets();
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
