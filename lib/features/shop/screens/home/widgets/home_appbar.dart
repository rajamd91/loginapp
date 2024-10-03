import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginapp/features/personalization/controllers/user_controller.dart';
import 'package:loginapp/common/widgets/shimmers/shimmer.dart';
import '../../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
// import '../../../../../constants/colors.dart';
// import '../../../../../constants/text_strings.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/text_strings.dart';
// import '../../../../../utils/constants/colors.dart';
// import '../../../../../utils/constants/text_strings.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return TAppBar(
      backgroundColor: TColors.primary,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: TColors.grey),
          ),
          Obx(
            () {
              if (controller.profileLoading.value) {
                return const TShimmerEffect(width: 80, height: 50);
              } else {
                return Text(
                  controller.user.value.fullName,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .apply(color: TColors.white),
                );
              }
            },
          ),
        ],
      ),
      actions: const [
        TCartCounterIcon(
          //onPressed: () {},
          iconColor: TColors.white,
        ),
      ],
    );
  }
}
