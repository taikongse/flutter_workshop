import 'package:flutter/material.dart';
import 'package:ss_frontend_starter/widgets/ns_app_bar.dart';
import 'package:ss_frontend_starter/widgets/ns_drawer.dart';

class TabletScaffold extends StatelessWidget {
  final Widget childOutlet;

  const TabletScaffold({
    super.key,
    required this.childOutlet,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: nsAppBar(),
      drawer: nsDrawer(context),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: LayoutBuilder(builder: (context, contraints) {
            return childOutlet;
          }),
        ),
      ),
    );
  }
}
