import 'package:evoting/src/core/themes/colors.dart';
import 'package:flutter/material.dart';

import '../atoms/padding.dart';

class IconTextButton extends StatelessWidget {
  const IconTextButton({
    Key? key,
    required this.text,
    required this.icon,
    this.color = primaryColor,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final String icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            padding8,
            Flexible(
              flex: 1,
              child: Image.asset(
                icon,
                height: 52,
                width: 52,
              ),
            ),
            padding16,
            Flexible(
                flex: 2,
                child: Center(
                  child: Text(
                    text.toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .button
                        ?.copyWith(color: Colors.white, fontSize: 24),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
