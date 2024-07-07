import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtrack/constants/routers.dart';
import 'package:mtrack/constants/theme_color.dart';
import 'package:mtrack/views/bill/bill_page.dart';
import 'package:mtrack/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: ThemeColor.primary),
          useMaterial3: true,
        ),
        initialRoute: '/',
        getPages: [
          GetPage(name: Routers.homePage, page: () => const HomePage()),
        ],
        home: HomePage()
    );
  }
}

