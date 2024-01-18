import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ns_flutter/core/cache_manager.dart';
import 'package:ns_flutter/models/initial_app.dart';
import 'package:ns_flutter/models/staff.dart';
import 'package:ns_flutter/utils/api_call.dart';

class SigninController extends GetxController with CacheManager {
  final SigninProvider signinProvider = Get.put(SigninProvider());
  final username = TextEditingController();
  final password = TextEditingController();

  @override
  void onClose() {
    username.dispose();
    password.dispose();
  }

  Future<void> signin() async {
    if (username.text.isNotEmpty && password.text.isNotEmpty) {
      // final AuthenticationManager auth = Get.put(AuthenticationManager());
      // final isSuccess = await apiCheckUser(
      // ModelSigninStaff(username: username.text, password: password.text));
      // if (isSuccess) {
      //   // Set token
      //   auth.login("Token");
      //   Get.toNamed("/");
      // } else {
      //   Get.snackbar("Error", "Fail to signin.",
      //       duration: const Duration(seconds: 1),
      //       backgroundColor: Colors.red.shade400);
      // }
      var body = ModelStaff(Username: username.text, Password: password.text);
      var response = await signinProvider.signin(body);
      // var response =
      //     await ApiCall().post("/auth/signin", data: body.requestBodyToJson());
      log("RESPONSE: ${response.body}");
    }
  }

  // Future<bool> apiCheckUser(ModelSigninStaff body) async {
  //   try {
  //     // var api = await ApiCall().post("/auth/signin", data: body.toJson());
  //     // log("response: ${api.data}");
  //     return Future.value(false);
  //   } catch (err) {
  //     log("err: $err");
  //     throw Exception(err.toString());
  //   }
  // }
}

class SigninProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'https://training.dev.ns.co.th';
  }

  Future<Response<dynamic>> signin(ModelStaff body) =>
      post('/auth/signin', body, decoder: ApiResponse.fromJson);
}
