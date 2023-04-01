import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/models/plant.dart';

import 'package:plant_app/pages/show_post/show_post.dart';
import 'package:plant_app/ui/ui_helper.dart';

class MyListViwe extends StatefulWidget {
  const MyListViwe(
      {super.key,
      required List<Plant> plantList,
      required this.size,
      required this.themeData,
      required this.height,
      required this.newState})
      : _plantList = plantList;

  final List<Plant> _plantList;
  final Size size;
  final ThemeData themeData;
  final double height;
  final void Function() newState;
  @override
  State<MyListViwe> createState() => _MyListViweState();
}

class _MyListViweState extends State<MyListViwe> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget._plantList.length,
        itemBuilder: (context, index) {
          final Plant plantIndex = widget._plantList[index];
          return InkWell(
            onTap: () async {
              await Navigator.of(context).push(PageTransition(
                  child: ShowPost(id: plantIndex.plantId),
                  type: PageTransitionType.leftToRight));

              setState(() {});
              widget.newState();
            },
            child: Stack(children: [
              Container(
                  width: double.infinity,
                  height: widget.size.height * 0.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: widget.themeData.primaryColor.withOpacity(0.2),
                  ),
                  margin: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              "assets/images/PriceUnit-green.png",
                              width: 35,
                            ),
                            Text(
                              " ${plantIndex.price.toString().farsiNumber}",
                              style: widget.themeData.textTheme.titleLarge,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      plantIndex.category,
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        plantIndex.plantName,
                                        style: widget
                                            .themeData.textTheme.bodySmall,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 80,
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
              Positioned(
                right: 22,
                top: 20,
                bottom: 14,
                child: Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: widget.themeData.primaryColor.withOpacity(0.88)),
                ),
              ),
              Positioned(
                right: 12,
                bottom: 24,
                child: SizedBox(
                  width: 85,
                  height: 85,
                  child: Image.asset(plantIndex.imageURL),
                ),
              )
            ]),
          );
        },
      ),
    );
  }
}
