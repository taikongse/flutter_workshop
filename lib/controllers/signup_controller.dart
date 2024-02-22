import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ns_flutter/models/initial_app.dart';
import 'package:ns_flutter/models/staff.dart';
import 'package:ns_flutter/widgets/ns_snackbar.dart';

class SignupController extends GetxController {
  final SignupProvider signupProvider = Get.put(SignupProvider());

  Future<void> signup(String username, String password, String firstName, String lastName, String birthDate, String idCard, String email) async {
    if (_isValidInputs(username, password, firstName, lastName, birthDate, idCard, email)) {
      var encryptedPassword = _encryptPassword(password);
      var body = ModelStaff(
        username: username,
        password: encryptedPassword,
        firstName: firstName,
        lastName: lastName,
        birthDate: birthDate,
        idCard: idCard,
        email: email,
      ).signupToJson();

      var response = await signupProvider.signup(body);
      if (response.statusCode == 200) {
        var staff = ModelStaff.fromJson(response.body?.data);
        await _saveStaffData(staff);
        Get.toNamed("/");
      } else {
        var errorMessage = _extractErrorMessage(response);
        NsAlertError("Process failed", errorMessage);
      }
    }
  }

  bool _isValidInputs(String username, String password, String firstName, String lastName, String birthDate, String idCard, String email) {
    return username.isNotEmpty && password.isNotEmpty && firstName.isNotEmpty && lastName.isNotEmpty && birthDate.isNotEmpty && idCard.isNotEmpty && email.isNotEmpty;
  }

  String _encryptPassword(String password) {
    return md5.convert(utf8.encode(password)).toString();
  }

  Future<void> _saveStaffData(ModelStaff staff) async {
    await GetStorage().write("staff", staff);
  }

  String _extractErrorMessage(Response<dynamic> response) {
    return response.body == null ? response.statusText : response.body.message ?? "Failed: $response";
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