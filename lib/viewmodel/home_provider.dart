import 'package:flutter/cupertino.dart';
import 'package:wallpaper_app/model/image_response.dart';
import 'package:wallpaper_app/repository/app_repository.dart';

class HomeProvider with ChangeNotifier {
  final List<Photos> imageList = [];
  final _repo = AppRepository();

  void fetchImages(String query) async {
    imageList.clear();
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 500));
    final list = await _repo.getImages(query);
    imageList.addAll(list);
    notifyListeners(); // setState
  }
}