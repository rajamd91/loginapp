import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:loginapp/features/authentication/screens/mail_verification/SuccessScreen.dart';
import 'package:loginapp/features/personalization/controllers/address_controller.dart';
import 'package:loginapp/features/shop/controllers/products/cart_controller.dart';
import 'package:loginapp/features/shop/controllers/products/checkout_controller.dart';
import 'package:loginapp/navigation_menu.dart';
import 'package:loginapp/src/repository/authentication_repository/authentication_repository.dart';
import 'package:loginapp/utils/constants/enums.dart';
import 'package:loginapp/utils/helpers/loader.dart';
import 'package:loginapp/utils/popups/full_screen_loader.dart';

import '../../../../data/repositories/order_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../models/order_model.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  /// Variables
  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  /// Fetch User's order history
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch (e) {
      TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  /// Add methods for order processing
  void processOrder(double totalAmount) async {
    try {
      /// Start loader
      TFullScreenLoader.openLoadingDialog(
          'Processing Your Order', TImages.pencilAnimation);

      /// Get user authentication id
      final userId = AuthenticationRepository.instance.authUser.uid;
      if (userId.isEmpty) return;

      /// Add details
      final order = OrderModel(
        /// Generate a unique ID for the order
        id: UniqueKey().toString(),
        userId: userId,
        status: OrderStatus.pending,
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        address: addressController.selectedAddress.value,

        /// Set date as needed
        deliveryDate: DateTime.now(),
        items: cartController.cartItems.toList(),
      );

      /// Save the order to Firestore
      await orderRepository.saveOrder(order, userId);

      /// Update the cart status
      cartController.clearCart();

      /// Show success screen
      Get.off(() => SuccessScreen(
            image: TImages.orderCompletedAnimation,
            title: 'Payment Success!',
            subTitle: 'Your Item will be shipped soon.',
            onPressed: () => Get.offAll(() => const NavigationMenu()),
          ));
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
