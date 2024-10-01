import '../general_exports.dart';

// ignore: must_be_immutable
class ElevatedButtonDiv extends StatelessWidget {
  ElevatedButtonDiv({
    required this.title,
    required this.color,
    required this.isButtonEnabled,
    required this.onPress,
    super.key,
  });
  final String title;
  Color color = Colors.deepPurpleAccent;
  final bool isButtonEnabled;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DEVICE_WIDTH * 0.04),
          ),
        ),
        backgroundColor: isButtonEnabled
            ? MaterialStateProperty.all(color)
            : MaterialStateProperty.all(Colors.grey),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
            horizontal: DEVICE_WIDTH * 0.01,
            vertical: DEVICE_HEIGHT * 0.02,
          ),
        ),
        textStyle: MaterialStateProperty.all(
          const TextStyle(fontSize: 30),
        ),
      ),
      onPressed: isButtonEnabled ? onPress : null,
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: DEVICE_WIDTH * 0.05,
          ),
        ),
      ),
    );
  }
}
