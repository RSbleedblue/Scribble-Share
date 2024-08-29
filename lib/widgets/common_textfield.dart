import 'package:flutter/material.dart';
import 'package:scribble_share/constants/color_constants.dart';

class CommonTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool isPassword;

  const CommonTextField({
    super.key, 
    required this.label, 
    required this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
  });

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _isObscured : false,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white, 
        labelText: widget.label,
        labelStyle: TextStyle(color: primaryColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0), 
          borderSide: BorderSide(color: primaryColor, width: 2.0), 
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: primaryColor, width: 2.0), 
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: primaryColor, width: 2.0),
        ),
        prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon, color: primaryColor) : null, // Prefix icon with color
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(_isObscured ? Icons.visibility : Icons.visibility_off, color: primaryColor),
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
              )
            : (widget.suffixIcon != null ? Icon(widget.suffixIcon, color: primaryColor) : null), // Suffix icon with color
      ),
    );
  }
}
