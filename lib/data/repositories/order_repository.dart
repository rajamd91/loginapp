import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loginapp/src/repository/authentication_repository/authentication_repository.dart';

import '../../features/shop/models/order_model.dart';

class OrderRepository extends GetxController {
  static OrderRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// ---------------- FUNCTIONS------------------///

  /// Get all orders related to current user
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userId = AuthenticationRepository.instance.authUser.uid;

      if (userId.isEmpty) {
        throw 'Unable to find User information.Try again in few minutes.';
      }

      final result =
          await _db.collection('Users').doc(userId).collection('Orders').get();
      return result.docs
          .map((documentSnapshot) => OrderModel.fromSnapshot(documentSnapshot))
          .toList();
    } catch (e) {
      throw 'Something went wrong while fetching order information.Try Again later.';
    }
  }

  /// Store new user order
  Future<void> saveOrder(OrderModel order, String userId) async {
    try {
      await _db
          .collection('Users')
          .doc(userId)
          .collection('Orders')
          .add(order.toJson());
    } catch (e) {
      throw 'Something went wrong while saving order information.Try Again later';
    }
  }
}
