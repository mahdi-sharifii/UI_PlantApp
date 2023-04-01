import 'package:flutter/material.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/ui/ui_helper.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({
    super.key,
    required this.size,
    required this.themeData,
    required this.plant,
    required this.textStyle,
  });

  final Size size;
  final ThemeData themeData;
  final Plant plant;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: size.height / 2,
      decoration: BoxDecoration(
        color: themeData.primaryColor.withOpacity(0.5),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.08, bottom: 14),
            child: Align(
              alignment: Alignment.topRight,
              child: Text(
                plant.plantName,
                style: textStyle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: themeData.primaryColor,
                      size: 35,
                    ),
                    Text(
                      plant.rating.toString().farsiNumber,
                      style: textStyle,
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 17),
                      child: Image.asset(
                        "assets/images/PriceUnit-green.png",
                        width: 36,
                      ),
                    ),
                    Text(
                      plant.price.toString().farsiNumber,
                      style: textStyle,
                    )
                  ],
                ),
              ],
            ),
          ),
          Text(
            plant.decription,
            textAlign: TextAlign.justify,
            textDirection: TextDirection.rtl,
            style: const TextStyle(
                height: 1.3,
                color: Colors.black87,
                fontFamily: "Yekan",
                fontSize: 22),
          )
        ]),
      ),
    );
  }
}
