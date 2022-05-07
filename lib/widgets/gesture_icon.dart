// Import
import 'package:flutter/material.dart';
import 'package:bubble/constants/constants.dart';

// Gesture icon class
class GestureIcon extends StatelessWidget {
  const GestureIcon({
    Key? key,
    required this.icon,
    required this.fill,
    required this.callback,
  }) : super(key: key);

  const GestureIcon.fill({
    Key? key,
    required this.icon,
    required this.callback,
  }) : fill = true, super(key: key);

  const GestureIcon.border({
    Key? key,
    required this.icon,
    required this.callback,
  }) : fill = false, super(key: key);

  final IconData icon;
  final bool fill;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return fill ? Material(
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
    ) : InkWell(
      borderRadius: BorderRadius.circular(6),
      splashColor: colorTint,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            width: 2,
            color: Theme.of(context).cardColor,
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Icon(icon, size: 18)
        ),
      ),
      onTap: callback,
    );
  }
}
