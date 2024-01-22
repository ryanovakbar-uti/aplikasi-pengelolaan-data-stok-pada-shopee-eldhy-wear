import 'package:bcdx_21312020/app/controllers/auth_controller.dart';
import 'package:bcdx_21312020/app/routes/app_pages.dart';
import 'package:bcdx_21312020/app/utils/my_textfield.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  final cEmail = TextEditingController();
  final cPass = TextEditingController();
  final cAuth = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
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
                myController: cEmail,
                myReadOnly: false,
                myLabelText: 'Email',
                myObscureText: false,
              ),
      
              SizedBox(
                height: 30,
              ),
      
              ElevatedButton(
                onPressed: () => cAuth.resetPassword(cEmail.text),
                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.amber)),
                child: Text(
                  'Reset Password',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
      
              SizedBox(
                height: 10,
              ),
      
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Sudah Punya Akun ?"),
                  TextButton(
                    onPressed: () => Get.toNamed(Routes.LOGIN),
                    child: Text(
                      'Klik Disini',
                      style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}