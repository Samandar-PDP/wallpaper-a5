import 'dart:ui';
import 'package:flutter/material.dart';

class MyBottomNav extends StatefulWidget {
  const MyBottomNav({super.key, required this.index, required this.onClick});

  final int index;
  final void Function(int index) onClick;

  @override
  State<MyBottomNav> createState() => _MyBottomNavState();
}

class _MyBottomNavState extends State<MyBottomNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100), color: Colors.white12),
      margin: const EdgeInsets.symmetric(horizontal: 22,vertical: 30),
      width: MediaQuery.of(context).size.width,
      height: 70,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: BackdropFilter(
          // blur
          filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10), // blur
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _iconBtn(0, 'home', () => widget.onClick(0)),
                _iconBtn(1, 'star', () => widget.onClick(1)),
                _iconBtn(2, 'refresh', () => widget.onClick(2)),
                _iconBtn(3, 'favorite', () => widget.onClick(3)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _iconBtn(int place, String icon, VoidCallback onClick) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: onClick, icon: Image.asset('assets/img/$icon.png',width: 22, height: 22)),
          AnimatedContainer(
              height: 6,
              width: 6,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: place == widget.index
                      ? const Color(0xFFF222DD)
                      : Colors.transparent), duration: const Duration(milliseconds: 300),)
        ],
      ),
    );
  }
}
