import 'package:get/get.dart';
import 'package:loginapp/features/authentication/screens/cart/cart.dart';
import 'package:loginapp/features/authentication/screens/login/login_screen.dart';
import 'package:loginapp/features/authentication/screens/mail_verification/verify_email.dart';
import 'package:loginapp/features/authentication/screens/on_boarding/onboarding.dart';
import 'package:loginapp/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:loginapp/features/authentication/screens/profile/profile.dart';
import 'package:loginapp/features/authentication/screens/signup/signup_screen.dart';
import 'package:loginapp/features/personalization/screens/settings/settings.dart';
import 'package:loginapp/features/shop/screens/checkout/checkout.dart';
import 'package:loginapp/features/shop/screens/home/home.dart';
import 'package:loginapp/features/shop/screens/store/store.dart';
import 'package:loginapp/features/shop/screens/wishlist/wishlist.dart';
import 'package:loginapp/routes/routes.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: TRoutes.home, page: () => const HomeScreen()),
    GetPage(name: TRoutes.store, page: () => const StoreScreen()),
    GetPage(name: TRoutes.favourites, page: () => const FavouriteScreen()),
    GetPage(name: TRoutes.settings, page: () => const SettingsScreen()),
    // GetPage(
    //     name: TRoutes.productReviews, page: () => const ProductReviewsScreen()),
    //GetPage(name: TRoutes.order, page: () => const OrderScreen()),
    GetPage(name: TRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: TRoutes.cart, page: () => const CartScreen()),
    GetPage(name: TRoutes.userProfile, page: () => const ProfileScreen()),
    //GetPage(name: TRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: TRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: TRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: TRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: TRoutes.forgetPassword, page: () => const ForgetPassword()),
    GetPage(name: TRoutes.onBoarding, page: () => const OnBoardingScreen()),
  ];
}
