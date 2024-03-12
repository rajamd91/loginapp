import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';

import '../../../constants/colors.dart';
import '../../../constants/image_strings.dart';
import '../../../constants/text_strings.dart';
import '../models/model_on_boarding.dart';
import '../screens/on_boarding/on_boarding_page_widget.dart';

class OnBoardingController extends GetxController {
  final controller = LiquidController();

  RxInt currentpage = 0.obs;
  final pages = [
    OnBoardingPageWidget(
      model: OnBoardingModel(
          image: tOnBoardingImage1,
          title: tOnBoardingTitle1,
          subTitle: tOnBoardingSubTitle1,
          counterText: tOnBoardingCounter1,
          //height: size.height,
          bgColor: tOnBoardingPage1Color),
    ),
    OnBoardingPageWidget(
        model: OnBoardingModel(
            image: tOnBoardingImage2,
            title: tOnBoardingTitle2,
            subTitle: tOnBoardingSubTitle2,
            counterText: tOnBoardingCounter2,
            //height: size.height,
            bgColor: tOnBoardingPage2Color)),
    OnBoardingPageWidget(
        model: OnBoardingModel(
            image: tOnBoardingImage3,
            title: tOnBoardingTitle3,
            subTitle: tOnBoardingSubTitle3,
            counterText: tOnBoardingCounter3,
            //height: size.height,
            bgColor: tOnBoardingPage3Color)),
  ];

  skip() => controller.jumpToPage(page: 2);
  animateToNextSlide() {
    int nextpage = controller.currentPage + 1;
    controller.animateToPage(page: nextpage);
  }

  onPageChangedCallback(int activePageIndex) =>
      currentpage.value = activePageIndex;
}
