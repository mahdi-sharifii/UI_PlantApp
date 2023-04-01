import 'package:flutter/material.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/pages/main-wrapper/main_wrapper.dart';

class MyFloating extends StatefulWidget {
  const MyFloating({
    super.key,
    required this.themeData,
    required this.size,
    required this.plant,
  });
  final ThemeData themeData;
  final Size size;
  final Plant plant;

  @override
  State<MyFloating> createState() => _MyFloatingState();
}

class _MyFloatingState extends State<MyFloating> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size.width * 0.96,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                indexNavBar = 2;
                pageController.animateToPage(2,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut);
              });
              final NavigatorState navigator = Navigator.of(context);
              navigator.pop();
            },
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(12),
                elevation: 0,
                backgroundColor: widget.themeData.primaryColor.withOpacity(0.7),
                shape: const CircleBorder()),
            child: Icon(
              widget.plant.isSelected
                  ? Icons.shopping_cart
                  : Icons
                      .shopping_cart_outlined, // : Icons.favorite_border_outlined,
              color: Colors.white,
              size: 35,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: SizedBox(
                width: widget.size.width * 0.7,
                height: widget.size.height * 0.07,
                child: ElevatedButton(
                  onPressed: () {
                    widget.plant.isSelected = !widget.plant.isSelected;
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        duration: Duration(seconds: 2),
                        content: Text(
                          "سبد خرید به روز شد",
                          textDirection: TextDirection.rtl,
                        )));
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: widget.plant.isSelected
                          ? widget.themeData.primaryColor.withOpacity(0.4)
                          : widget.themeData.primaryColor),
                  child: Text(
                    widget.plant.isSelected
                        ? "اضافه شده!"
                        : "افزودن به سبد خرید",
                    style: const TextStyle(fontFamily: "Lalezar", fontSize: 22),
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
