import 'package:flutter/material.dart';
import 'package:scribble_share/constants/color_constants.dart';
import 'package:scribble_share/views/auth/login_screen.dart';
import 'package:scribble_share/widgets/common_button.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Scribble Share",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: navyBlueColor),
            ),
            Image.asset("lib/assets/images/welcome.png"),
            CommonButton(
              text: "Get Started",
              onNavigate: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}
