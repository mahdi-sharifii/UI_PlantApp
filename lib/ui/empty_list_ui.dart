import 'package:flutter/material.dart';

class EmptyListUI extends StatelessWidget {
  const EmptyListUI({
    super.key,
    required this.text,
    required this.src,
  });
  final String text;
  final String src;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            src,
            width: 110,
          ),
          Text(
            text,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: "Yekan",
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}
