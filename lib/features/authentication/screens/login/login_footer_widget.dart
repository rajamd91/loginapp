import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginapp/features/authentication/controllers/login/login_controller.dart';
//import 'package:loginapp/src/features/authentication/screens/signup/signup_screen.dart';

// import '../../../../constants/image_strings.dart';
// import '../../../../constants/sizes.dart';
// import '../../../../constants/text_strings.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../signup/signup_screen.dart';
// import '../../../../utils/constants/image_strings.dart';
// import '../../../../utils/constants/sizes.dart';
// import '../../../../utils/constants/text_strings.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
        const SizedBox(
          height: tFormHeight - 20.0,
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: Image(
              image: AssetImage(
                tGoogleLogoImage,
              ),
              width: 20.0,
              //height: 0.1,
            ),
            onPressed: () => controller.googleSignIn(),
            label: Text(tSignInWithGoogle),
          ),
        ),
        const SizedBox(
          height: tFormHeight - 20.0,
        ),
        TextButton(
          onPressed: () => Get.to(
            () => const SignupScreen(),
          ),
          child: Text.rich(
            TextSpan(
                text: tDontHaveAnAccount,
                style: Theme.of(context).textTheme.bodyLarge,
                children: const [
                  TextSpan(text: tSignup, style: TextStyle(color: Colors.blue)),
                ]),
          ),
        ),
      ],
    );
  }
}
