import 'package:flutter/material.dart';

class Pages {
  static List<Widget> of(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    List<String> imageList = <String>[
      "assets/images/plant-one.png",
      "assets/images/plant-two.png",
      "assets/images/plant-three.png"
    ];
    List<String> titelList = <String>[
      "گیاهان‌را بهتراز قبل درک کن",
      "گیاهان را بهتر نگهداری کنید",
      "با گیاهان هوای سالم تنفس کن داداش"
    ];
    List<String> disList = <String>[
      "در مورد نگهداری گل و گیاهان میتونی اطلاعات کسب کنی ",
      "به نظر من مرد عنکبوتی با تربچه یکیه",
      "جعفری از بتمن قوی تره"
    ];

    final List<Widget> listitem = List.generate(3, (i) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: size.width * 0.68,
              height: size.height * 0.4,
              child: Image.asset(imageList[i]),
            ),
          ),
          Text(
            titelList[i],
            style: themeData.textTheme.titleLarge,
          ),
          SizedBox(
            width: size.width * 0.68,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                disList[i],
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: themeData.textTheme.bodyLarge,
              ),
            ),
          ),
        ],
      );
    });
    return listitem;
  }
}
