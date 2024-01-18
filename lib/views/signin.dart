import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ns_flutter/controllers/signin_controller.dart';
import 'package:ns_flutter/utils/validator.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class PageSignin extends GetView {
  final cStaff = Get.put(SigninController());
  final validator = Validator();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void submit(String? value) {
    if (_formKey.currentState!.validate()) {
      cStaff.signin();
    }
  }

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
                          controller: cStaff.username,
                          validator: validator.inputEmpty,
                          onFieldSubmitted: submit,
                          decoration:
                              const InputDecoration(hintText: "Username"),
                        ),
                        TextFormField(
                          controller: cStaff.password,
                          validator: validator.inputEmpty,
                          onFieldSubmitted: submit,
                          decoration:
                              const InputDecoration(hintText: "Password"),
                          obscureText: true,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                                onPressed: () => submit(""),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.purple,
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 50, vertical: 20),
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                child: const Text("Sign in")),
                            const Text("For got password?")
                          ],
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
