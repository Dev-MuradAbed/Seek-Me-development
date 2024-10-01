import '../../general_exports.dart';

class OtpController extends GetxController {
  bool isButtonEnabeld = false;

  void onCompleted(String pin) {
    isButtonEnabeld = true;
    update();
  }

  void onChanged(String pin) {
    if (pin.length < 4) {
      isButtonEnabeld = false;
    }
    update();
  }

  void onTap() {
    Get.toNamed(routeHome);
  }
}
