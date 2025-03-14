import 'package:multi_calculator/constants/utils/exports.dart';

extension IntExtension on int {
  SizedBox get heightBox => SizedBox(height: toDouble());

  SizedBox get widthBox => SizedBox(width: toDouble());
}

extension TextStyleExtensions on String {
  Widget toText(
      {double fontSize = 16,
      FontWeight fontWeight = FontWeight.normal,
      Color color = Colors.white}) {
    return Text(
      this,
      style:
          TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color),
    );
  }
}

extension CustomIcon on IconData {
  Icon toIcon({double size = 24, Color color = AppColors.white}) {
    return Icon(this, size: size, color: color);
  }
}

extension ButtonExtensions on String {
  Widget toButton(
      {required VoidCallback onTap,
      Color color = Colors.white,
      double fontSize = 16}) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: color.withOpacity(0.3),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: toText(fontSize: fontSize),
    );
  }
}

extension CenterWidget on Widget {
  Widget centered() {
    return Center(child: this);
  }
}

extension WidgetExtension on Widget {
  // OnPress
  Widget onPress(VoidCallback onTap) => InkWell(
        onTap: onTap,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        child: this,
      );

  // EXPANDED
  Widget get expanded => Expanded(
        child: this,
      );

  //ALIGN
  Widget align(Alignment alignment) => Align(alignment: alignment, child: this);

  // SINGLE PADDING
  Widget paddingOnly(
          {double top = 0,
          double bottom = 0,
          double left = 0,
          double right = 0}) =>
      Padding(
        padding: EdgeInsets.only(
          top: top,
          bottom: bottom,
          left: left,
          right: right,
        ),
        child: this,
      );

  // ALL PADDING
  Widget paddingAll(double padding) => Padding(
        padding: EdgeInsets.all(padding),
        child: this,
      );

  // SYMMETRIC PADDING
  Widget paddingSymmetric({double horizontal = 0, double vertical = 0}) =>
      Padding(
        padding:
            EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        child: this,
      );
}

extension ContainerExtensions on Widget {
  Widget toContainer(
      {double padding = 20,
      double borderRadius = 20,
      Color color = Colors.white}) {
    return Container(
      padding: EdgeInsets.all(padding),
      margin: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: color.withOpacity(0.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(4, 4),
          ),
        ],
        border: Border.all(color: Colors.white.withOpacity(0.5), width: 1.5),
      ),
      child: this,
    );
  }
}
