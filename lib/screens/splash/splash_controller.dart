import '../../general_exports.dart';

class SplashController extends GetxController {
  MyAppController get myAppController => Get.find<MyAppController>();

  @override
  void onInit() {
    super.onInit();
    Future<void>.delayed(
      const Duration(seconds: 2),
      (() {
        if (myAppController.isFirstRun) {
          myAppController.onFirstRunUpdated();
          Get.toNamed(routeOnBoarding);
        } else {
          Get.toNamed(routeRegister);
        }
      }),
    );
  }
}
