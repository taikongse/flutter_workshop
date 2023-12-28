import 'package:flutter/material.dart';

AppBar nsAppBar() {
  return AppBar(
    title: const Image(
      image: AssetImage("assets/img/ns-logo.png"),
      width: 250,
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 8),
        child: IconButton(
          onPressed: () => {},
          icon: const Icon(Icons.notifications),
          iconSize: 28,
        ),
      ),
    ],
  );
}
