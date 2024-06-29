import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:wallpaper_app/model/image_response.dart';
import 'package:wallpaper_app/widget/round_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.photo});
  final Photos photo;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(widget.photo.src?.portrait ?? "",fit: BoxFit.fill,width: double.infinity,height: double.infinity),
          Positioned(
            left: 17,
            top: 17,
            child: RoundButton(
              icon: CupertinoIcons.back,
              onClick: () => Navigator.of(context).pop(),
            ),
          ),
          Positioned(
            left: 17,
            right: 17,
            bottom: 17,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RoundButton(
                  icon: CupertinoIcons.info,
                  onClick: () {},
                ),
                RoundButton(
                  icon: CupertinoIcons.photo,
                  onClick: _onSetWallpaper,
                ),
                RoundButton(
                  icon: Icons.share,
                  onClick: () {},
                ),
                RoundButton(
                  icon: CupertinoIcons.heart,
                  onClick: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  void _onSetWallpaper() async {
    final result = await AsyncWallpaper.setWallpaper(url: widget.photo.src?.portrait ?? "");
    print(result);
  }
}
