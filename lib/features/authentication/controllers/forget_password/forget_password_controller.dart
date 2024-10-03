import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:loginapp/src/repository/authentication_repository/authentication_repository.dart';
import 'package:loginapp/utils/helpers/loader.dart';
//import 'package:loginapp/src/utils/popups/full_screen_loader.dart';

//import '../../screens/forgot_password_configuration/reset_password.dart';
import '../../../../../utils/popups/full_screen_loader.dart';
import '../../screens/password_configuration/reset_password.dart';
import '../network_manager.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// Send Reset Password Email
  sendResetPasswordEmail() async {
    try {
      /// Start Loading
      TFullScreenLoader.openLoadingDialog(
          'Processing your request...', "TImages.docerAnimation");

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove loader
        TFullScreenLoader.stopLoading();

        return;
      }

      // Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        // Remove loader
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Send Email to Reset password
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      // Remove loader
      TFullScreenLoader.stopLoading();

      // Show Success Message
      TLoaders.successSnackBar(
          title: "Email sent",
          message:
              'Email link sent to Reset Your Password.Verify Email to continue.'
                  .tr);

      /// Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      /// Remove Loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      /// Start Loading
      TFullScreenLoader.openLoadingDialog(
          'Processing your request...', "TImages.docerAnimation");

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove loader
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Send Email to Reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Remove loader
      TFullScreenLoader.stopLoading();

      // Show Success Screen
      TLoaders.successSnackBar(
          title: "Email sent",
          message: 'Email link sent to Reset Your Password'.tr);
    } catch (e) {
      /// Remove Loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
