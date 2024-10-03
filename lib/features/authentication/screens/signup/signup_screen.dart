import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:loginapp/common/widget_login_signup/form_divider.dart';
import 'package:loginapp/common/widget_login_signup/social_buttons.dart';
import 'package:loginapp/features/authentication/screens/signup/signup_form_widget.dart';
import 'package:loginapp/features/authentication/screens/signup/signupfooterwidget.dart';
import 'package:loginapp/src/common_widgets/form/form_header_widget.dart';
// import 'package:loginapp/src/constants/image_strings.dart';
// import 'package:loginapp/src/constants/text_strings.dart';
// import 'package:loginapp/src/features/authentication/screens/signup/signupfooterwidget.dart';
// import 'package:loginapp/src/features/authentication/screens/signup/signup_form_widget.dart';

//import '../../../../constants/sizes.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
// import '../../../../utils/constants/image_strings.dart';
// import '../../../../utils/constants/sizes.dart';
// import '../../../../utils/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*.... Section-1 [Header]....*/

                // FormHeaderWidget(
                //     image: tWelcomeScreenImage,
                //     title: tSignUpTitle,
                //     subTitle: tSignUpSubTitle),

                /*.... Section-2 [Form]....*/

                /// Title
                Text(
                  TTexts.signUpTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: TSizes.spaceBtwSections),

                const TSignupForm(),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                /// Divider
                TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
                const SizedBox(height: TSizes.spaceBtwItems),

                /// Social Buttons
                const TSocialButtons(),

                /*.... Section-3 [Footer]....*/

                // const SignUpFooterWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
