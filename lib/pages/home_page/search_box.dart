import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
    required this.size,
    required this.themeData,
  });
  final Size size;
  final ThemeData themeData;
  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();

    return Container(
      width: size.width * 0.9,
      height: size.height * 0.07,
      decoration: BoxDecoration(
          color: themeData.primaryColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(24)),
      child: Row(
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.mic)),
          Expanded(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextField(
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: "جستجو ..."),
                controller: textEditingController,
              ),
            ),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
    );
  }
}
