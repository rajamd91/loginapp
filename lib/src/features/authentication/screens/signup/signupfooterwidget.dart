import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loginapp/src/constants/text_strings.dart';

import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../login/login_screen.dart';

class SignUpFooterWidget extends StatelessWidget {
  const SignUpFooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("OR"),
        SizedBox(
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
        SizedBox(
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
                      style: TextStyle(color: Colors.blue)),
                ]),
          ),
        ),
      ],
    );
  }
}
