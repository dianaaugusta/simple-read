import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:simple_read_v2/config/api_provider.dart';
import 'package:simple_read_v2/screen/pages/disclaimer_page.dart';
import 'package:simple_read_v2/screen/pages/home.dart';
import 'package:simpleread_design_system/themes/themes.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: SimplereadTheme,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      getPages: [
        GetPage(name: '/main', page: () => const HomePage()),
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // return DisclaimerPage();
  @override
  Widget build(BuildContext context) {
      return const Scaffold(
        body: DisclaimerPage(),
      );
  }
}
