// Import
import 'package:flutter/material.dart';
import 'package:bubble/constants/constants.dart';

// Action button class
class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
    required this.color,
    required this.icon,
    this.size = 54,
    required this.callback,
  }) : super(key: key);

  final Color color;
  final IconData icon;
  final double size;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 24,
            offset: const Offset(-22, 0),
          ),
          BoxShadow(
            color: color.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 24,
            offset: const Offset(22, 0),
          ),
          BoxShadow(
            color: color.withOpacity(0.1),
            spreadRadius: 8,
            blurRadius: 42,
            offset: const Offset(-22, 0),
          ),
          BoxShadow(
            color: color.withOpacity(0.1),
            spreadRadius: 8,
            blurRadius: 42,
            offset: const Offset(22, 0),
          ),
        ]
      ),
      child: ClipOval(
        child: Material(
          color: color,
          child: InkWell(
            splashColor: colorCardLight,
            child: SizedBox(
              width: size,
              height: size,
              child: Icon(
                icon,
                size: 26,
                color: Colors.white,
              ),
            ),
            onTap: callback,
          ),
        ),
      ),
    );
  }
}
