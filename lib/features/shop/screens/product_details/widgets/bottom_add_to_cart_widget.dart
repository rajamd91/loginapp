import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:loginapp/common/widgets/icons/t_circular_icon.dart';
import 'package:loginapp/features/shop/controllers/products/cart_controller.dart';
import 'package:loginapp/features/shop/models/product_model.dart';
import 'package:loginapp/utils/constants/colors.dart';
import 'package:loginapp/utils/constants/sizes.dart';
import 'package:loginapp/utils/helpers/helper_functions.dart';

class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    controller.updateAlreadyAddedProductCount(product);
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace / 2),
      decoration: BoxDecoration(
          color: dark ? TColors.darkerGrey : TColors.light,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(TSizes.cardRadiusLg),
              topRight: Radius.circular(TSizes.cardRadiusLg))),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                TCircularIcon(
                  icon: Iconsax.minus,
                  width: 40,
                  height: 40,
                  backGroundColor: TColors.darkGrey,
                  color: TColors.white,
                  onPressed: () => controller.productQuantityInCart.value < 1
                      ? null
                      : controller.productQuantityInCart.value -= 1,
                ),
                const SizedBox(width: TSizes.spaceBtwItems),
                Text(controller.productQuantityInCart.value.toString(),
                    style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(width: TSizes.spaceBtwItems),
                TCircularIcon(
                  icon: Iconsax.add,
                  width: 40,
                  height: 40,
                  backGroundColor: TColors.black,
                  color: TColors.white,
                  onPressed: () => controller.productQuantityInCart.value += 1,
                ),
              ],
            ),
            ElevatedButton(
              onPressed: controller.productQuantityInCart.value < 1
                  ? null
                  : () => controller.addToCart(product),
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(TSizes.md),
                  backgroundColor: TColors.black,
                  side: const BorderSide(color: TColors.black)),
              child: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
