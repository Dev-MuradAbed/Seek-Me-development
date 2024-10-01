import '../../general_exports.dart';

void hideKeyboard() {
  WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
}

dynamic isTablet(dynamic tabletValue, dynamic mobileValue) {
  if (DEVICE_WIDTH > 600) {
    return tabletValue;
  } else {
    return mobileValue;
  }
}

int setColor(String? color) {
  if (color == null || color.isEmpty) {
    return AppColors.white;
  }
  final String stringColor = '0xFF${color.replaceAll('#', '')}';
  final int newColor = int.parse(stringColor);
  return newColor;
}
