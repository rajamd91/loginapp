import 'package:get/get.dart';
import 'package:loginapp/features/personalization/controllers/address_controller.dart';
import 'package:loginapp/features/shop/controllers/products/checkout_controller.dart';
import 'package:loginapp/features/shop/controllers/products/variation_controller.dart';
import '../features/authentication/controllers/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(AddressController());
    Get.put(VariationController());
    Get.put(CheckoutController());
  }
}
