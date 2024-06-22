import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/viewmodel/home_provider.dart';
import 'package:wallpaper_app/widget/image_item.dart';

import '../model/image_response.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool _isFirstTime = true;

  final _tabs = [
    'All',
    'New',
    'Animals',
    'Technology',
    'Nature',
    'Sport',
  ];
  
  @override
  Widget build(BuildContext context) {
    if(_isFirstTime) {
      Provider.of<HomeProvider>(context).fetchImages('all');
      _isFirstTime = false;
    }
    final provider = Provider.of<HomeProvider>(context).imageList;
    return DefaultTabController(
      initialIndex: 0,
      length: 6,
      child: Scaffold(
        appBar: TabBar(
          onTap: (index) {
            Provider.of<HomeProvider>(context,listen: false).fetchImages(_tabs[index].toLowerCase());
          },
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          tabAlignment: TabAlignment.start,
          tabs: const [
            Tab(text: "All"),
            Tab(text: "New"),
            Tab(text: "Animals"),
            Tab(text: "Technology"),
            Tab(text: "Nature"),
            Tab(text: "Sport")
          ],
          padding: const EdgeInsets.all(12),
          isScrollable: true,
          indicatorWeight: 1,
          indicatorColor: const Color(0xFFF222DD),
        ),
        body: provider.isEmpty ? Center(child: LoadingAnimationWidget.fourRotatingDots(color: Colors.white, size: 100)) : _successBody(provider),
      ),
    );
  }
  _successBody(List<Photos> imageList) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 4,
        crossAxisCount: 3,
        crossAxisSpacing: 4
      ),
      itemCount: imageList.length,
      itemBuilder: (context, index) => ImageItem(photo: imageList[index], onClick: () {}),
    );
  }
}
