import 'package:flutter/material.dart';
import '../colors_core/colors_core.dart';

Color getStatusColor(String status) {

  switch (status.toLowerCase()) {
  case 'pendente':
  return Colors.orange.shade500;
  case 'vencida':
  return Colors.red;
  case 'activo':
  return const Color(0xff13d38e);
    case 'pré-fatura':
      return Color(0xFF388E3C);
    case 'inativo':
      return Colors.red;
    case 'orçamento':
      return Color(0xff80cc96);
    case 'fatura pró-forma':
      return const Color(0xFF81C784);
    case 'facturarecibo':
      return const Color(0xff6FAA5B);
    case 'total':
      return Color(0xFF388E3C);
    case 'em vigor':
      return const Color(0xff13d38e);
    case 'cancelar':
      return Colors.red;
    case 'aberto':
      return const Color(0xff13d38e);
    case 'em curso':
      return Colors.blue;
    case 'fechado':
      return Colors.black54;
    case 'balanço':
      return Colors.cyanAccent;
    case 'validados':
      return const Color(0xff13d38e);
    case 'rescindido':
      return Colors.red;
    default:
      return ColorsCore.primaryColor;
  }
}

Widget getIcon(String status) {
  final icons = <String, String>{
    'pré-fatura': "assets/images/paper.png",
    'total': "assets/images/paper.png",
    'balanço': "assets/images/paper.png",
    'in progress': "assets/images/paper.png",
    'orçamento': "assets/images/sales.png",
    'fatura pró-forma': "assets/images/payments.png",
    'facturarecibo': "assets/images/service.png",
  };

  final path = icons[status.toLowerCase()] ?? "assets/images/faturas.png";

  return Center(child: Image.asset(path,width: 25,height: 25));
}

