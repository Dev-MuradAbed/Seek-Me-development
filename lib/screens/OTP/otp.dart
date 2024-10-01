import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../../general_exports.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({super.key});

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<OtpController>(
          init: OtpController(),
          builder: (OtpController controller) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: DEVICE_WIDTH * 0.06),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: DEVICE_HEIGHT * 0.2,
                    ),
                    Text(
                      'verification_code'.tr,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: DEVICE_WIDTH * 0.07),
                    ),
                    SizedBox(
                      height: DEVICE_HEIGHT * 0.02,
                    ),
                    Text(
                      'verification_message'.tr,
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        letterSpacing: DEVICE_WIDTH * 0.002,
                        fontSize: DEVICE_WIDTH * 0.03,
                      ),
                    ),
                    SizedBox(
                      height: DEVICE_HEIGHT * 0.02,
                    ),
                    Text(
                      '+91 6390168836',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: DEVICE_WIDTH * 0.04,
                      ),
                    ),
                    SizedBox(
                      height: DEVICE_HEIGHT * 0.04,
                    ),
                    OTPTextField(
                      otpFieldStyle: OtpFieldStyle(
                        focusBorderColor: Colors.deepPurpleAccent,
                        enabledBorderColor: Colors.deepPurple[200]!,
                      ),
                      width: DEVICE_WIDTH * 0.7,
                      textFieldAlignment: MainAxisAlignment.spaceEvenly,
                      fieldWidth: DEVICE_WIDTH * 0.12,
                      fieldStyle: FieldStyle.box,
                      outlineBorderRadius: DEVICE_WIDTH * 0.04,
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                      onChanged: controller.onChanged,
                      onCompleted: controller.onCompleted,
                    ),
                    SizedBox(
                      height: DEVICE_HEIGHT * 0.15,
                    ),
                    ElevatedButtonDiv(
                      title: 'continue'.tr,
                      color: Colors.deepPurpleAccent,
                      isButtonEnabled: controller.isButtonEnabeld,
                      onPress: controller.onTap,
                    )
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
