import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/page/main_page.dart';
import 'package:wallpaper_app/viewmodel/home_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF774bfe),brightness: Brightness.dark),
          useMaterial3: true,
        ),
        home: const MainPage(),
      )
    );
  }
}

