import 'package:flutter/material.dart';
import 'package:wallpaper_app/model/image_response.dart';

class ImageItem extends StatelessWidget {
  const ImageItem({super.key, required this.photo, required this.onClick});

  final Photos photo;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: onClick,
        borderRadius: BorderRadius.circular(6),
        child: Ink(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6)
          ),
          child: FadeInImage(
            fit: BoxFit.cover,
              placeholder: const AssetImage('assets/img/empty.png'), image: NetworkImage(
              photo.src?.medium ?? "",
          )),
        ));
  }
}
