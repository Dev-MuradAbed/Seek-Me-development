import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

import './general_exports.dart';

// Add this function
Future<void> _ensureScreenSize(dynamic window) async {
  return window.viewConfiguration.geometry.isEmpty
      ? Future<void>.delayed(
          const Duration(milliseconds: 10), () => _ensureScreenSize(window))
      : Future<void>.value();
}

Future<void> main() async {
  // add this line to check if windows rendered or not
  final SingletonFlutterWindow window =
      WidgetsFlutterBinding.ensureInitialized().window;
  await _ensureScreenSize(window);
  //

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black, // navigation bar color
      statusBarColor: Colors.transparent, // status bar color
      statusBarIconBrightness: Brightness.light, // status bar icons' color
      statusBarBrightness: Brightness.dark, // status bar icons' color (IOS)
      systemNavigationBarIconBrightness:
          Brightness.dark, //navigation bar icons' color
    ),
  );
  await GetStorage.init();
  Get.put<MyAppController>(MyAppController());
  Get.put<AppLanguageController>(AppLanguageController());

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}
