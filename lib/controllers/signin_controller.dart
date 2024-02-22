import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ns_flutter/models/initial_app.dart';
import 'package:ns_flutter/models/staff.dart';
import 'package:ns_flutter/widgets/ns_snackbar.dart';

class SigninController extends GetxController {
  final SigninProvider _signinProvider = Get.put(SigninProvider());

  Future<void> signin(String username, String password) async {
    if (username.isNotEmpty && password.isNotEmpty) {
      final body = ModelStaff(
        username: username,
        password: md5.convert(utf8.encode(password)).toString(),
      ).signinBodyToJson();
      final response = await _signinProvider.signin(body);

      if (response.statusCode == 200) {
        final staff = ModelStaff.fromJson(response.body?.data);
        await GetStorage().write("staff", staff.toJson());
        Get.toNamed("/");
      } else {
        final responseMessage =
            response.body == null ? response.statusText : response.body.message;
        showErrorMessage(
            "Process failed", responseMessage ?? "failed: $response");
      }
    }
  }

  void showErrorMessage(String title, String message) {
    NsAlertError(title, message);
  }
}

class SigninProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = "https://training.dev.ns.co.th";
  }

  Future<Response<dynamic>> signin(dynamic body) {
    return post('/auth/signin', body, decoder: ApiResponse.fromJson);
  }
}
