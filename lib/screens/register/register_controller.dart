import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../../general_exports.dart';

class RegisterController extends GetxController {
  final TextEditingController mobileNumberCtrl = TextEditingController();
  int countryMaxlength = 10;
  bool isButtonEnabled = false;

  void onCountryChanged(Country selectedCountry) {
    countryMaxlength = selectedCountry.maxLength;
    mobileNumberCtrl.text = '';
    isButtonEnabled = false;
    update();
  }

  void onChanged(PhoneNumber phone) {
    isButtonEnabled = phone.number.length == countryMaxlength;
    update();
  }

  void onPress() {
    if (isButtonEnabled) {
      Get.toNamed(routeOTP);
    }
    update();
  }
}
