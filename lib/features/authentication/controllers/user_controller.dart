import 'package:get/get.dart';
import '../../../data/repositories/user/user_repository.dart';
import '../models/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  /// Fetch User Record
  Future<void> fetchUserRecord() async {
    try {
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    }
  }

  /// Save User Record from any Registration Provider
//   Future<void> saveUserRecord(UserCredential? userCredentials) async {
//     try {
//       if (userCredentials != null) {
//         /// Map Data
//         final user=UserModel(id: userCredentials.user!.uid, email: userCredentials.user!.email?? '', password: userCredentials.user!.password?? '', fullName: fullName, phoneNo: phoneNo)
//
//       }
//     } catch (e) {}
//   }
}
