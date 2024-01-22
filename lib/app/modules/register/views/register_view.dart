import 'package:bcdx_21312020/app/controllers/auth_controller.dart';
import 'package:bcdx_21312020/app/utils/my_textfield.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  final cAuth = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Screen'),
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
          
              SizedBox(height: 30.0),
          
              ElevatedButton(
                onPressed: () => cAuth.signup(
                  controller.cEmail.text,
                  controller.cPassword.text,
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.amber),
                ),
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}