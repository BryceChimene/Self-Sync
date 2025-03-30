import 'package:flutter/material.dart';

class SFormDivider extends StatelessWidget {
  const SFormDivider({
    super.key,
    required this.dividerText
  });

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: Colors.white24,
            endIndent: 10,
          ),
        ),
        Text(
          dividerText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
        const Expanded(
          child: Divider(
            color: Colors.white24,
            indent: 10,
          ),
        ),
      ],
    );
  }
}