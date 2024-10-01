import '../general_exports.dart';

class GridViewContainer extends StatelessWidget {
  const GridViewContainer({required this.title, required this.path, super.key});
  final String title;
  final String path;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 4,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(DEVICE_WIDTH * 0.05),
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: DEVICE_HEIGHT * 0.01,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(DEVICE_WIDTH * 0.04),
            child: Image.asset(
              path,
            ),
          ),
          SizedBox(
            height: DEVICE_HEIGHT * 0.006,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: DEVICE_WIDTH * 0.03),
          ),
        ],
      ),
    );
  }
}
