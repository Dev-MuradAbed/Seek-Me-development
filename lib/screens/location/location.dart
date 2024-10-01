import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../general_exports.dart';

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
          actions: <Widget>[
            SizedBox(
              width: DEVICE_WIDTH * 0.09,
            ),
          ],
          title: Center(
            child: Text(
              'choose_location'.tr,
            ),
          ),
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: LatLng(51.509865, -0.118092),
                zoom: 14.4746,
              ),
              onMapCreated: (GoogleMapController controller) {
                Completer<GoogleMapController>().complete(controller);
              },
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              height: 250,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                      blurRadius: 4,
                      offset: Offset(1, 1),
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(DEVICE_WIDTH * 0.09),
                    topRight: Radius.circular(DEVICE_WIDTH * 0.09),
                  ),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: DEVICE_HEIGHT * 0.03),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                        height: DEVICE_HEIGHT * 0.03,
                      ),
                      Row(
                        children: <Widget>[
                          const Icon(
                            Icons.location_on,
                          ),
                          SizedBox(
                            width: DEVICE_WIDTH * 0.03,
                          ),
                          Text(
                            'current_location'.tr,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: DEVICE_WIDTH * 0.04,
                              letterSpacing: DEVICE_WIDTH * 0.002,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: DEVICE_HEIGHT * 0.01,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: DEVICE_WIDTH * 0.09,
                          ),
                          Text(
                            'ayodhya_bypass'.tr,
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: DEVICE_HEIGHT * 0.07,
                      ),
                      ElevatedButtonDiv(
                        title: 'Confirm location',
                        color: Colors.deepPurpleAccent,
                        isButtonEnabled: true,
                        onPress: () {},
                      ),
                      SizedBox(
                        height: DEVICE_HEIGHT * 0.05,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
