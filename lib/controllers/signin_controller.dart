import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ns_flutter/models/initial_app.dart';
import 'package:ns_flutter/models/staff.dart';
import 'package:ns_flutter/widgets/ns_snackbar.dart';

class SigninController extends GetxController {
  final SigninProvider signinProvider =Get.put(SigninProvider());
  Future<void> signin(String username, String password) async {
    if(username.isNotEmpty && password.isNotEmpty){
      var body = ModelStaff(username: username, password: md5.convert(utf8.encode(password)).toString()).signinBodyToJason();
      var res = await signinProvider.signin(body);
      if(res.statusCode == 200) {
        var staff = ModelStaff.fromJson(res.body?.data);
        await GetStorage().write("staff", staff.toJason());
        Get.toNamed("/");
      } else {
        var resMsg = res.body == null ? res.statusText:res.body.message;
        NsAlertError("Process failed", resMsg ?? "failed: $res"); 
      }
    }
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
