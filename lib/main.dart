import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ns_flutter/app_theme.dart';
import 'package:ns_flutter/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NS Flutter',
      theme: appTheme(),
      initialRoute: "/",
      defaultTransition: Transition.fadeIn,
      getPages: pageRender,
    );
  }
}
