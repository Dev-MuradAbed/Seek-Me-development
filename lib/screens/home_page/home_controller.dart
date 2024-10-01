// ignore_for_file: always_specify_types

import '../../general_exports.dart';

class HomeController extends GetxController {
  int currentindex = 1;
  String location = 'Ayodhya Nagar, Bhopal';
  List<dynamic> list = <dynamic>[
    {
      keyImage: imageSliderPerson,
      keyColor: Colors.amber,
    },
    {
      keyImage: imageSliderPerson,
      keyColor: Colors.deepPurpleAccent,
    },
    {
      keyImage: imageSliderPerson,
      keyColor: Colors.amber,
    },
    {
      keyImage: imageSliderPerson,
      keyColor: Colors.deepPurpleAccent,
    },
  ];

  List<dynamic> categories = <dynamic>[
    {
      keyImage: imageCategoryOne,
      keyCategory: 'Salon for Women',
    },
    {
      keyImage: imageCategoryTwo,
      keyCategory: 'Tailor',
    },
    {
      keyImage: imageCategoryThree,
      keyCategory: 'Massage for Men',
    },
    {
      keyImage: imageCategoryFour,
      keyCategory: 'Salon for Men',
    },
    {
      keyImage: imageCategoryFive,
      keyCategory: 'Home Repairs',
    },
    {
      keyImage: imageCategorySix,
      keyCategory: 'AC Service & Repair',
    },
  ];

  List<dynamic> topFreelance = <dynamic>[
    {
      keyName: 'Jack Harlow',
      keyImage: imageTopFrelanceTwo,
      keyCategory: 'Electrician',
      keyRate: '4.5'
    },
    {
      keyName: 'Nina Chen',
      keyImage: imageTopFrelanceOne,
      keyCategory: 'Cleaner',
      keyRate: '4.8'
    },
    {
      keyName: 'Ahmad Khan',
      keyImage: imageTopFrelanceThree,
      keyCategory: 'Tailor',
      keyRate: '4.8'
    },
  ];

  List<dynamic> services = <dynamic>[
    {
      keyImage: imageServiceOne,
      keyService: 'Hair services for men',
    },
    {
      keyImage: imageServiceTwo,
      keyService: 'Electrician services',
    },
  ];

  void onPageUpdated(int index, dynamic reason) {
    currentindex = index;
    update();
  }
}
