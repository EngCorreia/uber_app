

import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {

  const AppCard({
     required this.child,
     this.margin,
     this.padding,
    required this.backgroundColor,
  });
  final Widget child;
  final Color backgroundColor;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.black.withOpacity(.2),
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: child,
    );
  }
}
