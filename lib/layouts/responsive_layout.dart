import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ss_frontend_starter/core/authentication_manager.dart';
import 'package:ss_frontend_starter/layouts/desktop_scaffold.dart';
import 'package:ss_frontend_starter/layouts/mobile_scaffold.dart';
import 'package:ss_frontend_starter/layouts/tablet_scaffold.dart';
import 'package:ss_frontend_starter/views/signin.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget childOutlet;
  final AuthenticationManager _authManager = Get.put(AuthenticationManager());

  Future<void> initializeSettings() async {
    _authManager.checkLoginStatus();
    await Future.delayed(const Duration(seconds: 2));
    if (_authManager.isLogged.isFalse) {
      Get.toNamed("/sign-in");
    }
  }

  ResponsiveLayout({
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
            return Obx(() => _authManager.isLogged.isTrue
                ? LayoutBuilder(builder: (context, contraints) {
                    if (contraints.maxWidth < 500) {
                      return MobileScaffold(childOutlet: childOutlet);
                    } else if (contraints.maxWidth < 1100) {
                      return TabletScaffold(childOutlet: childOutlet);
                    } else {
                      return DesktopScaffold(childOutlet: childOutlet);
                    }
                  })
                : PageSignin());
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
