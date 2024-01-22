import 'package:bcdx_21312020/app/controllers/auth_controller.dart';
import 'package:bcdx_21312020/app/routes/app_pages.dart';
import 'package:bcdx_21312020/app/utils/loading.dart';
import 'package:bcdx_21312020/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CAuth = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: CAuth.streamAuthStatus,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          return GetMaterialApp(
            title: 'Application',
            initialRoute: (snapshot.data != null && snapshot.data!.emailVerified) ? Routes.HOME : Routes.LOGIN,
            getPages: AppPages.routes,
          );
        }
        
        return Loading();
      }
    );
  }
}