import 'package:flutter/material.dart';
import 'package:loginapp/src/common_widgets/form/form_header_widget.dart';
import 'package:loginapp/src/constants/image_strings.dart';
import 'package:loginapp/src/constants/text_strings.dart';
import 'package:loginapp/src/features/authentication/screens/signup/signupfooterwidget.dart';
import 'package:loginapp/src/features/authentication/screens/signup/signup_form_widget.dart';

import '../../../../constants/sizes.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*.... Section-1 [Header]....*/

                FormHeaderWidget(
                    image: tWelcomeScreenImage,
                    title: tSignUpTitle,
                    subTitle: tSignUpSubTitle),

                /*.... Section-1 End....*/
                //
                /*.... Section-2 [Form]....*/

                const SignUpFormWidget(),

                /*.... Section-2 End....*/
                //
                /*.... Section-3 [Footer]....*/

                const SignUpFooterWidget()

                /*.... Section-3 End....*/
                //
              ],
            ),
          ),
        ),
      ),
    );
  }
}
