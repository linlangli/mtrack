import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mtrack/constants/routers.dart';
import 'package:mtrack/constants/theme_color.dart';
import 'package:mtrack/views/home_page.dart';

void main() async {
  await Hive.initFlutter();
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
        home: const HomePage()
    );
  }
}

