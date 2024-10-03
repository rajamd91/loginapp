import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:loginapp/src/features/authentication/screens/profile/profile_screen.dart';

// import '../../../../../constants/colors.dart';
// import '../../../../../constants/image_strings.dart';
// import '../../../../../constants/text_strings.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/text_strings.dart';
import '../../profile/profile.dart';
// import '../../../../../utils/constants/colors.dart';
// import '../../../../../utils/constants/image_strings.dart';
// import '../../../../../utils/constants/text_strings.dart';

class DashboardAppbar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(
        Icons.menu,
        color: Colors.black,
      ),
      title: Text(
        tAppName,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: [
        Container(
          margin: const EdgeInsets.only(
            right: 20.0,
            top: 7.0,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0), color: tCardBgColor),
          child: IconButton(
              onPressed: () {
                Get.to(() => const ProfileScreen());
              },
              icon: Image(
                image: AssetImage(tUserProfileImage),
              )),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(55.0);
}
