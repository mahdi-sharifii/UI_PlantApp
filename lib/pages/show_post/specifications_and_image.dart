import 'package:flutter/material.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/ui/ui_helper.dart';

class SpecificationsAndImage extends StatelessWidget {
  const SpecificationsAndImage({
    super.key,
    required this.size,
    required this.plant,
    required this.themeData,
  });

  final Size size;
  final Plant plant;
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        height: size.height * 0.47,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 250,
              height: 350,
              child: Image.asset(plant.imageURL),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "اندازه‌گیاه",
                    style: themeData.textTheme.displayLarge,
                  ),
                  Text(
                    plant.size,
                    style: themeData.textTheme.displaySmall,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "رطوبت‌هوا",
                    style: themeData.textTheme.displayLarge,
                  ),
                  Text(
                    plant.humidity.toString().farsiNumber,
                    style: themeData.textTheme.displaySmall,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "دمای‌نگهداری",
                    style: themeData.textTheme.displayLarge,
                  ),
                  Text(
                    plant.temperature.farsiNumber,
                    style: themeData.textTheme.displaySmall,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
