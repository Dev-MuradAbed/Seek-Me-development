import 'package:dotted_border/dotted_border.dart';

import '../../general_exports.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<OnBoardingController>(
          init: OnBoardingController(),
          builder: (OnBoardingController controller) {
            return Stack(
              children: <Widget>[
                PageView.builder(
                  controller: controller.controller,
                  onPageChanged: controller.onPageChanged,
                  itemCount: controller.introScreens.length,
                  itemBuilder: ((BuildContext context, int index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            '${controller.introScreens[index][keyImage]}',
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: DEVICE_HEIGHT * 0.3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '${controller.introScreens[controller.currentIndex][keyTitle]}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: fontH1(),
                                color: Colors.deepPurpleAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
                Positioned(
                  top: DEVICE_HEIGHT * 0.1,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          right: DEVICE_WIDTH * 0.1,
                          left: DEVICE_WIDTH * 0.2,
                        ),
                        child: Visibility(
                          visible: controller.currentIndex <
                              controller.introScreens.length - 1,
                          child: InkWell(
                            onTap: controller.onTap,
                            child: Text(
                              'Skip'.tr,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List<Widget>.generate(
                        controller.introScreens.length,
                        (int index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          height: DEVICE_HEIGHT * 0.01,
                          width: controller.currentIndex == index
                              ? DEVICE_WIDTH * 0.07
                              : DEVICE_WIDTH * 0.02,
                          margin: EdgeInsets.only(right: DEVICE_WIDTH * 0.02),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(DEVICE_WIDTH * 0.02),
                            color: controller.currentIndex == index
                                ? Colors.deepPurpleAccent
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: DEVICE_HEIGHT * 0.04,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(DEVICE_WIDTH * 0.06),
                      child: DottedBorder(
                        dashPattern: const <double>[30, 8],
                        strokeWidth: DEVICE_WIDTH * 0.01,
                        color: Colors.grey.withOpacity(0.7),
                        radius: Radius.circular(DEVICE_WIDTH * 3),
                        child: Padding(
                          padding: EdgeInsets.all(DEVICE_WIDTH * 0.01),
                          child: ElevatedButton(
                            onPressed: controller.onPressed,
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.deepPurpleAccent),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    DEVICE_WIDTH * 0.05,
                                  ),
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: DEVICE_WIDTH * 0.05,
                              ),
                              child:
                                  const Icon(Icons.arrow_forward_ios_rounded),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: DEVICE_HEIGHT * 0.06,
                    )
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
