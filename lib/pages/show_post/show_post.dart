import 'package:flutter/material.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/pages/show_post/bottom_container.dart';
import 'package:plant_app/pages/show_post/floating_action_button.dart';
import 'package:plant_app/pages/show_post/my_appbar.dart';
import 'package:plant_app/pages/show_post/specifications_and_image.dart';

class ShowPost extends StatefulWidget {
  const ShowPost({
    super.key,
    required this.id,
  });
  final int id;
  @override
  State<ShowPost> createState() => _ShowPostState();
}

class _ShowPostState extends State<ShowPost> {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    final Plant plant =
        Plant.plantList.firstWhere((e) => e.plantId == widget.id);

    TextStyle textStyle = TextStyle(
        color: themeData.primaryColor,
        fontSize: 30,
        fontFamily: "Lalezar",
        fontWeight: FontWeight.bold);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: MyAppBar(
          plant: plant,
          themeData: themeData,
        ),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SpecificationsAndImage(
                size: size, plant: plant, themeData: themeData),
            BottomContainer(
                size: size,
                themeData: themeData,
                plant: plant,
                textStyle: textStyle)
          ],
        ),
      ),
      floatingActionButton: MyFloating(
        plant: plant,
        size: size,
        themeData: themeData,
      ),
    );
  }
}
