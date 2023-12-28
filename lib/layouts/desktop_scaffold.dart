import 'package:flutter/material.dart';
import 'package:ss_frontend_starter/widgets/ns_drawer.dart';

class DesktopScaffold extends StatelessWidget {
  final Widget childOutlet;

  const DesktopScaffold({
    super.key,
    required this.childOutlet,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              nsDrawer(context),
              Padding(
                padding: const EdgeInsets.all(24),
                child: SingleChildScrollView(
                  child: LayoutBuilder(builder: (context, contraints) {
                    return childOutlet;
                  }),
                ),
              )
            ]),
      ),
    );
  }
}
