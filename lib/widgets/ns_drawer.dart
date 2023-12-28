import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

Drawer nsDrawer(BuildContext context) {
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
              leading: const Icon(Icons.fact_check_outlined),
              title: const Text("Check Stock"),
              onTap: () => Get.toNamed("/check-stock"),
            ),
            ListTile(
              leading: const Icon(Icons.warehouse_outlined),
              title: const Text("Stock in"),
              onTap: () => Get.toNamed("/stock-in"),
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
                      onPressed: () => Navigator.pushNamed(context, "/sign-in"),
                      icon: const Icon(Icons.logout))
                ],
              ),
            ],
          ),
        ]),
  );
}
