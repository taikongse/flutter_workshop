import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ss_frontend_starter/controllers/staff_controller.dart';

class PageSignin extends StatelessWidget {
  PageSignin({super.key});
  final StaffController staffController = Get.put(StaffController());

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
                        decoration: const InputDecoration(hintText: "Username"),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(hintText: "Password"),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                var isSuccess = staffController.fetchLogin(
                                    "username", "password");
                                if (isSuccess) {
                                  Get.snackbar(
                                      'NS Success', 'Sign-in succesfuly',
                                      duration: const Duration(seconds: 2),
                                      backgroundColor: Colors.green.shade300);
                                  Get.toNamed("/");
                                } else {
                                  Get.snackbar("Error", "Fail to signin.",
                                      duration: const Duration(seconds: 1),
                                      backgroundColor: Colors.red.shade400);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.purple,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50, vertical: 20),
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              child: const Text("Sign in")),
                          Text("For got password?")
                        ],
                      )
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
