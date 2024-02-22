import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ns_flutter/controllers/signin_controller.dart';
import 'package:ns_flutter/utils/validator.dart';

class LoginPage extends StatelessWidget {
  final signinController = Get.put(SigninController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  void submitSignIn() {
    if (_formKey.currentState!.validate()) {
      signinController.signin(usernameController.text, passwordController.text);
    }
  }

  void navigateToSignUp() {
    Get.toNamed('/sign-up');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500, maxHeight: 550),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.grey.shade200,
                width: 2,
              ),
            ),
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
                      controller: usernameController,
                      validator: Validator().inputEmpty,
                      onFieldSubmitted: (_) => submitSignIn(),
                      decoration: const InputDecoration(hintText: "Username"),
                    ),
                    TextFormField(
                      controller: passwordController,
                      validator: Validator().inputEmpty,
                      onFieldSubmitted: (_) => submitSignIn(),
                      decoration: const InputDecoration(hintText: "Password"),
                      obscureText: true,
                    ),
                    SizedBox(
                      width: context.width,
                      child: ElevatedButton(
                        onPressed: submitSignIn,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                          textStyle: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        child: const Text("Sign in"),
                      ),
                    ),
                    SizedBox(
                      width: context.width,
                      child: ElevatedButton(
                        onPressed: navigateToSignUp,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                          textStyle: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        child: const Text("Sign up"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
