import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scribble_share/providers/login_provider.dart';
import 'package:scribble_share/utils/scribble_painter.dart';
import 'package:scribble_share/constants/color_constants.dart';
import 'package:scribble_share/widgets/common_navbar.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ScribbleScreen extends StatefulWidget {
  const ScribbleScreen({super.key});

  @override
  _ScribbleScreenState createState() => _ScribbleScreenState();
}

class _ScribbleScreenState extends State<ScribbleScreen> {
  late IO.Socket socket;
  List<Offset?> points = [];
  late String userId;

  @override
  void initState() {
    super.initState();
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    userId = loginProvider.userId ?? '';

    socket = IO.io('http://10.0.2.2:2090', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    socket.connect();
    socket.on('draw', (data) {
      final newPoints = (data as List)
          .map((point) => point != null ? Offset(point['x'], point['y']) : null)
          .toList();

      setState(() {
        points = newPoints;
      });
    });
  }

  void sendPoints() {
    final data = points
        .map((point) => point != null ? {'x': point.dx, 'y': point.dy, 'userId': userId} : null)
        .toList();
    socket.emit('draw', data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonNavbar(label: "Scribble Canvas"),
      body: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            points.add(details.localPosition);
            sendPoints();
          });
        },
        onPanEnd: (details) {
          setState(() {
            points.add(null);
            sendPoints();
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
              sendPoints();
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

  @override
  void dispose() {
    socket.disconnect();
    super.dispose();
  }
}
