import 'package:get/get.dart';
//import 'package:loginapp/src/features/authentication/models/user_model.dart';
import 'package:loginapp/src/repository/authentication_repository/authentication_repository.dart';

import '../../../data/repositories/user/user_repository.dart';
import '../models/user_model.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  /// Controllers
  // final email = TextEditingController();
  // final password = TextEditingController();
  // final fullName = TextEditingController();
  // final phoneNo = TextEditingController();

  ///Repositories
  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  /// Step 3 - Get Use Email and pass to UserRepository to fetch user record.
  getUserData() {
    final email = _authRepo.fireBaseUser.value?.email;
    if (email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar("Error", "Login to continue");
    }
  }

  /// Fetch List of user records
  Future<List<UserModel>> getAllUser() async => await _userRepo.allUser();

  updateRecord(UserModel user) async {
    await _userRepo.updateUserRecord(user);
  }
}
