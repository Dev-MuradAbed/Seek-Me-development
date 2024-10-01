import '../../general_exports.dart';

class BottomSheetPage extends StatelessWidget {
  const BottomSheetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomSheetController>(
        init: BottomSheetController(),
        builder: (BottomSheetController controller) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(DEVICE_WIDTH * 0.1),
                topRight: Radius.circular(DEVICE_WIDTH * 0.1),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: DEVICE_HEIGHT * 0.02,
                ),
                Container(
                  height: DEVICE_HEIGHT * 0.005,
                  width: DEVICE_WIDTH * 0.09,
                  margin: EdgeInsets.only(
                    right: DEVICE_WIDTH * 0.04,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      DEVICE_WIDTH * 0.04,
                    ),
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: DEVICE_WIDTH * 0.05,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: DEVICE_HEIGHT * 0.03,
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  'Select_location'.tr,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: DEVICE_WIDTH * 0.06,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: DEVICE_HEIGHT * 0.02,
                            ),
                            TextField(
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[200],
                                hintText: 'Search_for_area'.tr,
                                prefixIcon: const Icon(
                                  Icons.search,
                                ),
                                prefixIconColor: Colors.grey,
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[300]!),
                                  borderRadius: BorderRadius.circular(
                                    DEVICE_WIDTH * 0.04,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(
                                    DEVICE_WIDTH * 0.04,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: DEVICE_HEIGHT * 0.02,
                            ),
                            ListTile(
                              leading: const Icon(
                                Icons.location_searching_rounded,
                                color: Colors.deepPurpleAccent,
                              ),
                              title: Text(
                                'Use_current_location'.tr,
                                style: const TextStyle(
                                  color: Colors.deepPurpleAccent,
                                ),
                              ),
                              subtitle: Padding(
                                padding: EdgeInsets.only(
                                  top: DEVICE_HEIGHT * 0.002,
                                ),
                                child: Text('location'.tr),
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.deepPurpleAccent,
                              ),
                              onTap: controller.onTap,
                            ),
                            const Divider(
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: DEVICE_HEIGHT * 0.02,
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  'Saved_addresses'.tr,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: DEVICE_WIDTH * 0.05,
                                  ),
                                ),
                              ],
                            ),
                            ListTile(
                              leading: Container(
                                padding: EdgeInsets.all(
                                  DEVICE_WIDTH * 0.01,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      DEVICE_WIDTH * 0.04),
                                  border: Border.all(
                                    color: Colors.grey[300]!,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.home_outlined,
                                  color: Colors.grey,
                                ),
                              ),
                              title: Text(
                                'home'.tr,
                                style: const TextStyle(color: Colors.black),
                              ),
                              subtitle: Padding(
                                padding: EdgeInsets.only(
                                  top: DEVICE_HEIGHT * 0.002,
                                ),
                                child: Text(
                                  'address'.tr,
                                  style:
                                      TextStyle(fontSize: DEVICE_WIDTH * 0.03),
                                ),
                              ),
                              trailing: const Icon(
                                Icons.menu,
                                color: Colors.grey,
                              ),
                              onTap: () {},
                            ),
                            const Divider(
                              color: Colors.grey,
                            ),
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
