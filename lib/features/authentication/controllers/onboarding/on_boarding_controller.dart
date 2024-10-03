import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import 'package:loginapp/features/authentication/screens/login/login_screen.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../models/model_on_boarding.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  /// Variables
  final pageController = PageController();
  RxInt currentPageIndex = 0.obs;

  /// Update current index when page scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  /// Jump to the specific dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  /// Update current index & jump to next page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      final storage = GetStorage();
      storage.write('isFirstTime', false);
      Get.offAll(const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }

  // final pages = [
  //   OnBoardingPageWidget(
  //     model: OnBoardingModel(
  //         image: tOnBoardingImage1,
  //         title: tOnBoardingTitle1,
  //         subTitle: tOnBoardingSubTitle1,
  //         counterText: tOnBoardingCounter1,
  //         //height: size.height,
  //         bgColor: tOnBoardingPage1Color),
  //   ),
  //   OnBoardingPageWidget(
  //       model: OnBoardingModel(
  //           image: tOnBoardingImage2,
  //           title: tOnBoardingTitle2,
  //           subTitle: tOnBoardingSubTitle2,
  //           counterText: tOnBoardingCounter2,
  //           //height: size.height,
  //           bgColor: tOnBoardingPage2Color)),
  //   OnBoardingPageWidget(
  //       model: OnBoardingModel(
  //           image: tOnBoardingImage3,
  //           title: tOnBoardingTitle3,
  //           subTitle: tOnBoardingSubTitle3,
  //           counterText: tOnBoardingCounter3,
  //           //height: size.height,
  //           bgColor: tOnBoardingPage3Color)),
  // ];
  //
  // skip() => pageController.jumpToPage(2);
  // animateToNextSlide() {
  //   int nextpage = pageController.currentPage + 1;
  //   pageController.animateToPage(
  //     page: nextpage,
  //   );
  // }
  //
  // onPageChangedCallback(int activePageIndex) =>
  //     currentpage.value = activePageIndex;
}
