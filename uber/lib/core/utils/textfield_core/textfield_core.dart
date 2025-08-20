

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewFormTextField extends StatefulWidget {
  const NewFormTextField({
    Key? key,
    this.focus,
    required this.keyboardType,
    this.isPass = false,
    this.isDate = false,
    this.isMap = false,
    this.show = true,
    this.icon,
    required this.text,
    this.fillColor,
    this.autoFocus = false,
    this.hintColor,
    this.mainColor,
    this.isCenter,
    this.validate,
    this.validator,
    this.onTapDate,
    this.isSearch = false,
    this.border,
    this.enable,
    this.maxLines,
    required this.controller,
    required this.formater,
    this.onChanged,
    this.dropdown,
    this.onFieldSubmitted,
    this.containerSize,
    this.onMap,
    this.showShadow = true,
    this.textCapitalization,
    this.textInputAction,
  }) : super(key: key);

  final FocusNode? focus;

  final TextInputType keyboardType;
  final Widget? icon;
  final Color? fillColor, hintColor, mainColor;
  final bool autoFocus, isMap;
  final String text;
  final int? maxLines;
  final Function(String)? onChanged;
  final Function? onMap;
  final double? border;
  final bool? enable;
  final bool isSearch;
  final Function? onTapDate;
  final TextEditingController controller;
  final TextCapitalization? textCapitalization;
  final bool isPass, show, isDate;
  final bool? isCenter;
  final Widget? dropdown;
  final double? containerSize;
  final bool? showShadow;
  final String? Function(String?)? validator;
  final AutovalidateMode? validate;
  final List<TextInputFormatter> formater;
  final Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;

  @override
  // ignore: library_private_types_in_public_api
  _NewFormTextFieldState createState() => _NewFormTextFieldState();
}

class _NewFormTextFieldState extends State<NewFormTextField> {
  late bool _passwordVisible;
  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: widget.containerSize,
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
              color: widget.showShadow! ? Colors.white : Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: widget.showShadow!
                  ? [
                BoxShadow(
                    color: Colors.black.withOpacity(.1),
                    blurRadius: 15,
                    offset: const Offset(0.0, 0.0))
              ]
                  : null),
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            vertical: 8,
          ),
          child: TextFormField(
            enabled: widget.enable,
            // readOnly: widget.isMap == true,
            cursorColor: Colors.blue,
            onChanged: widget.onChanged != null ? (value) => widget.onChanged!(value) : null,
            maxLines: widget.maxLines ?? 1,
            onTapOutside: (_) => context.unfocus(),
            autofocus: widget.autoFocus,
            autovalidateMode: widget.validate,
            style: TextStyle(color: widget.showShadow! ? Colors.black : Colors.black),
            textCapitalization: widget.textCapitalization != null
                ? widget.textCapitalization!
                : TextCapitalization.none,
            focusNode: widget.focus,
            validator: widget.validator,
            textInputAction: widget.textInputAction,
            onFieldSubmitted: widget.onFieldSubmitted,
            inputFormatters: widget.formater,
            obscureText: widget.isPass ? !_passwordVisible : false,
            controller: widget.controller,
            textAlign:
            widget.isCenter == true ? TextAlign.center : TextAlign.left,
            keyboardType: widget.keyboardType,
            decoration: InputDecoration(
              prefixIcon: widget.icon != null ? Padding(
                padding: const EdgeInsets.all(13),
                child: widget.icon,
              ) : null,
              suffixIcon: widget.isPass && widget.show == true
                  ? GestureDetector(
                onTap: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
                child: _passwordVisible
                    ? const Icon(Icons.visibility,
                    color: Colors.blue
                )
                    : Icon(
                  Icons.visibility_off,
                  color: Colors.grey.shade500,
                ),
              ) : widget.isMap == true ? GestureDetector(
                onTap: () => widget.onMap!(),
                child: Icon(
                  Icons.map,
                  color: Colors.grey.shade500,
                ),
              )
                  : null,
              hintText: widget.text,
              hintStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300),
              contentPadding: const EdgeInsets.only(
                  left: 16, right: 16, top: 12, bottom: 12),
              isDense: true,
              // isCollapsed: true,
              filled: true,
              fillColor: widget.enable == false ? Colors.grey.shade50 : Colors.white,
              enabledBorder: InputBorder.none,

            ),
          ),
        ),
      ],
    );
  }
}

void unfocus(BuildContext context) => FocusScope.of(context).unfocus();

extension UnFocusExtension on BuildContext {
  void unfocus() => FocusScope.of(this).unfocus();
}