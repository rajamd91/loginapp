import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginapp/features/authentication/controllers/login/login_controller.dart';
import 'package:loginapp/features/authentication/controllers/signup/signup_controller.dart';
// import 'package:loginapp/src/constants/text_strings.dart';
//
// import '../../../../constants/image_strings.dart';
// import '../../../../constants/sizes.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
// import '../../../../utils/constants/image_strings.dart';
// import '../../../../utils/constants/sizes.dart';
// import '../../../../utils/constants/text_strings.dart';
import '../login/login_screen.dart';

class SignUpFooterWidget extends StatelessWidget {
  const SignUpFooterWidget({super.key});

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
            onPressed: () {},
            label: Text(tSignInWithGoogle),
          ),
        ),
        const SizedBox(
          height: tFormHeight - 20.0,
        ),
        TextButton(
          onPressed: () => Get.to(
            () => const LoginScreen(),
          ),
          child: Text.rich(
            TextSpan(
                text: tAlreadyHaveAnAccount,
                style: Theme.of(context).textTheme.bodyLarge,
                children: [
                  TextSpan(
                      text: tLogin.toUpperCase(),
                      style: const TextStyle(color: Colors.blue)),
                ]),
          ),
        ),
      ],
    );
  }
}
