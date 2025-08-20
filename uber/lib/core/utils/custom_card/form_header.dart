import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final Widget? title;
  final Widget? icon;
  final Widget? trailing;
  final EdgeInsets? padding;

  const Header({
     Key? key,
    @required this.title,
    this.icon,
    this.trailing,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: Padding(
                  padding: padding ??
                    const  EdgeInsets.only(
                        top: 15,
                        left: 15,
                        bottom: 15,
                      ),
                  child: Row(
                    children: <Widget>[
                      if (icon != null)
                        Column(
                          children: <Widget>[
                            icon!,
                          ],
                        ),
                   const   SizedBox(
                        width: 15,
                      ),
                      DefaultTextStyle(
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                        child: title!,
                      )
                    ],
                  ),
                ),
              ),
              if (trailing != null) trailing!,
            ],
          ),
         const Divider(
            height: 0,
          ),
        ],
      ),
    );
  }
}
