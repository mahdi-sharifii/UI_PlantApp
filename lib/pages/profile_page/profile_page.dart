import 'package:flutter/material.dart';
import 'package:plant_app/pages/profile_page/email_text.dart';
import 'package:plant_app/pages/profile_page/my_list_tiles.dart';
import 'package:plant_app/pages/profile_page/name_widget.dart';
import 'package:plant_app/pages/profile_page/profile_image.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _FaworitePageState();
}

class _FaworitePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Column(children: [
          ProfileImage(themeData: themeData),
          NameWidget(themeData: themeData),
          const EmailText(),
          const MyListTiles()
        ]),
      ),
    );
  }
}
