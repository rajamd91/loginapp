import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:loginapp/src/constants/colors.dart';
// import 'package:loginapp/src/constants/image_strings.dart';
// import 'package:loginapp/src/constants/sizes.dart';
// import 'package:loginapp/src/constants/text_strings.dart';
// import 'package:loginapp/src/features/authentication/screens/login/login_screen.dart';
// import 'package:loginapp/src/features/authentication/screens/signup/signup_screen.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../login/login_screen.dart';
import '../signup/signup_screen.dart';
// import '../../../../utils/constants/colors.dart';
// import '../../../../utils/constants/image_strings.dart';
// import '../../../../utils/constants/sizes.dart';
// import '../../../../utils/constants/text_strings.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context);
    var brightness = mediaquery.platformBrightness;
    var height = mediaquery.size.height;
    final isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkMode ? tSecondaryColor : tPrimaryColor,
      body: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: AssetImage(tWelcomeScreenImage),
              height: height * 0.45,
            ),
            Column(children: [
              Text(
                tWelcomeTitle,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Text(
                tWelcomeSubTitle,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Get.to(
                      () => const LoginScreen(),
                    ),
                    child: Text(tLogin.toUpperCase()),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Get.to(
                      () => const SignupScreen(),
                    ),
                    child: Text(tSignup.toUpperCase()),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
