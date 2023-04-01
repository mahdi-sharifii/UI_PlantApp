import 'package:flutter/material.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/pages/home_page/category.dart';
import 'package:plant_app/pages/home_page/search_box.dart';
import 'package:plant_app/ui/my_listviwe.dart';
import 'package:plant_app/pages/home_page/text_new_plant.dart';
import 'package:plant_app/pages/home_page/top_lisview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Plant> _plantList = Plant.plantList;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SearchBox(size: size, themeData: themeData),
          Category(size: size, themeData: themeData),
          TopListView(plantList: _plantList, size: size, themeData: themeData),
          const TextNewPlant(),
          MyListViwe(
            height: size.height * 0.4,
            plantList: _plantList,
            size: size,
            themeData: themeData,
            newState: () {},
          )
        ],
      ),
    );
  }
}
