import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.fieldWidth,
      this.fieldHeight,
      required this.hintText,
      this.prefixText,
      this.icon,
      required this.onChanged,
      this.controller});

  final double fieldWidth;
  final double? fieldHeight;
  final String hintText;
  final String? prefixText;
  final IconData? icon;
  final void Function(String) onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * fieldWidth,
      height: fieldHeight != null
          ? MediaQuery.of(context).size.height * fieldHeight!
          : MediaQuery.of(context).size.height * 0.06,
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            enabled: controller != null && !controller!.text.isNotEmpty
                ? false
                : true,
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(10.0)),
            prefixIcon: icon != null ? Icon(icon, color: Colors.black) : null,
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 20.0, color: Colors.black),
            contentPadding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.01,
                horizontal: MediaQuery.of(context).size.width * 0.02),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(10.0))),
      ),
    );
  }
}
