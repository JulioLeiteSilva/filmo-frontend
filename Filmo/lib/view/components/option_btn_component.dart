import 'package:flutter/material.dart';

class OptionBtnComponent extends StatelessWidget {
  final VoidCallback onTap;
  final String backgroundImageAsset;

  const OptionBtnComponent({
    super.key,
    required this.onTap,
    required this.backgroundImageAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          icon: Image.asset(backgroundImageAsset),
      ),
    );
  }
}
