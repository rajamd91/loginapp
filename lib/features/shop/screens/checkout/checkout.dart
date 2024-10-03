import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginapp/common/widgets/appbar/appbar.dart';
import 'package:loginapp/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:loginapp/features/shop/controllers/products/cart_controller.dart';
//import 'package:loginapp/utils/lib/navigation_menu.dart';
import 'package:loginapp/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:loginapp/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:loginapp/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:loginapp/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:loginapp/utils/constants/colors.dart';
import 'package:loginapp/utils/constants/sizes.dart';
import 'package:loginapp/utils/helpers/loader.dart';
import 'package:loginapp/utils/helpers/pricing_calculator.dart';
import '../../../../common/widgets/products/cart/coupon_widget.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../controllers/products/order_controller.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    final orderController = Get.put(OrderController());
    final totalAmount = TPricingCalculator.calculateTotalPrice(subTotal, 'US');

    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title:
            Text('Order Review', style: Theme.of(context).textTheme.titleSmall),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            /// Items in cart
            const TCartItems(showAddRemoveButtons: false),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Coupon TextField
            const TCouponCode(),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Billing Section
            TRoundedContainer(
              showBorder: true,
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: dark ? TColors.black : TColors.white,
              child: const Column(
                children: [
                  /// Pricing
                  TBillingAmountSection(),
                  SizedBox(height: TSizes.spaceBtwItems),

                  /// Divider
                  Divider(),
                  SizedBox(height: TSizes.spaceBtwItems),

                  /// Payment Methods
                  TBillingPaymentSection(),
                  SizedBox(height: TSizes.spaceBtwItems),

                  /// address
                  TBillingAddressSection()
                ],
              ),
            )
          ],
        ),
      ),

      /// CheckOut Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => subTotal > 0
                ? orderController.processOrder(totalAmount)
                : () => TLoaders.warningSnackBar(
                    title: 'Empty Cart',
                    message: 'Add items in the cart in order to proceed.'),
            child: Text('Checkout \$$totalAmount')),
      ),
    );
  }
}
