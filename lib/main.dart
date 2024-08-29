import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scribble_share/constants/color_constants.dart';
import 'package:scribble_share/providers/login_provider.dart';
import 'package:scribble_share/utils/generateRoutes.dart';
import 'package:scribble_share/views/welcome.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> LoginProvider()),
      ],
      child: MaterialApp(
        title: 'Scribble Share',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          scaffoldBackgroundColor: Colors.white,
          useMaterial3: true,
        ),
        onGenerateRoute: generateRoute,
        home: const Welcome(),
      ),
    );
  }
}
