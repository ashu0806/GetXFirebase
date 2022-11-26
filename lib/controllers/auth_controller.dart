import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/views/home_view.dart';
import 'package:getx_practice/views/sign_in_view.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  final auth = FirebaseAuth.instance;

  late Rx<User?> user;

  @override
  void onReady() {
    super.onReady();
    user = Rx<User?>(auth.currentUser);
    user.bindStream(
      auth.userChanges(),
    );
    ever(
      user,
      initialPage,
    );
  }

  initialPage(User? user) {
    if (user == null) {
      Future.delayed(
        const Duration(seconds: 1),
        () {
          Get.offAll(
            () => const SignInView(),
          );
        },
      );
    } else {
      Future.delayed(
        const Duration(seconds: 1),
        () {
          Get.offAll(
            () => HomeView(
              email: user.email!,
            ),
          );
        },
      );
    }
  }

  void register(
    String email,
    String password,
  ) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      Get.snackbar(
        "About User",
        "User message",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        duration: const Duration(seconds: 1),
        dismissDirection: DismissDirection.horizontal,
        animationDuration: const Duration(seconds: 1),
        titleText: const Text(
          "Account Creation Failed",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        messageText: Text(
          e.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
          ),
        ),
      );
    }
  }

  void signIn(
    String email,
    String password,
  ) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "About SignIn",
        "SignIn message",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        duration: const Duration(seconds: 1),
        dismissDirection: DismissDirection.horizontal,
        animationDuration: const Duration(seconds: 1),
        titleText: const Text(
          "SignIn Failed",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        messageText: Text(
          e.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
          ),
        ),
      );
    }
  }

  void logOut() async {
    await auth.signOut();
  }
}
