import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MySearchBar extends StatelessWidget {
  MySearchBar({super.key, required this.onSearch});
  final Function(String query) onSearch;

  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50), color: Colors.white12),
    width: MediaQuery.of(context).size.width,
    height: 60,
    child: ClipRRect(
    borderRadius: BorderRadius.circular(50),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 50,
          sigmaY: 50
        ),
        child: SearchBar(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          elevation: MaterialStateProperty.all(0),
          leading: const Icon(CupertinoIcons.search,color: Colors.white),
          textStyle: MaterialStateProperty.all(const TextStyle(
            color: Colors.white
          )),
          onChanged: (value) {
            if(_timer?.isActive == true) {
              _timer?.cancel();
            }
            _timer = Timer(700.ms, () {
              onSearch(value);
            });
          },
        ),
      ),
    )
    ).animate(delay: 100.ms).fade(duration: 100.ms).move(duration: 300.ms);
  }
}
