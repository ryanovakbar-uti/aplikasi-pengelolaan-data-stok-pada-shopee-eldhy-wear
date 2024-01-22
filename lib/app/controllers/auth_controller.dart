import 'package:bcdx_21312020/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';


class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  void signup(String email, String password) async {
    try {
      UserCredential myUser = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      await myUser.user!.sendEmailVerification();
      
      Get.defaultDialog(
        title: 'Verifikasi Email',
        middleText: 'Kami telah mengirimkan verifikasi ke email $email',
        onConfirm: () {
          Get.back();
          Get.back();
        },
        textConfirm: 'Ok',
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void login(String email, String password) async {
    try {
      UserCredential myUser = await auth.signInWithEmailAndPassword(
        email: email,
        password: password
      );

      if (myUser.user!.emailVerified) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.defaultDialog(
          title: 'Verifikasi Email',
          middleText: 'Harap verifikasi email terlebih dahulu',
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.defaultDialog(
          title: 'Terjadi kesalahan',
          middleText: 'No user found for that email.',
        );
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Get.defaultDialog(
          title: 'Terjadi kesalahan',
          middleText: 'Wrong password provided for that user.',
        );
        print('Wrong password provided for that user.');
      }
    }
  }

  void logout() async {
    await auth.signOut();

    Get.offAllNamed(Routes.LOGIN);
  }

  void resetPassword(String email) async {
    if (email != '' && GetUtils.isEmail(email)) {
      try {
        await auth.sendPasswordResetEmail(email: email);
        
        Get.defaultDialog(
          title: 'Berhasil',
          middleText: 'Kami telah mengirimkan reset password ke $email',
          onConfirm: () {
            Get.back();
            Get.back();
          },
          textConfirm: 'OK',
        );
      } catch (e) {
        Get.defaultDialog(
          title: 'Terjadi kesalahan',
          middleText: 'Tidak dapat melakukan reset password.'
        );
      }
    } else {
      Get.defaultDialog(
        title: 'Terjadi kesalahan', middleText: 'Email tidak valid'
      );
    }
  }
}