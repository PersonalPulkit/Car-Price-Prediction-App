import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final Icon? icon;
  final Icon? sicon;
  final String text;
  final TextEditingController? fetchtext;
  final int? maxlines;
  final TextInputType? keyboard;
  final FocusNode? hasFocus;
  final String? errorMessage;

  CustomTextField({super.key, this.icon, this.sicon, required this.text, this.fetchtext, this.maxlines, this.keyboard, this.hasFocus, this.errorMessage});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(

      focusNode: widget.hasFocus,
      maxLines: widget.maxlines,
      controller: widget.fetchtext,
      decoration: InputDecoration(
        errorText: widget.errorMessage,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        label: Text(widget.text),

        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            // borderSide: BorderSide.none
    ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          // borderSide: BorderSide.none,
        ),
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 20,
        ),
        prefixIcon: widget.icon,
        suffixIcon: widget.sicon,
      ),
      keyboardType: widget.keyboard,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
    );
  }
}


