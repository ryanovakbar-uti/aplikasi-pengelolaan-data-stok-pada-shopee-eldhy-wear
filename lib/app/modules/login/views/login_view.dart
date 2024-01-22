import 'package:bcdx_21312020/app/controllers/auth_controller.dart';
import 'package:bcdx_21312020/app/utils/my_textfield.dart';
import 'package:bcdx_21312020/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final cAuth = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
        centerTitle: true,
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
      ),

      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                'Eldhy Wear',
                style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber.shade900,
                ),
              ),
        
              SizedBox(height: 30.0),
        
              ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(45.0),
                ),
                child: Image.asset(
                  'lib/assets/Eldhy_Wear.jpeg',
                  height: 180.0,
                ),
              ),
          
              SizedBox(height: 50.0),
          
              MyTextField(
                myController: controller.cEmail,
                myReadOnly: false,
                myLabelText: 'Email',
                myObscureText: false,
              ),

              SizedBox(height: 10.0),
          
              MyTextField(
                myController: controller.cPassword,
                myReadOnly: false,
                myLabelText: 'Password',
                myObscureText: true,
              ),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Get.toNamed(Routes.RESET_PASSWORD),
                  child: Text(
                    'Reset Password',
                    style: TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10.0),
          
              ElevatedButton(
                onPressed: () => cAuth.login(
                  controller.cEmail.text,
                  controller.cPassword.text,
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.amber),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          
              SizedBox(height: 20.0),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Belum Punya Akun?'),
                  TextButton(
                    onPressed: () => Get.toNamed(Routes.SIGNUP),
                    child: Text(
                      'Daftar Disini',
                      style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}