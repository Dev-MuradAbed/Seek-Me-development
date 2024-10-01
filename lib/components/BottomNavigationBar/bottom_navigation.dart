import '../../general_exports.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<BottomNavigationWidget>(
        init: BottomNavigationWidget(),
        builder: (BottomNavigationWidget controller) {
          return Scaffold(
            backgroundColor: Colors.white,
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: true,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.deepPurpleAccent,
              currentIndex: controller.currentindex,
              onTap: controller.onTap,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: DEVICE_HEIGHT * 0.01),
                    child: const Icon(Icons.grid_view_rounded),
                  ),
                  label: 'home'.tr,
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: DEVICE_HEIGHT * 0.01),
                    child: const Icon(Icons.view_timeline_rounded),
                  ),
                  label: 'bookings'.tr,
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: DEVICE_HEIGHT * 0.01),
                    child: const Icon(Icons.account_balance_wallet_rounded),
                  ),
                  label: 'Wallet'.tr,
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: DEVICE_HEIGHT * 0.01),
                    child: const Icon(Icons.person_rounded),
                  ),
                  label: 'profile'.tr,
                ),
              ],
            ),
            body: controller.pages[controller.currentindex],
          );
        },
      ),
    );
  }
}
