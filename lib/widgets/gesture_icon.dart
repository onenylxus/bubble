// Import
import 'package:flutter/material.dart';
import 'package:bubble/constants/constants.dart';

// Gesture icon class
class GestureIcon extends StatelessWidget {
  const GestureIcon({
    Key? key,
    required this.icon,
    required this.callback,
  }) : super(key: key);

  final IconData icon;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).cardColor,
      borderRadius: BorderRadius.circular(6),
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        splashColor: colorTint,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Icon(icon, size: 18),
        ),
        onTap: callback,
      ),
    );
  }
}
