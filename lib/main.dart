import 'package:ant_design_flutter/ant_design_flutter.dart';
import 'package:get/get.dart';
import 'package:ss_frontend_starter/app_theme.dart';
import 'package:ss_frontend_starter/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NS Frontend Starter',
      theme: appTheme(),
      initialRoute: "/",
      defaultTransition: Transition.fadeIn,
      getPages: pageRender,
    );
  }
}
