import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String? fieldText;
  final String? hintText, label;
  final bool isFinal;
  final bool enabled;
  final bool readOnly;
  final FormFieldValidator<String>? validator;
  final int limit;
  final String filteringRegex;
  final int maxLines;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final bool isPassword;
  final bool isCaps;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final ValueChanged<String>? onFieldSubmitted;
  final VoidCallback? onEditingComplete;
  final Color labelColor;
  final double labelFontSize;

  final String? suffixIcon;
  final String? prefixIcon;

  final void Function()? suffixIconOnTap;

  final double suffixConstraint;
  final double prefixConstraint;

  final Iterable<String>? autoFillHints;

  const CustomTextField({
    super.key,
    this.fieldText,
    this.hintText,
    this.isFinal = false,
    this.readOnly = false,
    this.validator,
    this.enabled = true,
    this.label,
    this.isCaps = false,
    this.onChanged,
    this.onTap,
    this.isPassword = false,
    this.limit = 100,
    this.filteringRegex = "",
    this.maxLines = 1,
    this.focusNode,
    this.nextFocusNode,
    this.controller,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.labelColor = Colors.black,
    this.labelFontSize = 14,
    this.suffixConstraint = 10,
    this.prefixConstraint = 10,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixIconOnTap,
    this.autoFillHints,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      textCapitalization: isCaps ? TextCapitalization.sentences : TextCapitalization.none,
      obscureText: isPassword,
      focusNode: focusNode,
      onTap: onTap,
      validator: validator,
      enabled: enabled,
      readOnly: readOnly,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      onChanged: onChanged,
      autofillHints: autoFillHints,
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp(filteringRegex)),
        LengthLimitingTextInputFormatter(limit),
      ],
      onFieldSubmitted: (_) {
        isFinal ? FocusScope.of(context).unfocus() : FocusScope.of(context).requestFocus(nextFocusNode);
      },
      textInputAction: isFinal ? TextInputAction.done : textInputAction,
      style: TextStyle(
        // fontSize: lableFontSize.sp,
        fontSize: labelFontSize,
        // color: labelColor,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        filled: true,
        labelText: fieldText,
        hintText: hintText,
        alignLabelWithHint: true,
        labelStyle: TextStyle(
          // fontSize: lableFontSize.sp,
          fontSize: labelFontSize,
          // color: labelColor,
          fontWeight: FontWeight.w400,
        ),
        isDense: true,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(width: 1.0, color: Colors.redAccent),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(width: 1.0, color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(width: 1.0, color: Colors.grey),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(width: 1.0, color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(width: 1.0, color: Colors.grey),
        ),
      ),
    );
  }
}
