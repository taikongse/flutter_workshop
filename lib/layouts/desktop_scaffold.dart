import 'package:flutter/material.dart';
import 'package:ns_flutter/widgets/ns_app_bar.dart';
import 'package:ns_flutter/widgets/ns_drawer.dart';

class DesktopScaffold extends StatelessWidget {
  final Widget childOutlet;

  const DesktopScaffold({
    super.key,
    required this.childOutlet,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: nsAppBar(),
      drawer: nsDrawer(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: LayoutBuilder(builder: (context, contraints) {
            return childOutlet;
          }),
        ),
      ),
    );
  }
}
