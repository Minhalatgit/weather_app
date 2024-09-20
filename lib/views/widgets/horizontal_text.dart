import 'package:flutter/material.dart';

class HorizontalText extends StatelessWidget {
  const HorizontalText({super.key, required this.title, required this.value, this.widget});

  final String title;
  final String value;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          widget ??
              Text(
                value,
                // style: TextStyle(fontWeight: FontWeight.w600),
              ),
        ],
      ),
    );
  }
}
