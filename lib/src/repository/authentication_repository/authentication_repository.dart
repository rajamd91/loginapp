import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loginapp/data/repositories/user/user_repository.dart';
import 'package:loginapp/src/exceptions/signup_email_password_failure.dart';
import 'package:loginapp/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:loginapp/utils/local_storage/storage_utility.dart';
// import 'package:loginapp/src/features/authentication/screens/dashboard/dashboard.dart';
// import 'package:loginapp/src/features/authentication/screens/login/login_screen.dart';
// import 'package:loginapp/src/features/authentication/screens/mail_verification/verify_email.dart';
// import 'package:loginapp/src/features/authentication/screens/on_boarding/on_boarding_screen.dart';
// import 'package:loginapp/src/features/authentication/screens/welcome/welcome_screen.dart';

import '../../../features/authentication/screens/dashboard/dashboard.dart';
import '../../../features/authentication/screens/login/login_screen.dart';
import '../../../features/authentication/screens/mail_verification/verify_email.dart';
//import '../../../features/authentication/screens/on_boarding/on_boarding_screen.dart';
import '../../../features/authentication/screens/on_boarding/onboarding.dart';
import '../../../features/authentication/screens/welcome/welcome_screen.dart';
import '../../../navigation_menu.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Variables
  final deviceStorage = GetStorage();
  late final Rx<User?> fireBaseUser;
  final _auth = FirebaseAuth.instance;
  final _phoneVerificationId = ''.obs;
  late final GoogleSignInAccount_googleUser;

  /// Get Authenticated User Data
  User get authUser => _auth.currentUser!;

  /// Getters
  User? get firebaseUser => fireBaseUser.value;

  String get getUserID => firebaseUser?.uid ?? "";

  String get getUserEmail => firebaseUser?.email ?? "";

  // will be load when app launches this func will be called and set the firebaseUser state
  @override
  void onReady() {
    /// Remove the native splash screen
    // fireBaseUser = Rx<User?>(_auth.currentUser);
    // fireBaseUser.bindStream(_auth.userChanges());
    FlutterNativeSplash.remove();
    // ever(fireBaseUser, _setInitialScreen);

    /// Redirect to the appropriate screen
    screenRedirect();
  }

  /// Function to determine the relevant screen and redirect accordingly.
  void screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      /// If the user is logged in
      if (user.emailVerified) {
        /// Initialize user specific storage
        await TLocalStorage.init(user.uid);

        /// If the user email is verified,navigate to the main navigation menu.
        Get.offAll(() => const NavigationMenu());
      } else {
        /// If the user email is not verified,navigate to the VerifyEmailScreen.
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      // Local storage
      deviceStorage.writeIfNull('IsFirstTime', true);
      // Check if it is the first time launching the app
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnBoardingScreen());
    }
  }

  //// set initial screen onLOAD
  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const WelcomeScreen())
        : Get.offAll(() => const Dashboard());
  }

  Future<String?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      fireBaseUser.value != null
          ? Get.offAll(() => const Dashboard())
          : Get.to(() => const WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    } catch (_) {
      final ex = SignUpWithEmailAndPasswordFailure();
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }
    return null;
  }

/*------------------ Email & Password Sign-in--------------------*/

// /// [EmailAuthentication] - LOGIN
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException {
      throw "Something wrong";
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw 'Something went wrong.Please try Again';
    }
  }

// [EmailAuthentication] - REGISTER
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException catch (_) {
      throw "Something wrong in Format";
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw 'Something went wrong.Please try Again';
    }
  }

  /// [EmailVerification] - MAIL VERIFICATION
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException catch (_) {
      throw "Something wrong";
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw 'Something went wrong.Please try Again';
    }
  }

  /// [Email Authentication]-FORGET PASSWORD
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code);
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException {
      throw "Something wrong";
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw 'Something went wrong.Please try Again';
    }
  }

  /// [ReAuthenticate]-Re Authenticate USER
  Future<void> reAuthenticateWithEmailAndPassword(
      String email, String password) async {
    try {
      /// Create a Credential
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);

      /// ReAuthenticate
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code);
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException {
      throw "Something wrong";
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw 'Something went wrong.Please try Again';
    }
  }

  /*---------------- Federated Identity & Social Sign-in-------------*/

  /// [GoogleAuthentication]-GOOGLE
  Future<UserCredential?> signInWithGoogle() async {
    try {
      /// Trigger the Authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      /// Obtain the Auth Details from the request
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      /// Create a new credential
      final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      /// Once signed in, return the UserCredential
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException catch (_) {
      throw "Something wrong";
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      if (kDebugMode) print('Something went wrong: $e');
      return null;
    }
  }

  /// [FacebookAuthentication]-FACEBOOK

  /*----------------End Federated Identity & Social Sign-in-------------*/

  /// [LogoutUser] Valid for any Authentication
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException {
      throw "Something wrong";
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw 'Something went wrong.Please try Again';
    }
  }

  /// DELETE USER-Remove user Auth and Firestore Account.
  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code);
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException {
      throw "Something wrong";
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw 'Something went wrong.Please try Again';
    }
  }

  void phoneAuthentication(phoneNumber) {}

  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: _phoneVerificationId.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }
}
