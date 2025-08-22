import 'package:flutter/material.dart';
import 'package:flutter_application_1/Colors/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
final VoidCallback? onPressed; // <-- make it nullable


  // Customizable colors
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;

  // Dimensions
  final double? borderRadius;
  final double? width;
  final double? height;

  const CustomElevatedButton({
    super.key,
    required this.text,
     this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.borderRadius,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SizedBox(
      width: width ?? screenSize.width * 0.8,
      height: height ?? screenSize.height * 0.05,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor ?? Colors.white,
          backgroundColor: backgroundColor ?? AppColors.buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 18),
            side: BorderSide(
              color: borderColor ?? Colors.transparent, // if no border, transparent
              width: borderColor != null ? 1
               : 0, // show border only if provided
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
