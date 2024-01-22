import 'package:flutter/widgets.dart';
import 'package:get/get.dart';


class LoginController extends GetxController {
  final cEmail = TextEditingController();
  final cPassword = TextEditingController();

  @override
  void onClose() {
    cEmail.dispose();
    cPassword.dispose();
    super.onClose();
  }
}