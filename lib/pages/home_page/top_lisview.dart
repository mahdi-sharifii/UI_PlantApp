import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'package:plant_app/models/plant.dart';
import 'package:plant_app/pages/show_post/show_post.dart';

class TopListView extends StatefulWidget {
  const TopListView({
    super.key,
    required List<Plant> plantList,
    required this.size,
    required this.themeData,
  }) : _plantList = plantList;

  final List<Plant> _plantList;
  final Size size;
  final ThemeData themeData;

  @override
  State<TopListView> createState() => _TopListViewState();
}

class _TopListViewState extends State<TopListView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size.width,
      height: widget.size.height * 0.4,
      child: ListView.builder(
        itemCount: widget._plantList.length,
        reverse: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final Plant plantIndex = widget._plantList[index];
          return InkWell(
            onTap: () async {
              await Navigator.of(context).push(PageTransition(
                  child: ShowPost(id: plantIndex.plantId),
                  type: PageTransitionType.leftToRight));
              setState(() {});
            },
            child: Container(
                margin: const EdgeInsets.all(20),
                width: widget.size.width * 0.55,
                height: widget.size.height * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: widget.themeData.primaryColor.withOpacity(0.8),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      bottom: 20, left: 20, top: 9, right: 9),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              plantIndex.isFavorated = !plantIndex.isFavorated;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: const CircleBorder()),
                          child: Icon(
                            plantIndex.isFavorated
                                ? Icons.favorite_rounded
                                : Icons.favorite_border_outlined,
                            color: widget.themeData.primaryColor,
                            size: 20,
                          ),
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          width: widget.size.width * 0.25,
                          child: Image.asset(plantIndex.imageURL),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: SizedBox(
                          height: 27,
                          child: Chip(
                            label: Text("\$${plantIndex.price}"),
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                plantIndex.category,
                                style: widget.themeData.textTheme.displayMedium,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  plantIndex.plantName,
                                  style: widget.themeData.textTheme.labelSmall,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          );
        },
      ),
    );
  }
}
