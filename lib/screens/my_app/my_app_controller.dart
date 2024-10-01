import 'dart:async';

import 'package:package_info_plus/package_info_plus.dart';

import '../../general_exports.dart';

class MyAppController extends GetxController {
  dynamic userData;
  bool isFirstRun = true;
  LocalStorage localStorage = LocalStorage();
  String? versionName;
  String? buildNumber;

  @override
  Future<void> onInit() async {
    super.onInit();
    userData = await localStorage.getFromStorage(key: storeUser);
    isFirstRun =
        await localStorage.getFromStorage(key: storeIsFirstRun) ?? true;
    consoleLog(userData, key: 'userData');
  }

  @override
  void onReady() {
    super.onReady();
    PackageInfo.fromPlatform().then(
      (PackageInfo packageInfo) {
        versionName = packageInfo.version;
        buildNumber = packageInfo.buildNumber;
        update();
      },
    );
  }

  void onUserAuthenticated(dynamic userDataValue) {
    localStorage.saveToStorage(key: storeUser, value: userDataValue);
    userData = userDataValue;
    consoleLog('onUserAuthenticated$userData');
    update();
  }

  void onFirstRunUpdated() {
    localStorage.saveToStorage(key: storeIsFirstRun, value: false);
    isFirstRun = false;
    consoleLog('onFirstRunUpdated$isFirstRun');
  }

  void onSignOut() {
    localStorage.erase();
    userData = null;
  }
}
