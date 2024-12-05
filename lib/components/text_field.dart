import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.fieldHeight,
      required this.fieldWidth,
      this.hintText,
      this.prefixText,
      this.prefixIconData,
      required this.onChanged,
      this.controller,
      this.obscureBool,
      this.suffixIconData,
      this.suffixIconPressed});

  final double fieldHeight;
  final double fieldWidth;
  final String? hintText;
  final String? prefixText;
  final IconData? prefixIconData;
  final void Function(String) onChanged;
  final TextEditingController? controller;
  final bool? obscureBool;
  final IconData? suffixIconData;
  final void Function()? suffixIconPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * fieldWidth,
      height: MediaQuery.of(context).size.height * fieldHeight,
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        obscureText: obscureBool ?? false,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Colors.black)),
            hintText: hintText,
            hintStyle:
                const TextStyle(color: Color(0xff606060), fontFamily: 'Nunito'),
            prefixText: prefixText,
            prefixIcon: prefixIconData != null
                ? Icon(prefixIconData, color: const Color(0xff606060))
                : null,
            suffixIcon: suffixIconData != null
                ? IconButton(
                    onPressed: suffixIconPressed, icon: Icon(suffixIconData))
                : null,
            contentPadding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.02,
                vertical: MediaQuery.of(context).size.height * 0.01)),
      ),
    );
  }
}
