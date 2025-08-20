import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {

  const PrimaryButton({super.key, required this.child, required this.onPressed,});
  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: DefaultTextStyle(
        style: const TextStyle(
          color: Colors.white,
        ),
        child: child,
      ),
    );
  }
}
