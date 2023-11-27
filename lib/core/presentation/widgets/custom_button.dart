import 'package:flutter/material.dart';
import 'package:interview/managers/utils/palettes/colors.dart';
import 'package:interview/managers/utils/radius.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    super.key,
    this.width,
    this.height,
    required this.text,
    this.onTap,
    required this.color,
    this.textColor,
    this.loadingStatus = false,
  });
  final double? width;
  final double? height;
  final String text;
  final void Function()? onTap;
  final Color color;
  final Color? textColor;
  final bool loadingStatus;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: loadingStatus ? DesignColors.kDarkRed : color,
          borderRadius: AppRadius.kmediumBorderRadius,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: textColor ?? Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
