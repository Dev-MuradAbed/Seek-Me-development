import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../general_exports.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: Locale(Get.find<AppLanguageController>().appLocale),
      builder: (BuildContext context, Widget? child) {
        return ScrollConfiguration(
          behavior:
              MyScrollBehavior(), // This behavior disables the effect of the default scroll behavior.
          child: Stack(
            children: <Widget>[
              FlutterSmartDialog(child: child),
            ],
          ),
        );
      },

      theme: ThemeData(
        fontFamily: 'roboto',
        primaryColor: Color(AppColors.primary),
      ),
      translations: Translation(),

      // we use the fallbackLocale to handel any error in language files and use the en as default language
      fallbackLocale: const Locale('en'),
      debugShowCheckedModeBanner: false,
      initialRoute: routeSplash,
      getPages: appRoutes,
    );
  }
}
