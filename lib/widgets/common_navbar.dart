import 'package:flutter/material.dart';
import 'package:scribble_share/constants/color_constants.dart';

class CommonNavbar extends StatelessWidget implements PreferredSizeWidget {
  final String label;
  const CommonNavbar({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      centerTitle: label == "Home" ? false : true,
      title: Text(
        label,
        style:const TextStyle(color: navyBlueColor, fontWeight: FontWeight.bold),
      ),
      automaticallyImplyLeading: label == "Home" ? false : true,
      leading: label == "Home" ? null : Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40), color: navyBlueColor),
            child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ))),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
