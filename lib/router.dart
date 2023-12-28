import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:ss_frontend_starter/layouts/responsive_layout.dart';
import 'package:ss_frontend_starter/views/check_stock.dart';
import 'package:ss_frontend_starter/views/dashboard.dart';
import 'package:ss_frontend_starter/views/signin.dart';
import 'package:ss_frontend_starter/views/stock_in.dart';

List<GetPage<dynamic>>? pageRender = [
  GetPage(name: '/sign-in', page: () => PageSignin()),
  GetPage(
      name: "/",
      page: () => ResponsiveLayout(childOutlet: const PageDashboard())),
  GetPage(
      name: '/check-stock',
      page: () => ResponsiveLayout(childOutlet: const PageCheckStock())),
  GetPage(
      name: '/stock-in',
      page: () => ResponsiveLayout(childOutlet: const PageStockIn())),
];
