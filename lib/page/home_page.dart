import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 6,
      child: Scaffold(
        appBar: TabBar(
          tabAlignment: TabAlignment.start,
          tabs: [
            Tab(text: "All"),
            Tab(text: "New"),
            Tab(text: "Animals"),
            Tab(text: "Technology"),
            Tab(text: "Nature"),
          ],
          padding: EdgeInsets.all(12),
          isScrollable: true,
          indicatorWeight: 1,
          indicatorColor: Color(0xFFF222DD),
        ),

      ),
    );
  }
}
