import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginapp/data/repositories/user/user_repository.dart';
import 'package:loginapp/src/repository/authentication_repository/authentication_repository.dart';
import 'package:loginapp/utils/helpers/loader.dart';
import '../../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../models/user_model.dart';
import '../../screens/mail_verification/verify_email.dart';
import '../network_manager.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //TextField Controllers to get data from TextFields
  final hidePassword = true.obs; // Observable for hiding/showing password
  final email = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final phoneNumber = TextEditingController();

  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); //Form key for Form Validation
  //final userRepo = Get.put(UserRepository());

  ///-- SIGNUP
  void signup() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information...', TImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      // Form Validation
      if (!signupFormKey.currentState!.validate()) return;

      // Privacy policy Check

      // Register User in the Firebase Authentication & Save User data in the Firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // Save Authenticated user data in the Firebase Firestore
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          email: email.text.trim(),
          userName: userName.text.trim(),
          profilePicture: "");

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Show Success Message
      TLoaders.successSnackBar(
          title: "Congratulations",
          message: 'Your Account has been created!.Verify Email to continue.');

      // move to verify Email screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      // show some generic error to the user
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      // Remove loader
      TFullScreenLoader.stopLoading();
    }
  }

  // call this function from Design & it will do the logic
  void registerUser(String email, String password) {
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);
    // String? error = AuthenticationRepository.instance
    //     .createUserWithEmailAndPassword(email, password) as String?;
    // if (error != null) {
    //   Get.showSnackbar(GetSnackBar(
    //     message: error.toString(),
    //   ));
  }
}

//   // //Get phoneNo from user and pass it to Auth Repository for firebase Authentication
//   // Future<void> createUser(UserModel user) async {
//   //   await userRepo.createUser(user);
//   //   phoneAuthentication(user.phoneNo);
//   //   Get.to(() => const OTPScreen());
//   // }
//   //
//   // void phoneAuthentication(String phoneNo) {
//   //   AuthenticationRepository.instance.phoneAuthentication(phoneNo);
//   // }
// }
