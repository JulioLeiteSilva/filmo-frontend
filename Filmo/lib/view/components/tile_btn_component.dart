import 'package:flutter/material.dart';

class TileBtnComponent extends StatelessWidget {
  final String btnText;
  final Color? btnColor;
  final VoidCallback onTap;
  final double? btnWidth;
  final double? btnHeight;
  final double? fontSize;
  final Color? btnBorderColor;
  

  const TileBtnComponent({
    super.key,
    required this.btnText,
    this.btnColor,
    required this.onTap,
    this.fontSize = 20,
    this.btnWidth,
    this.btnHeight,
    this.btnBorderColor,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        maximumSize: Size(btnWidth ?? width, btnHeight ?? height * 0.07),
        backgroundColor:
            btnColor ?? Theme.of(context).colorScheme.onSecondaryContainer,
        foregroundColor: Theme.of(context).colorScheme.secondary,
        surfaceTintColor: Theme.of(context).colorScheme.secondary,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
      ),
      child: Center(
        child: Text(
          btnText,
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
