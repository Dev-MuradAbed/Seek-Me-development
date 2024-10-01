// ignore_for_file: always_specify_types

import '../../general_exports.dart';

class SalonForWemanController extends GetxController {
  List<dynamic> categories = <dynamic>[
    {
      keyImage: imageSalonOne,
      keyCategory: 'facialfor_glow'.tr,
      keyPrice: '₹599'
    },
    {
      keyImage: imageSalonTwo,
      keyCategory: 'manicure'.tr,
      keyPrice: '₹499',
    },
    {
      keyImage: imageSalonThree,
      keyCategory: 'pediure'.tr,
      keyPrice: '₹499',
    },
    {
      keyImage: imageSalonFour,
      keyCategory: 'threading'.tr,
      keyPrice: '₹59',
    },
  ];

  void onTap() {}
}
