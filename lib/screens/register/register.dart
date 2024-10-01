import 'package:intl_phone_field/intl_phone_field.dart';

import '../../components/index.dart';
import '../../general_exports.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<RegisterController>(
          init: RegisterController(),
          builder: (RegisterController controller) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: DEVICE_WIDTH * 0.06),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: DEVICE_HEIGHT * 0.1,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: DEVICE_HEIGHT * 0.07),
                      child: Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          imageLogo,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        IntlPhoneField(
                          controller: controller.mobileNumberCtrl,
                          onCountryChanged: controller.onCountryChanged,
                          onChanged: controller.onChanged,
                          decoration: InputDecoration(
                            hintText: 'mobile_Number'.tr,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(DEVICE_WIDTH * 0.04),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: DEVICE_HEIGHT * 0.01,
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'referral_code'.tr,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(DEVICE_WIDTH * 0.04),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: DEVICE_HEIGHT * 0.02,
                        ),
                        Text(
                          'hint_message'.tr,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: DEVICE_WIDTH * 0.03,
                          ),
                        ),
                        SizedBox(
                          height: DEVICE_HEIGHT * 0.02,
                        ),
                        ElevatedButtonDiv(
                          onPress: controller.onPress,
                          title: 'login_Sign_up'.tr,
                          color: Colors.deepPurpleAccent,
                          isButtonEnabled: controller.isButtonEnabled,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: DEVICE_HEIGHT * 0.02,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: DEVICE_WIDTH * 0.4,
                          child: Divider(
                            thickness: DEVICE_WIDTH * 0.004,
                            height: DEVICE_HEIGHT * 0.04,
                            color: Colors.grey,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: DEVICE_WIDTH * 0.02,
                          ),
                          child: Center(
                            child: Text(
                              'or'.tr,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: DEVICE_WIDTH * 0.4,
                          child: Divider(
                            thickness: DEVICE_WIDTH * 0.004,
                            height: DEVICE_HEIGHT * 0.04,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: DEVICE_HEIGHT * 0.01,
                    ),
                    ContainerButton(
                      onPress: () {},
                      image: imagegoogle,
                      title: 'continue_with_Google'.tr,
                    ),
                    SizedBox(
                      height: DEVICE_HEIGHT * 0.02,
                    ),
                    ContainerButton(
                      onPress: () {},
                      image: imagefacebook,
                      title: 'continue_with_Facebook'.tr,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
