import 'package:flutter/material.dart';
//import 'package:loginapp/src/utils/device_utility.dart';

//import '../../../src/constants/colors.dart';
// import '../../../src/utils/constants/colors.dart';
// import '../../../src/utils/helper_functions.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/device_utility.dart';
import '../../../utils/helpers/helper_functions.dart';

class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  /// If you want add the background color to tabs you have to wrap them in material widget.
  /// To do that we need [PreferredSized] and that's why created custom class.[PreferredSizeWidget]
  const TTabBar({super.key, required this.tabs});
  final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? TColors.black : TColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: TColors.primary,
        labelColor: dark ? TColors.white : TColors.primary,
        unselectedLabelColor: TColors.darkerGrey,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}