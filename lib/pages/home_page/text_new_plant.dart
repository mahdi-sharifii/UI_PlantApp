import 'package:flutter/material.dart';

class TextNewPlant extends StatelessWidget {
  const TextNewPlant({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: EdgeInsets.only(right: 18),
        child: Text("گیاهان جدید",
            style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: "Lalezar")),
      ),
    );
  }
}
