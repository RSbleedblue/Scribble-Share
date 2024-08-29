import 'package:flutter/material.dart';
import 'package:scribble_share/constants/color_constants.dart';

class CommonElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const CommonElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, 
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 5), 
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(color: primaryColor, width: 2.0),
          ),
          elevation: 0, 
          textStyle: const TextStyle(color: Colors.black), 
        ),
        child: child,
      ),
    );
  }
}
