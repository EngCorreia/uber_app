import '../../infra/locator.dart';
import '../../views/startup/startup_view_model.dart';
import 'package:intl/intl.dart';
final _startupViewModel = locator<StartupViewModel>();
String get env => _startupViewModel.env;


String? validateEmailfield(String? value, {String? errorMsg}) {
  String pattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  RegExp regExp = RegExp(pattern);

  if (value != null && value.isNotEmpty && !regExp.hasMatch(value)) {
    return 'Digite um email válido.';
  }
  return null;
}

String? validateURLfield(String? value, {String? errorMsg}) {
  if (Uri.parse(value!).hasAbsolutePath == false &&
      Uri.parse(value).hasPort == false) {
    return 'Digite um URL válido';
  }
  return null;
}

String? validateTextDateField(String? value) {
  if (value == null || value.isEmpty) {
    return "Campo obrigatório.";
  }

  if (value.length >= 10) {
    String pattern =
        r"^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$";
    RegExp regExp = RegExp(pattern);
    if (regExp.hasMatch(value)) {
      var inputFormat = DateFormat('dd/MM/yyyy');
      var inputDate = inputFormat.parse(value);
      if (inputDate.isAfter(DateTime.now())) {
        return "Digite uma data válida.";
      }
    } else {
      return "Digite uma data válida.";
    }
  }

  return null;
}

String? validatePhoneField(String? value, {String? errorMsg}) {
  if (value == null || value.isEmpty) {
    return "Campo obrigatório.";
  }
  if (value.length < 9) {
    return 'Precisa de 9 dígitos para o telefone.';
  }

  return null;
}

String? validateTextField(String? value, {String? errorMsg}) {
  if (value == null || value.isEmpty) {
    return "Campo obrigatório.";
  }

  return null;
}

String? validatePasswordField(String? value) {
  String pattern =
      r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@#$!%*?&])[A-Za-z\d@#$!%*?&]{8,}$";
  RegExp regExp = RegExp(pattern);
  if (value == null || value.isEmpty) {
    return "texto inalido";
  }
  if (!regExp.hasMatch(value)) {
    String value = "\$@#!%*?&";
    return 'texto inalido $value';
  }
  return null;
}

String? validateBi(String? value) {
  String pattern = r"^\d\d\d\d\d\d\d\d\d[a-zA-Z][a-zA-Z]\d\d\d$";
  RegExp regExp = RegExp(pattern);
  if (value == null || value.isEmpty) {
    return "Campo obrigatório.";
  }

  if (!regExp.hasMatch(value)) {
    return 'Digite um Bilhete de identidade válido';
  }

  return null;
}
