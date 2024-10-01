import '../../general_exports.dart';

class BottomNavigationWidget extends GetxController {
  int currentindex = 0;
  List<Widget> pages = <Widget>[
    const HomePage(),
    const Center(child: Text('Bookings Page')),
    const Center(child: Text('Wallet Page')),
    const Center(child: Text('Profile Page'))
  ];

  void onTap(int value) {
    currentindex = value;
    update();
  }
}
