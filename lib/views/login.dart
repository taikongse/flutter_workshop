import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ns_flutter/controllers/signin_controller.dart';
import 'package:ns_flutter/utils/validator.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class PageLogin extends GetView {
  final signinController = Get.put(SigninController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController username = TextEditingController();
  final password = TextEditingController();

  void submitSignin(String? s) {
    if(_formKey.currentState!.validate()) {
      print("username: ${username.text}");
      signinController.signin(username.text, password.text);
    }
  }
  void btnSignup() {
    Get.toNamed('/sign-up');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: // Generated code for this Container Widget...
          Center(
        child: Padding(
          padding: const EdgeInsetsDirectional.all(24),
          child: Container(
            width: context.width,
            height: context.height,
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
                          controller: username,
                          validator: Validator().inputEmpty,
                          onFieldSubmitted: submitSignin,
                          decoration:
                              const InputDecoration(hintText: "Username"),
                        ),
                        TextFormField(
                          controller: password,
                          validator: Validator().inputEmpty,
                          onFieldSubmitted: submitSignin,
                          decoration:
                              const InputDecoration(hintText: "Password"),
                          obscureText: true,
                        ),
                        SizedBox(
                          width: context.width,
                          child: ElevatedButton(
                            onPressed: () => submitSignin(""),
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
                        ),
                        SizedBox(
                          width: context.width,
                          child: ElevatedButton(
                            onPressed: () => btnSignup(),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 20),
                              textStyle:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            child: const Text("Sign up"),
                          ),
                        ),
                        // Text(
                        //   'user text => ${username.text}',
                        //   style: const TextStyle(
                        //     fontSize: 15, fontWeight: FontWeight.bold
                        //     ),
                        // ),
                        // Obx(() => Text(
                        //   'user name => ${username.text}',
                        //   style: const TextStyle(fontSize: 18),
                        // )),
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
