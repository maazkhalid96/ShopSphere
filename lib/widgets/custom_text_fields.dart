import 'package:flutter/material.dart';

class CustomTextFields extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController? controller;
  final IconData? prefixIcon;

  const CustomTextFields({
    super.key,
    required this.hintText,
    required this.isPassword,
    this.controller,
    this.prefixIcon,
  });

  @override
  State<CustomTextFields> createState() => _CustomTextFieldsState();
}

class _CustomTextFieldsState extends State<CustomTextFields> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscureText : false,
      cursorColor: const Color(0xFF4B39EF),

      decoration: InputDecoration(
        hintText: widget.hintText,

        prefixIcon: widget.prefixIcon != null
            ? Icon(
                widget.prefixIcon,
                color: Colors.blue,
              )
            : null,

        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: Colors.grey.shade600,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,

        filled: true,
        fillColor: Colors.grey.shade100,

        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 18),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Color(0xFF4B39EF),
            width: 1.5,
          ),
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}