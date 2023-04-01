import 'package:flutter/material.dart';

class MyListTiles extends StatelessWidget {
  const MyListTiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> textTitle = <String>[
      "پروفایل من",
      "تنظیمات",
      "اطلاع رسانی ها",
      "شبکه های اجتماعی",
      "خروج"
    ];
    final List<IconData> iconTitle = <IconData>[
      Icons.person,
      Icons.settings,
      Icons.notifications,
      Icons.share,
      Icons.logout
    ];
    return Column(
      children: List.generate(5, (index) {
        return Padding(
          padding: const EdgeInsets.only(top: 16),
          child: ListTile(
            //  icon Back
            leading: const Icon(Icons.arrow_back_ios),

            // Right ListTile
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // title text
                Text(
                  textTitle[index],
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Yekan"),
                ),
                // title icon
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Icon(
                    iconTitle[index],
                    size: 30,
                  ),
                )
              ],
            ),
            // show SnackBar
            onTap: () => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                width: 130,
                behavior: SnackBarBehavior.floating,
                duration: const Duration(seconds: 2),
                content: Center(
                  child: Text(
                    textTitle[index],
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
