import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({super.key, required this.themeData});
  final ThemeData themeData;

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {
            final NavigatorState navigator = Navigator.of(context);
            navigator.pop();
          },
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(7),
              elevation: 0,
              backgroundColor: widget.themeData.primaryColor.withOpacity(0.2),
              shape: const CircleBorder()),
          child: Icon(
            Icons.close_rounded, // : Icons.favorite_border_outlined,
            color: widget.themeData.primaryColor,
            size: 30,
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(7),
              elevation: 0,
              backgroundColor: widget.themeData.primaryColor.withOpacity(0.2),
              shape: const CircleBorder()),
          child: Icon(
            Icons.share,
            color: widget.themeData.primaryColor,
            size: 30,
          ),
        ),
      ],
    );
  }
}

class MyAppBarCamera extends StatefulWidget {
  const MyAppBarCamera({super.key});

  @override
  State<MyAppBarCamera> createState() => _MyAppBarCameraState();
}

class _MyAppBarCameraState extends State<MyAppBarCamera> {
  bool flashOn = false;
  QRViewController? controller;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {
            final NavigatorState navigator = Navigator.of(context);
            navigator.pop();
          },
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(7),
              elevation: 0,
              backgroundColor: Colors.white.withOpacity(0.2),
              shape: const CircleBorder()),
          child: const Icon(
            Icons.close_rounded, // : Icons.favorite_border_outlined,
            color: Colors.white70,
            size: 30,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            controller?.toggleFlash();
            setState(() => flashOn = !flashOn);
          },
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(7),
              elevation: 0,
              backgroundColor: Colors.white.withOpacity(0.2),
              shape: const CircleBorder()),
          child: Icon(
            Icons.flash_on,
            color: flashOn ? Colors.yellow : Colors.white,
          ),
        ),
      ],
    );
  }
}
