import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.enabled = true,
    this.fontSize = 16,
    this.width,
    this.height = 50,
  });

  final String label;
  final bool enabled;
  final VoidCallback onPressed;
  final double fontSize;
  final double? width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: Colors.grey,
          disabledForegroundColor: Colors.grey,
          foregroundColor: Colors.black54,
          backgroundColor: Colors.black54,
          elevation: 0,
          // side: BorderSide(
          //   width: 0.8,
          //   color: enabled ? borderColor : borderColor.withOpacity(0.5),
          // ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: enabled ? onPressed : null,
        child: Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
