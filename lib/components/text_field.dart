import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.fieldHeight,
      required this.fieldWidth,
      this.hintText,
      this.prefixText,
      this.prefixIconData,
      required this.onChanged,
      this.controller});

  final double fieldHeight;
  final double fieldWidth;
  final String? hintText;
  final String? prefixText;
  final IconData? prefixIconData;
  final void Function(String) onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * fieldWidth,
      height: MediaQuery.of(context).size.height * fieldHeight,
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Colors.black)),
            hintText: hintText,
            prefixText: prefixText,
            prefixIcon: prefixIconData != null ? Icon(prefixIconData) : null,
            contentPadding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.02,
                vertical: MediaQuery.of(context).size.height * 0.01)),
      ),
    );
  }
}
