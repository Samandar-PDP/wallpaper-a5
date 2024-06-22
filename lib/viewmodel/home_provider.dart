import 'package:flutter/cupertino.dart';
import 'package:wallpaper_app/model/image_response.dart';
import 'package:wallpaper_app/repository/app_repository.dart';

class HomeProvider with ChangeNotifier {
  final List<Photos> imageList = [];
  final _repo = AppRepository();

  void fetchImages(String query) async {
    await Future.delayed(const Duration(seconds: 1));
    final list = await _repo.getImages(query);
    imageList.clear();
    imageList.addAll(list);
    notifyListeners(); // setState
  }
}