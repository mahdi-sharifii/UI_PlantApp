import 'package:flutter/material.dart';
import 'package:plant_app/models/plant.dart';

import 'package:plant_app/pages/shop_page/label_price.dart';
import 'package:plant_app/ui/empty_list_ui.dart';
import 'package:plant_app/ui/my_listviwe.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  void initState() {
    super.initState();
    getSelected();
  }

  List<Plant> slectedList = [];
  double allPrice = 0;

  void getSelected() {
    slectedList.clear();
    allPrice = 0;
    for (Plant i in Plant.plantList) {
      if (i.isSelected) {
        slectedList.add(i);
        allPrice += i.price;
      }
      slectedList.toSet().toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: slectedList.isNotEmpty
          ? MyListViwe(
              height: size.height,
              plantList: slectedList,
              size: size,
              themeData: themeData,
              newState: () {
                setState(() => getSelected());
              },
            )
          : const EmptyListUI(
              text: "سبد خرید شما خالی است",
              src: "assets/images/add-cart.png",
            ),
      floatingActionButton: slectedList.isNotEmpty
          ? LabelPrice(size: size, allPrice: allPrice, themeData: themeData)
          : null,
    );
  }
}
