// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:loginapp/features/authentication/screens/login/login_screen.dart';
// import 'package:loginapp/features/authentication/screens/on_boarding/on_boarding_screen.dart';
//
// class AuthenticationRepository extends GetxController {
//   static AuthenticationRepository get instance => Get.find();
//
//   /// Variables
//   final deviceStorage = GetStorage();
//   final _auth = FirebaseAuth.instance;
//
//   /// Called from main dart on App launch
//   @override
//   void onReady() {
//     FlutterNativeSplash.remove();
//     screenRedirect();
//   }
//
//   /// Function to show relevant screen
//   screenRedirect() async {
//     /// Local storage
//     deviceStorage.writeIfNull('IsFirstTime', true);
//     deviceStorage.read("IsFirstTime") != true
//         ? Get.offAll(() => const LoginScreen())
//         : Get.offAll(() => const OnBoardingScreen());
//   }
//
//   /*------------------- Email & password sign in ---------------------*/
//   /// [EmailAuthentication]-Sign in
//   /// [EmailAuthentication]-Register
//   Future<UserCredential> registerWithEmailAndPassword(
//       String email, String password) async {
//     try {
//       return await _auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//     } on FirebaseAuthException catch (e) {
//       throw TFirebaseAuthException(e.code).message;
//     } catch (e) {}
//   }
//
//   /// [ReAuthenticate]-ReAuthenticate User
//   /// [Email verification]-Mail Verification
//   /// [EmailAuthentication]-Forget Password
//   ///
//   ///
//   ///
// }
