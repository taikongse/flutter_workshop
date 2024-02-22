import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ns_flutter/utils/validator.dart';
import 'package:ns_flutter/controllers/signup_controller.dart';

class PageSignup extends GetView {
  final signupController = Get.put(SignupController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final birthDate = TextEditingController();
  final idCard = TextEditingController();
  final email = TextEditingController();

  void btngoBack() {
    Get.toNamed('/log-in');
  }

  void btnSignup(String? s) {
    if(_formKey.currentState!.validate()) {
      print('signup...');
      signupController.signup(username.text, password.text, firstName.text, lastName.text,  birthDate.text,  idCard.text,  email.text );
    }
  }

  @override
  Widget build(BuildContext context) {
    String? validateUsername(String? value) {
      const pattern = r'^[a-zA-z\d]+$';
      final regex = RegExp(pattern);
      return value!.isEmpty || !regex.hasMatch(value) ? 'Invalid username' : null;
    }
    String? validateFname(String? value){
      const pattern = r'^[a-zA-z]+$';
      final regex = RegExp(pattern);
      return value!.isEmpty || !regex.hasMatch(value) ? 'Invalid First name' : null;
    }
    String? validateLname(String? value){
      const pattern = r'^[a-zA-z]+$';
      final regex = RegExp(pattern);
      return value!.isEmpty || !regex.hasMatch(value) ? 'Invalid Last name' : null;
    }
    String? validateIdcard(String? value){
      const pattern = r'^\d{13}$';
      final regex = RegExp(pattern);
      return value!.isEmpty || !regex.hasMatch(value) ? 'Invalid ID card' : null;
    }
    String? validateEmail(String? value) {
      const pattern = r'^[.\w-]+@([\w-]+\.)+[\w-]{2,4}$';
      final regex = RegExp(pattern);
      return value!.isEmpty || !regex.hasMatch(value) ? 'Invalid email address' : null;
    }
    

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
                      onPressed: () => btngoBack(),
                    ),
                  ),
                  const Image(
                    image: AssetImage("assets/img/ns-logo.png"),
                  ),
                  Container(
                    padding: const EdgeInsets.all(45),
                    // alignment: Alignment.center,
                    // width: 800,
                    // color: Color.fromARGB(255, 102, 89, 89),
                    child: Form(
                      key: _formKey,
                      child: Wrap(
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.center,
                        // runAlignment: WrapAlignment.center,
                        // crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 15,
                        runSpacing: 15,
                        children: [
                          SizedBox(
                            width: 300,
                            child: TextFormField(
                              controller: username,
                              validator: validateUsername,
                              onFieldSubmitted: btnSignup,
                              decoration: const InputDecoration(
                                labelText: 'Username',
                                prefixIcon: Icon(Icons.person_2),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.purple)
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 300,
                            child: TextFormField(
                              controller: password,
                              validator: Validator().inputEmpty,
                              onFieldSubmitted: btnSignup,
                              decoration: const InputDecoration(
                                labelText: 'Password',
                                prefixIcon: Icon(Icons.password),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.purple)
                                ),
                              ),
                              obscureText: true,
                            ),
                          ),
                          SizedBox(
                            width: 300,
                            child: TextFormField(
                              controller: firstName,
                              validator: validateFname,
                              onFieldSubmitted: btnSignup,
                              decoration: const InputDecoration(
                                labelText: 'First name',
                                prefixIcon: Icon(Icons.text_fields),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.purple)
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 300,
                            child: TextFormField(
                              controller: lastName,
                              validator: validateLname,
                              onFieldSubmitted: btnSignup,
                              decoration: const InputDecoration(
                                labelText: 'Last name',
                                prefixIcon: Icon(Icons.text_fields),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.purple)
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 300,
                            child: TextFormField(
                              controller: idCard,
                              validator: validateIdcard,
                              onFieldSubmitted: btnSignup,
                              decoration: const InputDecoration(
                                labelText: 'ID Card',
                                prefixIcon: Icon(Icons.credit_card),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.purple)
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 300,
                            child: TextFormField(
                              controller: email,
                              validator: validateEmail,
                              onFieldSubmitted: btnSignup,
                              decoration: const InputDecoration(
                                labelText: 'Email',
                                prefixIcon: Icon(Icons.email),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.purple)
                                ),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: 300,
                              child: TextFormField(
                                controller: birthDate,
                                validator: Validator().inputEmpty,
                                onFieldSubmitted: btnSignup,
                                decoration: const InputDecoration(
                                  labelText: 'Birth date',
                                  prefixIcon: Icon(Icons.calendar_today),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.purple)
                                  ),
                                ),
                                readOnly: true,
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1950),
                                    //DateTime.now() - not to allow to choose before today.
                                    lastDate: DateTime.now(),
                                  );
                  
                                  if (pickedDate != null) {
                                    String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                                    birthDate.text = formattedDate; //set output date to TextField value.
                                  } else {}
                                },
                              ),
                            ),
                          ),
                        ],
                      ),

                    )
                  ),
                  SizedBox(
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () => btnSignup(''),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20),
                        textStyle:
                            const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      child: const Text("Sign up"),
                    ),
                  )
                ],
              ),
            )),
        ),
      ),
    );
  }

  // Future<void> _selectDate() async {
  //   DateTime? _picked = await showDatePicker(
  //     context: context,
  //     firstDate: DateTime(1900),
  //     lastDate: DateTime.now(),
  //     initialDate: DateTime.now()
  //   );
  //   if(_picked != null) {
  //     birthDate = _picked.toString().split('')[0] as TextEditingController;
  //   }
  // }
}
