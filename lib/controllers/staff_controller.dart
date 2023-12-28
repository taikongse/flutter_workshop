import 'package:get/get.dart';
import 'package:ss_frontend_starter/core/authentication_manager.dart';
import 'package:ss_frontend_starter/core/cache_manager.dart';
import 'package:ss_frontend_starter/models/staff.dart';

class StaffController extends GetxController with CacheManager {
  final staff = Staff(
    ID: "",
    code: "",
    firstName: "",
    lastName: "",
  ).obs;

  bool fetchLogin(String u, String p) {
    final AuthenticationManager am = Get.put(AuthenticationManager());
    // fetch api signin
    // then set staff detail
    // then set token
    am.login("Token");
    return true;
  }
}
