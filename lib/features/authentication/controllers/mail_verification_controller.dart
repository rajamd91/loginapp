import 'package:get/get.dart';
import 'package:loginapp/src/repository/authentication_repository/authentication_repository.dart';

class MailVerificationController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    sendVerificationEmail();
  }

  /// Send OR Resend Email Verification
  Future<void> sendVerificationEmail() async {
    try {} catch (e) {
      //Helper.errorSnackBar();
      //Helper.error
    }
    await AuthenticationRepository.instance.sendEmailVerification();
  }

  //// Set Timer to Check if Verification Completed then Redirect
  void setTimerForAutoRedirect() {}

  //// Manually Check if Verification Completed then Redirect
  void manuallyCheckEmailVerificationStatus() {}
}
