import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class MessageUI extends StatelessWidget {
  MessageUI({
    super.key,
    this.image,
    required this.title,
    required this.subtitle,
    this.onRetry,
    required this.onTap,
    this.retryButton,
  });
  final String? image;
  final String title;
  final String subtitle;
  Function? onRetry;
  final Function onTap;
  Widget? retryButton;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).cardColor,
      child: InkWell(
        onTap: () => onTap,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ...[

                  image !=null?
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 180),
                    child: SvgPicture.asset(
                      image!,
                      fit: BoxFit.cover,
                      width: 180,
                    ),
                  ) : Container(),
                  const SizedBox(height: 50),
                ],
                SizedBox(
                  width: 250,
                  child: Column(
                    children: [
                      ...[
                        Text(
                          title
                              .split(' ')
                              .map((e) =>
                                  e[0].toUpperCase() + e.substring(1, e.length))
                              .join(' '),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                      ],
                      Text(
                        subtitle,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFF939393),
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
