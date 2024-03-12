/*import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:loginapp/src/features/authentication/controllers/profile_controller.dart';
import 'package:loginapp/src/features/authentication/models/user_model.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(LineAwesomeIcons.angle_left)),
        title:
            Text(tProfile, style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),

          ///Future builder to store cloud data
          child: FutureBuilder(
            future: controller.getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  UserModel userData = snapshot.data as UserModel;
                  // //Controllers
                  // final email = TextEditingController(text: user.email);
                  // final password = TextEditingController(text: user.password);
                  // final fullName = TextEditingController(text: user.fullName);
                  // final phoneNo = TextEditingController(text: user.phoneNo);
                  return Column(children: [
                    /// IMAGE WITH ICON
                    Stack(
                      children: [
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image(image: AssetImage(tProfileImage))),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: tPrimaryColor,
                            ),
                            child: const Icon(LineAwesomeIcons.alternate_pencil,
                                size: 20.0, color: Colors.black),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 50.0),

                    /// Form Fields
                    Form(
                      child: Column(children: [
                        TextFormField(
                          initialValue: userData.fullName,
                          controller: fullName,
                          decoration: InputDecoration(
                              label: Text(tFullName),
                              prefixIcon:
                                  const Icon(Icons.person_outline_outlined)),
                        ),
                        const SizedBox(height: tFormHeight - 20),
                        TextFormField(
                          initialValue: userData.email,
                          controller: email,
                          decoration: InputDecoration(
                              label: Text(tEmail),
                              prefixIcon: const Icon(Icons.email_outlined)),
                        ),
                        const SizedBox(height: tFormHeight - 20),
                        TextFormField(
                          initialValue: userData.phoneNo,
                          controller: phoneNo,
                          decoration: InputDecoration(
                              label: Text(tPhoneNo),
                              prefixIcon: const Icon(Icons.phone_android)),
                        ),
                        const SizedBox(height: tFormHeight - 20),
                        TextFormField(
                          initialValue: userData.password,
                          controller: password,
                          decoration: InputDecoration(
                            label: Text(tPassword),
                            prefixIcon: const Icon(Icons.fingerprint),
                            labelStyle: const TextStyle(color: tSecondaryColor),
                            suffixIcon: const IconButton(
                              onPressed: null,
                              icon: Icon(Icons.remove_red_eye_sharp),
                            ),
                          ),
                        ),
                        const SizedBox(height: tFormHeight),

                        ///-- Form submit button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              final userData = UserModel(
                                email: email.text.trim(),
                                password: password.text.trim(),
                                fullName: fullName.text.trim(),
                                phoneNo: phoneNo.text.trim(),
                              );
                              await controller.updateRecord(user);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: tPrimaryColor,
                                side: BorderSide.none,
                                shape: const StadiumBorder()),
                            child: Text(tEditProfile,
                                style: const TextStyle(color: tDarkColor)),
                          ),
                        ),
                      ]),
                    ),
                  ]);
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  return const Center(child: Text("Somthing went wrong"));
                }
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}*/
