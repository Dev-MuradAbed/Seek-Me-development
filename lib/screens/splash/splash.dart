import '../../general_exports.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setIsRTL(context);
    return Scaffold(
      backgroundColor: const Color(AppColors.white),
      body: GetBuilder<SplashController>(
        init: SplashController(),
        builder: (SplashController controller) {
          return Stack(
            children: <Widget>[
              Center(
                child: Image.asset(imageLogo),
              ),
            ],
          );
        },
      ),
    );
  }
}
