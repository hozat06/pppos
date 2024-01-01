// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  String? label;
  Color? labelColor = const Color(0xFF000000);
  String? helperText;
  Icon? icon;
  TextInputType? keyboardType = TextInputType.text;
  TextEditingController? controller;
  TextAlign? textAlign = TextAlign.start;
  int? maxLength = 0;
  bool? enableSuggestions;
  bool? autofocus;
  bool? readOnly = false;
  bool? password = false;
  double? borderRadius = 1;
  double? borderLineWidth = 1;
  Color? borderColor = Colors.grey;
  Color? borderFocusColor = Colors.grey;
  Color? backgroundColor = Colors.white;
  Color? textColor = const Color(0xFF000000);
  Color? hintColor = Colors.grey;
  double? textSize = 12;
  ValueChanged<String>? onChanged;
  VoidCallback? onEditingComplete;
  GestureTapCallback? onTap;

  CustomTextField(
      {Key? key,
      this.label,
      this.labelColor,
      this.helperText,
      this.icon,
      this.keyboardType,
      this.controller,
      this.textAlign,
      this.maxLength,
      this.enableSuggestions,
      this.autofocus,
      this.readOnly,
      this.password,
      this.borderRadius,
      this.borderLineWidth,
      this.borderColor,
      this.borderFocusColor,
      this.backgroundColor,
      this.textColor,
      this.hintColor,
      this.textSize,
      this.onChanged,
      this.onEditingComplete,
      this.onTap})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  Color getFocusBorderColor() {
    Color result = widget.borderFocusColor ?? Colors.grey;
    if (widget.borderFocusColor == null && widget.borderColor != null) {
      result = widget.borderColor!;
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingComplete,
      onTap: widget.onTap,
      controller: widget.controller,
      obscureText: widget.password ?? false,
      style: TextStyle(
        fontSize: widget.textSize,
        color: widget.textColor ?? const Color(0xFF000000),
      ),
      textAlign: widget.textAlign ?? TextAlign.start,
      maxLength: widget.maxLength,
      enableSuggestions: widget.enableSuggestions ?? false,
      autofocus: widget.autofocus ?? false,
      readOnly: widget.readOnly ?? false,
      decoration: InputDecoration(
        prefixIcon: widget.icon,
        fillColor: widget.backgroundColor,
        filled: true,
        labelText: widget.label,
        labelStyle: TextStyle(
          fontSize: widget.textSize,
          color: widget.labelColor ?? const Color(0xFF000000),
        ),
        hintStyle: TextStyle(
          fontSize: widget.textSize,
          color: widget.hintColor ?? const Color(0xFF000000),
        ),
        helperText: widget.helperText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: widget.borderLineWidth ?? 1,
              color: widget.borderColor ?? Colors.grey),
          borderRadius: BorderRadius.all(Radius.elliptical(
              widget.borderRadius ?? 0, widget.borderRadius ?? 0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: widget.borderLineWidth ?? 1,
            color: getFocusBorderColor(),
          ),
          borderRadius: BorderRadius.all(Radius.elliptical(
              widget.borderRadius ?? 0, widget.borderRadius ?? 0)),
        ),
      ),
    );
  }
}
