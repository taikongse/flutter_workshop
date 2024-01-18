import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ns_flutter/core/authentication_manager.dart';

Drawer nsDrawer(BuildContext context) {
  final AuthenticationManager auth = Get.put(AuthenticationManager());

  return Drawer(
    backgroundColor: Colors.grey.shade100,
    child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(mainAxisSize: MainAxisSize.max, children: [
            const DrawerHeader(
                child: Image(image: AssetImage("assets/img/ns-logo.png"))),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text("Dashboard"),
              onTap: () => Get.toNamed("/"),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text("Check stock"),
              onTap: () => Get.toNamed("/check-stock"),
            ),
          ]),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Divider(),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    child: Image(
                      image: AssetImage("assets/img/square-logo.png"),
                      width: 64,
                      height: 64,
                    ),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "AD Administrator",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "yim@ns.co.th",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        auth.logOut();
                        Get.toNamed("/sign-in");
                      },
                      icon: const Icon(Icons.logout))
                ],
              ),
            ],
          ),
        ]),
  );
}
