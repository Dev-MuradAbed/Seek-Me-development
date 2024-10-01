// ignore_for_file: always_specify_types

import '../../general_exports.dart';

class OnBoardingController extends GetxController {
  int currentIndex = 0;
  PageController controller = PageController();

  List<dynamic> introScreens = <dynamic>[
    {
      keyImage: imageIntroOne,
      keyTitle: 'intr_text_one'.tr,
    },
    {
      keyImage: imageIntroTwo,
      keyTitle: 'intr_text_two'.tr,
    },
    {
      keyImage: imageIntroThree,
      keyTitle: 'intr_text_three'.tr,
    },
  ];

  void onPageChanged(int value) {
    currentIndex = value;
    update();
  }

  void onTap() {
    Get.toNamed(routeRegister);
    update();
  }

  void onPressed() {
    controller.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
    if (currentIndex == introScreens.length - 1) {
      Get.toNamed(routeRegister);
    }
    update();
  }
}
