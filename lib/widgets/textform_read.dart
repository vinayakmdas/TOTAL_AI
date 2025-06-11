import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? labelText;
  final String hintText;
  final IconData? icon;
  final TextEditingController? controller;
  final Color? line;
  final Color? focusColor;
  final Color? borderside;
  final Color? filedcolor;
  final Color? cursocolor;
  final Color? textcolos;
  const CustomTextFormField({
    super.key,

    this.labelText,
    required this.hintText,
    this.icon,
    this.controller,
    this.line,
    this.focusColor,
    this.borderside,
    this.textcolos,
    this.cursocolor,
    this.filedcolor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(
        color: textcolos ?? Colors.black, // 🔴 Text color
        fontSize: 16,
      ),
      cursorColor: cursocolor,

      decoration: InputDecoration(
        fillColor: filedcolor,
        filled: true,
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.white),
        hintText: hintText,
        hintStyle: TextStyle(color: textcolos),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: line ?? Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: Icon(icon),
        focusColor: focusColor,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.grey, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: borderside ?? Colors.grey, width: 2),
        ),
      ),
 
      keyboardType: TextInputType.name,
    );
  }
}
