import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ns_flutter/models/staff.dart';

class PageDashboard extends StatefulWidget {
  const PageDashboard({super.key});

  @override
  State<PageDashboard> createState() => _PageDashboardState();
}

class _PageDashboardState extends State<PageDashboard> {
  @override
  Widget build(BuildContext context) {
    // final box = GetStorage();
    // ModelStaff? staff = box.read<ModelStaff>('staff');
    // final firstName = staff?.firstName ?? "";
    // final store = GetStorage();
    // ModelStaff? staff = store.read<ModelStaff>('staff');
    // final userName = staff?.username ?? "";
    return const Text("Welcome ❤️ ");
  }
}
