import 'package:flutter/material.dart';
import 'package:scribble_share/utils/scribble_painter.dart';
import 'package:scribble_share/constants/color_constants.dart';
import 'package:scribble_share/widgets/common_navbar.dart';

class ScribbleScreen extends StatefulWidget {
  const ScribbleScreen({super.key});

  @override
  _ScribbleScreenState createState() => _ScribbleScreenState();
}

class _ScribbleScreenState extends State<ScribbleScreen> {
  List<Offset?> points = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonNavbar(label: "Scribble Canvas"),
      body: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            points.add(details.localPosition);
          });
        },
        onPanEnd: (details) {
          setState(() {
            points.add(null);
          });
        },
        child: CustomPaint(
          painter: ScribblePainter(points),
          size: Size.infinite,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: navyBlueColor, 
        ),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              points.clear();
            });
          },
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20),
            backgroundColor: Colors.transparent, 
            shadowColor: Colors.transparent,
          ),
          child: const Icon(Icons.clear, color: Colors.white),
        ),
      ),
    );
  }
}
