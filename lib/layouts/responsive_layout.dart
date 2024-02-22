import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ns_flutter/layouts/desktop_scaffold.dart';
import 'package:ns_flutter/layouts/mobile_scaffold.dart';
import 'package:ns_flutter/layouts/tablet_scaffold.dart';
import 'package:ns_flutter/models/staff.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget childOutlet;

  Future<void> initializeSettings() async {
    await Future.delayed(const Duration(seconds: 1));
    var localStaff = GetStorage().read("staff");
    if (localStaff == null) {
      Get.toNamed("/log-in");
    } else {
      var staff = ModelStaff.fromJson(localStaff);
      if (staff.token == '') {
        Get.toNamed("/log-in");
      }
    }
  }

  const ResponsiveLayout({
    super.key,
    required this.childOutlet,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeSettings(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return waitingView();
        } else {
          if (snapshot.hasError) {
            return errorView(snapshot);
          } else {
            return LayoutBuilder(builder: (context, contraints) {
              if (contraints.maxWidth < 500) {
                return MobileScaffold(childOutlet: childOutlet);
              } else if (contraints.maxWidth < 1100) {
                return TabletScaffold(childOutlet: childOutlet);
              } else {
                return DesktopScaffold(childOutlet: childOutlet);
              }
            });
          }
        }
      },
    );
  }

  Scaffold errorView(AsyncSnapshot<Object?> snapshot) {
    return Scaffold(body: Center(child: Text('Error: ${snapshot.error}')));
  }

  Scaffold waitingView() {
    return const Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: CircularProgressIndicator(),
          ),
          Text('Processing...'),
        ],
      ),
    ));
  }
}
