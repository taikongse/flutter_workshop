import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ns_flutter/core/authentication_manager.dart';
import 'package:ns_flutter/models/staff.dart';

Drawer nsDrawer(BuildContext context) {
  final AuthenticationManager auth = Get.put(AuthenticationManager());
  final staff = ModelStaff.fromJson(GetStorage().read("staff"));
  var staffName = staff.username?.toString() ?? '';
  var staffEmail = staff.email?.toString() ?? '';

  return Drawer(
    backgroundColor: Colors.grey.shade100,
    child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const DrawerHeader(
              child: Image(image: AssetImage("assets/img/ns-logo.png")),
            ),
            _buildListTile(
              icon: Icons.dashboard,
              title: "Dashboard",
              onTap: () => Get.toNamed("/"),
            ),
            _buildListTile(
              icon: Icons.dashboard,
              title: "Check stock",
              onTap: () => Get.toNamed("/check-stock"),
            ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Divider(),
            _buildUserDetails(staffName, staffEmail, auth),
          ],
        ),
      ],
    ),
  );
}

// Helper method to build ListTile
Widget _buildListTile({IconData? icon, String? title, Function()? onTap}) {
  return ListTile(
    leading: Icon(icon),
    title: Text(title ?? ""),
    onTap: onTap,
  );
}

// Helper method to build user details
Widget _buildUserDetails(String staffName, String staffEmail, AuthenticationManager auth) {
  return Row(
    children: [
      const Padding(
        padding: EdgeInsets.only(left: 8, right: 8),
        child: Image(
          image: AssetImage("assets/img/square-logo.png"),
          width: 64,
          height: 64,
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            staffName,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text(
            staffEmail,
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
      IconButton(
        onPressed: () {
          auth.logOut();
          Get.toNamed("/log-in");
        },
        icon: const Icon(Icons.logout),
      ),
    ],
  );
}
