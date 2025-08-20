import 'package:flutter/material.dart';

class DialogWidgets extends StatelessWidget {
  const DialogWidgets({super.key, required this.tittle, required this.content, required this.action});

  final String tittle;
  final String content;
  final List<Widget> action;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text(tittle),
      content: Text(content),
      actions: action,
      actionsAlignment: MainAxisAlignment.end,
    );
  }
}

