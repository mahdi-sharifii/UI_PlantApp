import 'package:flutter/material.dart';

class NameWidget extends StatelessWidget {
  const NameWidget({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22, bottom: 22),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "ساناز امینی",
            style: themeData.textTheme.bodySmall,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image.asset(
              "assets/images/verified.png",
              width: 30,
            ),
          ),
        ],
      ),
    );
  }
}
