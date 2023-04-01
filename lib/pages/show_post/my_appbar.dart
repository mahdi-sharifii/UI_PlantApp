import 'package:flutter/material.dart';
import 'package:plant_app/models/plant.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({super.key, required this.themeData, required this.plant});
  final ThemeData themeData;
  final Plant plant;
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
          onPressed: () {
            setState(() {
              widget.plant.isFavorated = !widget.plant.isFavorated;
            });
          },
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(7),
              elevation: 0,
              backgroundColor: widget.themeData.primaryColor.withOpacity(0.2),
              shape: const CircleBorder()),
          child: Icon(
            widget.plant.isFavorated ? Icons.favorite : Icons.favorite_outline,
            color: widget.themeData.primaryColor,
            size: 30,
          ),
        ),
      ],
    );
  }
}
