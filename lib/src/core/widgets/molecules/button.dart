import 'package:flutter/material.dart';

import '../../themes/colors.dart';

class EVButton extends StatelessWidget {
  const EVButton({
    Key? key,
    required this.text,
    this.color = primaryColor,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 12,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(
            text.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .button
                ?.copyWith(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
    );
  }
}
