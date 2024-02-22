import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ns_flutter/models/initial_app.dart';
import 'package:ns_flutter/models/staff.dart';
import 'package:ns_flutter/widgets/ns_snackbar.dart';

class SignupController extends GetxController {
  final SignupProvider signupProvider =Get.put(SignupProvider());
  Future<void> signup(String username, String password, String firstName, String lastName, String birthDate, String idCard, String email) async {
    if(username.isNotEmpty && password.isNotEmpty && firstName.isNotEmpty && lastName.isNotEmpty && birthDate.isNotEmpty && idCard.isNotEmpty && email.isNotEmpty) {
      var body = ModelStaff(
        username: username,
        password: md5.convert(utf8.encode(password)).toString(),
        firstName:firstName,
        lastName: lastName,
        birthDate:birthDate,
        idCard:idCard,
        email:email
      ).signupToJason();
      print('body: ${body}');
      var res = await signupProvider.signup(body);
      if(res.statusCode == 200) {
        var staff = ModelStaff.fromJson(res.body?.data);
        await GetStorage().write("staff", staff);
        Get.toNamed("/");
      } else {
        print("respose: ${res.body}");
        var resMsg = res.body == null ? res.statusText:res.body.message;
        NsAlertError("Process failed", resMsg ?? "failed: $res"); 
      }
    }
  }
}

class SignupProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = "https://training.dev.ns.co.th";
  }

  Future<Response<dynamic>> signup(dynamic body) {
    return post('/auth/signup', body, decoder: ApiResponse.fromJson);
  }
}