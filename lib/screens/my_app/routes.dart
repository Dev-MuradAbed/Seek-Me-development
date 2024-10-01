import '../../general_exports.dart';

List<GetPage<dynamic>> appRoutes = <GetPage<dynamic>>[
  GetPage<Splash>(
    name: routeSplash,
    page: () => const Splash(),
  ),
  GetPage<OnBoarding>(
    name: routeOnBoarding,
    page: () => const OnBoarding(),
  ),
  GetPage<Register>(
    name: routeRegister,
    page: () => const Register(),
  ),
  GetPage<OtpForm>(
    name: routeOTP,
    page: () => const OtpForm(),
  ),
  GetPage<BottomNavigation>(
    name: routeHome,
    page: () => const BottomNavigation(),
  ),
  GetPage<SalonForWeman>(
    name: routeSalon,
    page: () => const SalonForWeman(),
  ),
  GetPage<Location>(
    name: routeLocation,
    page: () => const Location(),
  ),
];
