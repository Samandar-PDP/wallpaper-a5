import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/viewmodel/home_provider.dart';
import 'package:wallpaper_app/widget/image_item.dart';
import 'package:wallpaper_app/widget/my_search_bar.dart';

import '../model/image_response.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isFirstTime = true;
  late ScrollController _scrollController;
  bool _isSearchVisible = false;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      _isSearchVisible = _scrollController.position.userScrollDirection == ScrollDirection.forward;
      setState(() {});
    });
    super.initState();
  }

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
    if (_isFirstTime) {
      Provider.of<HomeProvider>(context, listen: false).fetchImages('all');
      _isFirstTime = false;
    }
    final images = Provider.of<HomeProvider>(context).imageList;
    return DefaultTabController(
      initialIndex: 0,
      length: 6,
      child: Scaffold(
        appBar: TabBar(
          onTap: (index) {
            Provider.of<HomeProvider>(context, listen: false)
                .fetchImages(_tabs[index].toLowerCase());
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
        body: images.isEmpty
            ? Center(
                child: LoadingAnimationWidget.threeRotatingDots(
                    color: Colors.white, size: 100))
            : _successBody(images),
      ),
    );
  }

  _successBody(List<Photos> imageList) {
    return Stack(
      children: [
        GridView.builder(
          controller: _scrollController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 4, crossAxisCount: 3, crossAxisSpacing: 4),
          itemCount: imageList.length,
          itemBuilder: (context, index) =>
              ImageItem(photo: imageList[index], onClick: () {}),
        ),
        Positioned(
            top: 12,
            left: 12,
            right: 12,
            child: _isSearchVisible ? MySearchBar(
              onSearch: (query) {
                print(query);
              },
            ) : Container()
        )
      ],
    );
  }
}
