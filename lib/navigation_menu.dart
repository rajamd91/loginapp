import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
// import 'package:loginapp/src/features/authentication/screens/settings/settings.dart';
// import 'package:loginapp/src/features/shop/screens/home/home.dart';
// import 'package:loginapp/src/features/shop/screens/store/store.dart';
// import 'package:loginapp/src/features/shop/screens/wishlist/wishlist.dart';
//import 'package:loginapp/src/utils/helper_functions.dart';
import 'package:loginapp/utils/helpers/helper_functions.dart';

//import 'features/authentication/screens/settings/settings.dart';
import 'features/personalization/screens/settings/settings.dart';
import 'features/shop/screens/home/home.dart';
import 'features/shop/screens/store/store.dart';
import 'features/shop/screens/wishlist/wishlist.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            backgroundColor: darkMode ? Colors.black : Colors.white,
            indicatorColor: darkMode
                ? Colors.white.withOpacity(0.1)
                : Colors.black.withOpacity(0.1),
            destinations: const [
              NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
              NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
              NavigationDestination(
                  icon: Icon(Iconsax.heart), label: 'Wishlist'),
              NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile')
            ]),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const HomeScreen(),
    const StoreScreen(),
    const FavouriteScreen(),
    const SettingsScreen(),
  ];
}