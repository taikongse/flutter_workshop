import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:ns_flutter/layouts/responsive_layout.dart';
import 'package:ns_flutter/views/dashboard.dart';
import 'package:ns_flutter/views/login.dart';
import 'package:ns_flutter/views/signup.dart';

List<GetPage<dynamic>>? pageRender = [
  GetPage(name: '/log-in', page: () => PageLogin()),
  GetPage(name: '/sign-up', page: () => PageSignup()),
  GetPage(
      name: "/",
      page: () => const ResponsiveLayout(childOutlet: PageDashboard())),
];
