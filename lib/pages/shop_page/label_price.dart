import 'package:flutter/material.dart';
import 'package:plant_app/ui/ui_helper.dart';

class LabelPrice extends StatelessWidget {
  const LabelPrice({
    super.key,
    required this.size,
    required this.allPrice,
    required this.themeData,
  });

  final Size size;
  final double allPrice;
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.9,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(height: 2, color: Colors.black45),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/images/PriceUnit-green.png",
                      width: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        allPrice.toInt().toString().farsiNumber,
                        style: themeData.textTheme.titleLarge,
                      ),
                    )
                  ],
                ),
                const Text("جمع کل",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Lalezar"))
              ],
            ),
          )
        ],
      ),
    );
  }
}
