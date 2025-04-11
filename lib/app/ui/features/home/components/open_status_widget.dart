import 'package:flutter/material.dart';

import '../../../utils/extensions/context_extension.dart';

class OpenStatusWidget extends StatelessWidget {
  const OpenStatusWidget({
    super.key,
    required this.text,
    required this.color,
  });

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: context.appTypography.openRegularItalic,
        ),
        const SizedBox(width: 4),
        Material(
          color: color,
          shape: const CircleBorder(),
          child: const SizedBox.square(
            dimension: 8,
          ),
        ),
      ],
    );
  }
}
