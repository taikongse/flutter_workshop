import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ns_flutter/controllers/signup_controller.dart';
import 'package:ns_flutter/utils/validator.dart';

class SignupPage extends StatelessWidget {
  final signupController = Get.put(SignupController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController idCardController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Container(
              width: 800,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.grey.shade200,
                  width: 2,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 40),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Get.toNamed('/log-in'),
                    ),
                  ),
                  const Image(
                    image: AssetImage("assets/img/ns-logo.png"),
                  ),
                  Container(
                    padding: const EdgeInsets.all(45),
                    child: Form(
                      key: _formKey,
                      child: Wrap(
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.center,
                        spacing: 15,
                        runSpacing: 15,
                        children: [
                          buildTextFormField(
                            controller: usernameController,
                            labelText: 'Username',
                            prefixIcon: Icons.person_2,
                            validator: Validator().inputEmpty,
                          ),
                          buildTextFormField(
                            controller: passwordController,
                            labelText: 'Password',
                            prefixIcon: Icons.password,
                            validator: Validator().inputEmpty,
                            obscureText: true,
                          ),
                          buildTextFormField(
                            controller: firstNameController,
                            labelText: 'First name',
                            prefixIcon: Icons.text_fields,
                            validator: Validator().inputEmpty,
                          ),
                          buildTextFormField(
                            controller: lastNameController,
                            labelText: 'Last name',
                            prefixIcon: Icons.text_fields,
                            validator: Validator().inputEmpty,
                          ),
                          buildTextFormField(
                            controller: idCardController,
                            labelText: 'ID Card',
                            prefixIcon: Icons.credit_card,
                            validator: Validator().inputEmpty,
                          ),
                          buildTextFormField(
                            controller: emailController,
                            labelText: 'Email',
                            prefixIcon: Icons.email,
                            validator: Validator().inputEmpty,
                          ),
                          buildTextFormField(
                            controller: birthDateController,
                            labelText: 'Birth date',
                            prefixIcon: Icons.calendar_today,
                            validator: Validator().inputEmpty,
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                lastDate: DateTime.now(),
                              );

                              if (pickedDate != null) {
                                String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                                birthDateController.text = formattedDate;
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          signupController.signup(
                            usernameController.text,
                            passwordController.text,
                            firstNameController.text,
                            lastNameController.text,
                            birthDateController.text,
                            idCardController.text,
                            emailController.text,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        textStyle: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      child: const Text("Sign up"),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextFormField({
    required TextEditingController controller,
    required String labelText,
    required IconData prefixIcon,
    required String? Function(String?) validator,
    bool obscureText = false,
    bool readOnly = false,
    VoidCallback? onTap,
  }) {
    return SizedBox(
      width: 300,
      child: TextFormField(
        controller: controller,
        validator: validator,
        onFieldSubmitted: (_) {
          if (readOnly) {
            onTap?.call();
          }
        },
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Icon(prefixIcon),
          enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
        ),
        obscureText: obscureText,
        readOnly: readOnly,
        onTap: onTap,
      ),
    );
  }
}
