import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  const Category({
    super.key,
    required this.size,
    required this.themeData,
  });
  final Size size;
  final ThemeData themeData;

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<String> categoryText = <String>[
    "|پیشنهادی|",
    "|آپارتمانی|",
    "|محل‌کار|",
    "|گل‌باغچه‌ای|",
  ];
  int categoryIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: widget.size.width * 0.9,
      child: ListView.separated(
          reverse: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return TextButton(
              onPressed: () {
                setState(() {
                  categoryIndex = index;
                });
              },
              child: Text(
                categoryText[index],
                style: categoryIndex == index
                    ? widget.themeData.textTheme.displaySmall
                    : widget.themeData.textTheme.bodyMedium,
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                width: 8,
              ),
          itemCount: categoryText.length),
    );
  }
}
