import 'package:filmo/mixins/validations_mixin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextInputComponent extends StatelessWidget with ValidationsMixin {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool? isObscureText;
  final String? obscureCharacter;
  final int? maxLength;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? sufixIcon;
  final String? Function(String?) validation;

  const TextInputComponent({
    super.key,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.isObscureText = false,
    this.obscureCharacter = "*",
    required this.hintText,
    this.prefixIcon,
    this.sufixIcon,
    this.maxLength = 20,
    required this.validation,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SizedBox(
      height: height * 0.101,
      child: TextFormField(
        controller: controller,
        validator: validation,
        keyboardType: keyboardType,
        obscureText: isObscureText!,
        obscuringCharacter: obscureCharacter!,
        style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
          fontSize: 14,
        ),
        maxLength: maxLength,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 12.0),
          constraints: BoxConstraints(
            maxHeight: height * 0.065,
            maxWidth: width * 0.9,
          ),
          filled: true,
          fillColor: Theme.of(context).colorScheme.primaryContainer,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.tertiary,
            fontSize: 14,
          ),
          prefixIcon: prefixIcon,
          suffixIcon: sufixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
