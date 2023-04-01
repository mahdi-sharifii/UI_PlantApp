import 'package:flutter/material.dart';
import 'package:plant_app/models/plant.dart';

import 'package:plant_app/ui/empty_list_ui.dart';
import 'package:plant_app/ui/my_listviwe.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  final List<Plant> plantList = [];

  @override
  void initState() {
    super.initState();
    getFavourite();
  }

  List<Plant> favouriteList = [];

  void getFavourite() {
    favouriteList.clear();

    for (Plant i in Plant.plantList) {
      if (i.isFavorated) {
        favouriteList.add(i);
      }
      favouriteList.toSet().toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: favouriteList.isNotEmpty
          ? MyListViwe(
              height: size.height,
              plantList: favouriteList,
              size: size,
              themeData: themeData,
              newState: () {
                setState(() => getFavourite());
              })
          : const EmptyListUI(
              text: "به چیزی علاقه ندارید",
              src: "assets/images/favorited.png",
            ),
    );
  }
}
