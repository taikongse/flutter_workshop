import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class PageLogin extends GetView {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: // Generated code for this Container Widget...
          Center(
        child: Padding(
          padding: const EdgeInsetsDirectional.all(24),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            constraints: const BoxConstraints(maxWidth: 500, maxHeight: 550),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.grey.shade200,
                width: 2,
              ),
            ),
            child: Center(
              child: Padding(
                  padding: const EdgeInsets.all(50),
                  child: Form(
                    key: _formKey,
                    child: Wrap(
                      spacing: 25,
                      runSpacing: 25,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 20, bottom: 30),
                          child: Image(
                            image: AssetImage("assets/img/ns-logo.png"),
                          ),
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(hintText: "Username"),
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(hintText: "Password"),
                          obscureText: true,
                        ),
                        SizedBox(
                          width: context.width,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 20),
                              textStyle:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            child: const Text("Sign in"),
                          ),
                        )
                      ],
                    ),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
