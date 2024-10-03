import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:loginapp/common/widgets/appbar/appbar.dart';
import 'package:loginapp/common/widgets/icons/t_circular_icon.dart';
import 'package:loginapp/common/widgets/layouts/grid_layout.dart';
import 'package:loginapp/common/widgets/loaders/animation_loader.dart';
import 'package:loginapp/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:loginapp/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:loginapp/features/shop/controllers/products/favourites_controller.dart';
import 'package:loginapp/navigation_menu.dart';
import 'package:loginapp/utils/helpers/cloud_helper_functions.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/image_strings.dart';
import '../home/home.dart';

//import '../../../../constants/sizes.dart';
//import '../../../../utils/constants/sizes.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouritesController.instance;
    return Scaffold(
      appBar: TAppBar(
        title:
            Text("Wishlist", style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          TCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(const HomeScreen()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),

          /// Products Grid
          child: Obx(
            () => FutureBuilder(
              future: controller.favouriteProducts(),
              builder: (context, snapshot) {
                /// Nothing Found Widget
                final emptyWidget = TAnimationLoaderWidget(
                  text: 'Oops!,Wishlist is empty.',
                  animation: TImages.pencilAnimation,
                  showAction: true,
                  actionText: 'Let\'s add some',
                  onActionPressed: () => Get.off(() => const NavigationMenu()),
                );
                const loader = TVerticalProductShimmer(itemCount: 6);
                final widget = TCloudHelperFunctions.checkMultipleRecordState(
                    snapshot: snapshot,
                    loader: loader,
                    nothingFound: emptyWidget);
                if (widget != null) return widget;

                final products = snapshot.data!;
                return TGridLayout(
                    itemCount: products.length,
                    itemBuilder: (_, index) =>
                        TProductCardVertical(product: products[index]));
              },
            ),
          ),
        ),
      ),
    );
  }
}
