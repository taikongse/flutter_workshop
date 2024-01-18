import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:ns_flutter/layouts/responsive_layout.dart';
import 'package:ns_flutter/views/dashboard.dart';
import 'package:ns_flutter/views/signin.dart';

List<GetPage<dynamic>>? pageRender = [
  GetPage(name: '/sign-in', page: () => PageSignin()),
  GetPage(
      name: "/",
      page: () => ResponsiveLayout(childOutlet: const PageDashboard())),
];
