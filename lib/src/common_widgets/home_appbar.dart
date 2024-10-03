import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:loginapp/src/features/authentication/controllers/user_controller.dart';

import '../../features/authentication/controllers/user_controller.dart';

class THomeAppbar extends StatelessWidget {
  const THomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Text(""),
            // Text(
            //   controller.user.value.fullName,
            // ),
          ],
        ),
        actions: const [],
      ),
    );
  }
}
