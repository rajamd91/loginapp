import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginapp/common/styles/spacing_style.dart';
import 'package:loginapp/common/widget_login_signup/form_divider.dart';
import 'package:loginapp/common/widget_login_signup/social_buttons.dart';
// import 'package:loginapp/src/constants/image_strings.dart';
// import 'package:loginapp/src/constants/sizes.dart';
// import 'package:loginapp/src/constants/text_strings.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
// import '../../../../utils/constants/image_strings.dart';
// import '../../../../utils/constants/sizes.dart';
// import '../../../../utils/constants/text_strings.dart';
import 'login_footer_widget.dart';
import 'widgets/login_form.dart';
import 'login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: TSpacingStyle.paddingWithAppBarHeight,
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Header
                const TLoginHeader(),

                /// Form
                const LoginForm(),

                /// Divider
                TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
                const SizedBox(height: TSizes.spaceBtwSections),

                /// Footer
                const TSocialButtons()
              ],
            ),
          ),
        ),
      ),
    );
  }
}