import '../../general_exports.dart';

class SalonForWeman extends StatelessWidget {
  const SalonForWeman({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          title: Center(
            child: Text(
              'salonfor_women'.tr,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actions: <Widget>[
            SizedBox(
              width: DEVICE_WIDTH * 0.09,
            )
          ],
        ),
        body: GetBuilder<SalonForWemanController>(
          init: SalonForWemanController(),
          builder: (SalonForWemanController controller) {
            return Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(DEVICE_WIDTH * 0.05),
                  child: InkWell(
                    onTap: controller.onTap,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.categories.length,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: DEVICE_WIDTH * 0.7,
                        mainAxisExtent: DEVICE_WIDTH * 0.6,
                        mainAxisSpacing: DEVICE_WIDTH * 0.06,
                        crossAxisSpacing: DEVICE_WIDTH * 0.04,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey[200]!,
                              width: 2,
                            ),
                            borderRadius:
                                BorderRadius.circular(DEVICE_WIDTH * 0.05),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: DEVICE_HEIGHT * 0.01,
                              ),
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(DEVICE_WIDTH * 0.04),
                                child: Image.asset(
                                  controller.categories[index][keyImage],
                                ),
                              ),
                              SizedBox(
                                height: DEVICE_HEIGHT * 0.009,
                              ),
                              Text(
                                controller.categories[index][keyCategory],
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: DEVICE_WIDTH * 0.04,
                                ),
                              ),
                              SizedBox(
                                height: DEVICE_HEIGHT * 0.006,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    controller.categories[index][keyPrice],
                                    style: TextStyle(
                                      fontSize: DEVICE_WIDTH * 0.05,
                                      color: Colors.deepPurpleAccent,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: DEVICE_WIDTH * 0.01,
                                  ),
                                  Text(
                                    'onwards',
                                    style: TextStyle(
                                      fontSize: DEVICE_WIDTH * 0.04,
                                      color: Colors.deepPurpleAccent,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
