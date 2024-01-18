import 'package:flutter/material.dart';
import 'package:ns_flutter/widgets/ns_app_bar.dart';
import 'package:ns_flutter/widgets/ns_drawer.dart';

class MobileScaffold extends StatelessWidget {
  final Widget childOutlet;

  const MobileScaffold({
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
          child: SingleChildScrollView(
            child: LayoutBuilder(builder: (context, contraints) {
              return childOutlet;
            }),
          ),
        ),
      ),
    );
  }
}
