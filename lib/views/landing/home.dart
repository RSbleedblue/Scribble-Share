import 'package:flutter/material.dart';
import 'package:scribble_share/constants/color_constants.dart';
import 'package:scribble_share/views/landing/scribble_screen.dart';
import 'package:scribble_share/widgets/common_navbar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonNavbar(label: "Home"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Center(
              child: Text(
                'Once upon a time...',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const ScribbleScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20),
                  backgroundColor:
                      navyBlueColor, // Set the button color directly
                ),
                child: const Icon(Icons.add, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
