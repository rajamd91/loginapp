import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginapp/src/common_widgets/form/form_header_widget.dart';
// import 'package:loginapp/src/constants/image_strings.dart';
// import 'package:loginapp/src/constants/sizes.dart';
// import 'package:loginapp/src/constants/text_strings.dart';

import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/text_strings.dart';
// import '../../../../../utils/constants/image_strings.dart';
// import '../../../../../utils/constants/sizes.dart';
// import '../../../../../utils/constants/text_strings.dart';
import '../forgot_password_otp/otp_screen.dart';

class ForgetPasswordMailScreen extends StatelessWidget {
  const ForgetPasswordMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [
              const SizedBox(
                height: tDefaultSize * 4,
              ),
              FormHeaderWidget(
                image: tForgotPasswordImage,
                title: tForgetPasswordTitle,
                subTitle: tForgetPasswordSubTitle,
                crossAxisAlignment: CrossAxisAlignment.center,
                heightBetween: 30.0,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: tFormHeight,
              ),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text(tEmail),
                      hintText: tEmail,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => const OTPScreen());
                      },
                      child: Text(tNext),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      )),
    );
  }
}
