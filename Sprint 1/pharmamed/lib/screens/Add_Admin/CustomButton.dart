import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.child,
    required this.color,
    required this.borderRadius,
    required this.OnPressed,
  });

  final Widget child;
  final Color color;
  final double borderRadius;
  final VoidCallback OnPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: child,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      onPressed: OnPressed,
    );
  }
}
