import 'package:flutter/material.dart';
import 'package:loginapp/common/widgets/appbar/appbar.dart';
import 'package:loginapp/common/widgets/loaders/animation_loader.dart';
import 'package:loginapp/features/shop/controllers/products/cart_controller.dart';
import 'package:loginapp/features/shop/screens/checkout/checkout.dart';
import 'package:loginapp/navigation_menu.dart';
import 'package:loginapp/utils/constants/sizes.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../shop/screens/cart/widgets/cart_items.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      appBar: TAppBar(
          showBackArrow: true,
          title:
              Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
      body: Obx(
        () {
          /// Nothing found widget
          final emptyWidget = TAnimationLoaderWidget(
            text: 'Whoops! Cart is Empty.',
            animation: TImages.cartAnimation,
            showAction: true,
            actionText: 'Let\'s fill it',
            onActionPressed: () => Get.off(() => const NavigationMenu()),
          );
          if (controller.cartItems.isEmpty) {
            return emptyWidget;
          } else {
            return const SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(TSizes.defaultSpace),

                /// Items In Cart
                child: TCartItems(),
              ),
            );
          }
        },
      ),

      /// Checkout Button
      bottomNavigationBar: controller.cartItems.isEmpty
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: ElevatedButton(
                onPressed: () => Get.to(() => const CheckoutScreen()),
                child: Obx(() =>
                    Text('Checkout \$${controller.totalCartPrice.value}')),
              ),
            ),
    );
  }
}
