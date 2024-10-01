import 'package:carousel_slider/carousel_slider.dart';

import '../../components/gridview.dart';
import '../../general_exports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (HomeController controller) {
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: DEVICE_HEIGHT * 0.03,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: DEVICE_WIDTH * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius:
                                BorderRadius.circular(DEVICE_WIDTH * 0.04),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(DEVICE_WIDTH * 0.02),
                            child: Image.asset(imagePerson),
                          ),
                        ),
                        SizedBox(width: DEVICE_WIDTH * 0.03),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'hi'.tr,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: DEVICE_WIDTH * 0.06,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                showModalBottomSheet<void>(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(50),
                                      topLeft: Radius.circular(50),
                                    ),
                                  ),
                                  backgroundColor: Colors.white,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const BottomSheetPage();
                                  },
                                );
                              },
                              child: Row(
                                children: <Widget>[
                                  const Icon(
                                    Icons.location_on,
                                  ),
                                  SizedBox(
                                    width: DEVICE_WIDTH * 0.01,
                                  ),
                                  Text(
                                    controller.location,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: DEVICE_WIDTH * 0.03,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius:
                            BorderRadius.circular(DEVICE_WIDTH * 0.02),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(DEVICE_WIDTH * 0.02),
                        child: const Icon(
                          Icons.notifications_rounded,
                          color: Colors.deepPurpleAccent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: DEVICE_HEIGHT * 0.03,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: DEVICE_HEIGHT * 0.03),
                child: TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: 'search'.tr,
                    prefixIcon: const Icon(Icons.search),
                    prefixIconColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(DEVICE_WIDTH * 0.05),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(DEVICE_WIDTH * 0.05),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: DEVICE_HEIGHT * 0.01,
              ),
              CarouselSlider.builder(
                options: CarouselOptions(
                  onPageChanged: controller.onPageUpdated,
                  aspectRatio: 16 / 8,
                  disableCenter: true,
                  initialPage: 1,
                ),
                itemCount: controller.list.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return Container(
                    margin: EdgeInsets.all(DEVICE_WIDTH * 0.02),
                    decoration: BoxDecoration(
                      color: controller.list[index][keyColor],
                      borderRadius: BorderRadius.circular(DEVICE_WIDTH * 0.05),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                left: DEVICE_WIDTH * 0.04,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    padding:
                                        EdgeInsets.all(DEVICE_WIDTH * 0.02),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                          DEVICE_WIDTH * 0.05),
                                    ),
                                    child: Text(
                                      'new_users'.tr,
                                      style: TextStyle(
                                        color: Colors.deepPurple,
                                        fontSize: DEVICE_WIDTH * 0.04,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      RichText(
                                        text: TextSpan(
                                          text: 'get_message'.tr,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: DEVICE_WIDTH * 0.06,
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: '25%'.tr,
                                              style: TextStyle(
                                                fontSize: DEVICE_WIDTH * 0.08,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.amber,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'services'.tr,
                                    style: TextStyle(
                                      fontSize: DEVICE_WIDTH * 0.03,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(DEVICE_WIDTH * 0.05),
                            ),
                            child: Image.asset(
                              controller.list[index][keyImage],
                              width: DEVICE_WIDTH * 0.35,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                carouselController: CarouselController(),
              ),
              SizedBox(
                height: DEVICE_HEIGHT * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(
                  controller.list.length,
                  (int index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    height: DEVICE_HEIGHT * 0.01,
                    width: controller.currentindex == index
                        ? DEVICE_WIDTH * 0.07
                        : DEVICE_WIDTH * 0.02,
                    margin: EdgeInsets.only(right: DEVICE_WIDTH * 0.01),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(DEVICE_WIDTH * 0.02),
                      color: controller.currentindex == index
                          ? Colors.deepPurpleAccent
                          : Colors.grey,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: DEVICE_WIDTH * 0.07),
                child: Row(
                  children: <Widget>[
                    Text(
                      'categories'.tr,
                      style: TextStyle(
                        fontSize: DEVICE_WIDTH * 0.06,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(DEVICE_WIDTH * 0.05),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.categories.length,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: DEVICE_WIDTH * 0.3,
                    mainAxisExtent: DEVICE_WIDTH * 0.3,
                    mainAxisSpacing: DEVICE_WIDTH * 0.03,
                    crossAxisSpacing: DEVICE_WIDTH * 0.03,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        //  if (controller.categories[index][keyCategory] ==
                        // 'Salon for Women') {
                        Get.toNamed(routeSalon);
                        //  }
                      },
                      child: GridViewContainer(
                        title: controller.categories[index][keyCategory],
                        path: controller.categories[index][keyImage],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: DEVICE_HEIGHT * 0.01,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: DEVICE_WIDTH * 0.07),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'top_freelancers'.tr,
                      style: TextStyle(
                        fontSize: DEVICE_WIDTH * 0.06,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'explore'.tr,
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        const Icon(
                          Icons.keyboard_double_arrow_right_rounded,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: DEVICE_HEIGHT * 0.001,
              ),
              SizedBox(
                width: DEVICE_WIDTH * 0.9,
                height: DEVICE_HEIGHT * 0.26,
                child: ListView.builder(
                  itemCount: controller.topFreelance.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(
                        top: DEVICE_HEIGHT * 0.05,
                        right: DEVICE_HEIGHT * 0.01,
                      ),
                      height: DEVICE_HEIGHT * 0.02,
                      width: DEVICE_HEIGHT * 0.22,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius:
                            BorderRadius.circular(DEVICE_WIDTH * 0.07),
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: <Widget>[
                          Positioned(
                            top: -27,
                            right: 50,
                            child: Container(
                              padding: EdgeInsets.all(DEVICE_WIDTH * 0.01),
                              decoration: BoxDecoration(
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.grey[100]!,
                                  ),
                                ],
                                borderRadius:
                                    BorderRadius.circular(DEVICE_WIDTH * 0.09),
                              ),
                              child: ClipOval(
                                child: Image.asset(
                                  controller.topFreelance[index][keyImage],
                                  width: 63,
                                  height: 63,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              SizedBox(
                                height: DEVICE_HEIGHT * 0.06,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    controller.topFreelance[index][keyName],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: DEVICE_WIDTH * 0.001,
                                    ),
                                  ),
                                  Icon(
                                    Icons.check_circle_rounded,
                                    color: Colors.blue,
                                    size: DEVICE_WIDTH * 0.04,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: DEVICE_HEIGHT * 0.01,
                              ),
                              Text(
                                controller.topFreelance[index][keyCategory],
                                style: TextStyle(
                                  color: Colors.grey,
                                  letterSpacing: DEVICE_WIDTH * 0.001,
                                ),
                              ),
                              SizedBox(
                                height: DEVICE_HEIGHT * 0.01,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: DEVICE_WIDTH * 0.04,
                                  ),
                                  SizedBox(
                                    width: DEVICE_WIDTH * 0.02,
                                  ),
                                  Text(
                                    controller.topFreelance[index][keyRate],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: DEVICE_HEIGHT * 0.01,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: DEVICE_WIDTH * 0.06,
                                  vertical: DEVICE_HEIGHT * 0.01,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple,
                                  borderRadius: BorderRadius.circular(
                                    DEVICE_WIDTH * 0.05,
                                  ),
                                ),
                                child: Text(
                                  'view_profile'.tr,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: DEVICE_WIDTH * 0.04,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: DEVICE_HEIGHT * 0.02,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: DEVICE_WIDTH * 0.07),
                child: Row(
                  children: <Widget>[
                    Text(
                      'trending_services'.tr,
                      style: TextStyle(
                        fontSize: DEVICE_WIDTH * 0.06,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: DEVICE_HEIGHT * 0.01,
              ),
              SizedBox(
                width: DEVICE_WIDTH * 0.9,
                height: DEVICE_HEIGHT * 0.2,
                child: ListView.builder(
                  itemCount: controller.services.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.all(DEVICE_WIDTH * 0.01),
                      width: DEVICE_WIDTH * 0.6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: <Color>[
                            Colors.transparent,
                            Colors.black.withOpacity(0.3)
                          ],
                          begin: Alignment.center,
                          end: Alignment.bottomCenter,
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            controller.services[index][keyImage],
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: DEVICE_HEIGHT * 0.16),
                        child: Text(
                          controller.services[index][keyService],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: DEVICE_HEIGHT * 0.01,
              ),
            ],
          ),
        );
      },
    );
  }
}
