import 'package:flutter/widgets.dart';
import 'package:get/get.dart';


class RegisterController extends GetxController {
  final cEmail = TextEditingController();
  final cPassword = TextEditingController();

  @override
  void onClose() {
    cEmail.dispose();
    cPassword.dispose();
    super.onClose();
  }
}