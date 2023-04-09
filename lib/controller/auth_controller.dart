import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pbl5_app/pages/nav_pages/navpages.dart';
import 'package:pbl5_app/pages/signup_pages/login_screen.dart';
import 'package:pbl5_app/pages/signup_pages/success_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  // sign up text editing controllers

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmTextController = TextEditingController();

  // login text editing controllers
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();

  // reset email
  final TextEditingController resetEmailController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final RxBool hide = true.obs;
  final RxBool hideConfirm = true.obs;
  final RxBool isLoading = false.obs;

  Future<void> createAccount() async {
    isLoading.value = true;

    try {
      final user = await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      final firestore = FirebaseFirestore.instance;
      firestore.collection('users').doc(user.user!.uid).set({
        "name": nameController.text,
        "email": emailController.text,
        "password": passwordController.text,
      });
      // addUserDetails(
      //   nameController.text,
      //   emailController.text,
      //   user
      // );

      isLoading.value = false;

      if (confirmTextController.text != passwordController.text) {
        print("Confirm password doesn't match password");
      } else {
        // loading
        if (user.isBlank != true) {
          Get.to(() => const LoginScreen());
        } else {
          print('error');
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('The email address is already in use.');
      } else if (e.code == 'invalid-email') {
        print("Email không hợp lệ");
      }
    } catch (e) {
      print('An unexpected error occurred: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addUserDetails(
      String name, String email, UserCredential user) async {
    final firestore = FirebaseFirestore.instance;
    firestore
        .collection('users')
        .doc(user.user!.uid)
        .set({"email": email, "name": name});
  }

  // change state visibility
  void togglePasswordVisibility() {
    hide.value = !hide.value;
  }

  void toggleConfirmVisibility() {
    hideConfirm.value = !hideConfirm.value;
  }

  Future<void> loginUser() async {
    try {
      isLoading.value = true;
      final user = await _auth.signInWithEmailAndPassword(
          email: loginEmailController.text,
          password: loginPasswordController.text);
      print('loading');
      if (user.isBlank != true) {
        // lets save user with shared prefrences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("userID", user.user!.uid);
        print(user.user!.uid);
        Get.to(() => const MainPageNav());
      } else {
        print('error');
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      if (e is FirebaseAuthException) {
        if (e.code == '[firebase_auth/invalid-email]') {
          // Handle invalid email error here
          print('Invalid email address provided');
        } else if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        } else {
          // Handle other FirebaseAuthException errors here
          print('Error: ${e.message}');
        }
      } else {
        // Handle other exceptions here
        print('Error: $e');
      }
    }
  }

  // Let's make a function for logout

  Future<void> logoutUser() async {
    await _auth.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Get.offAll(() => const LoginScreen());
  }

  Future<void> resetPassword(context) async {
    try {
      await _auth
          .sendPasswordResetEmail(email: resetEmailController.text.trim())
          .then((value) =>
              {print("Email sent"), Get.to(() => const SuccessPage())});
    } on FirebaseException catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
              actions: [
                TextButton(onPressed: () {}, child: const Text('Close'))
              ],
            );
          });
    }
  }
}
