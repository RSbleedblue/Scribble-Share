import 'package:flutter/material.dart';
import 'package:scribble_share/constants/color_constants.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback onNavigate;
  const CommonButton({super.key, required this.text, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onNavigate,
      child: Container(
        height: 50,
        width: double.infinity * 0.8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: navyBlueColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
