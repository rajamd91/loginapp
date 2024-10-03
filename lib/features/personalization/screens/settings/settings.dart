import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:loginapp/common/widgets/appbar/appbar.dart';
import 'package:loginapp/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:loginapp/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:loginapp/common/widgets/texts/section_heading.dart';
import 'package:loginapp/features/authentication/controllers/login/login_controller.dart';
import 'package:loginapp/features/personalization/screens/address/address.dart';

import '../../../../../common/widgets/list_tiles/user_profile_tile.dart';
// import '../../../../constants/colors.dart';
// import '../../../../constants/sizes.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
// import '../../../../utils/constants/colors.dart';
// import '../../../../utils/constants/sizes.dart';
import '../../../authentication/screens/profile/profile.dart';
import '../../../shop/screens/order/order.dart';
//import '../profile/profile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  TAppBar(
                    title: Text(
                      "Account",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: TColors.white),
                    ),
                  ),

                  /// User Profile Card
                  TUserProfileTile(
                      onPressed: () => Get.to(() => const ProfileScreen())),

                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /// Account Settings
                  const TSectionHeading(
                      title: "Account Settings", showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TSettingsMenuTile(
                      icon: Iconsax.safe_home,
                      title: "My Addresses",
                      subTitle: "Set shopping delivery address",
                      onTap: () => Get.to(() => const UserAddressScreen())),
                  const TSettingsMenuTile(
                      icon: Iconsax.shopping_cart,
                      title: "My Cart",
                      subTitle: "Add remove products and save to checkout"),
                  TSettingsMenuTile(
                      icon: Iconsax.bag_tick,
                      title: "My Orders",
                      subTitle: "In progress and completed Orders",
                      onTap: () => Get.to(() => const OrderScreen())),
                  const TSettingsMenuTile(
                      icon: Iconsax.bank,
                      title: "Bank Account",
                      subTitle: "Withdraw balance to registered bank account"),
                  const TSettingsMenuTile(
                      icon: Iconsax.discount_shape,
                      title: "My Coupons",
                      subTitle: "List of all the discounted coupons"),
                  const TSettingsMenuTile(
                      icon: Iconsax.notification,
                      title: "Notifications",
                      subTitle: "Set any kind of notification message"),
                  const TSettingsMenuTile(
                      icon: Iconsax.security_card,
                      title: "Account Privacy",
                      subTitle: "Manage data usage and connected accounts"),

                  /// App Settings
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const TSectionHeading(
                      title: "App Settings", showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const TSettingsMenuTile(
                      icon: Iconsax.document_upload,
                      title: "Load Data",
                      subTitle: "Upload data to your Cloud Firebase"),
                  TSettingsMenuTile(
                      icon: Iconsax.location,
                      title: "GeoLocation",
                      subTitle: 'Set recommendation based on location',
                      trailing: Switch(
                        value: true,
                        onChanged: (value) {},
                      )),
                  TSettingsMenuTile(
                      icon: Iconsax.security_user,
                      title: "Safe Mode",
                      subTitle: 'Search result is safe for all ages',
                      trailing: Switch(
                        value: false,
                        onChanged: (value) {},
                      )),
                  TSettingsMenuTile(
                      icon: Iconsax.image,
                      title: "No Image Quality",
                      subTitle: 'Set image quality to be seen',
                      trailing: Switch(
                        value: false,
                        onChanged: (value) {},
                      )),

                  /// Logout Button
                  const SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () => Get.put(controller.signOut()),
                        child: const Text('Logout')),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections * 2.5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}