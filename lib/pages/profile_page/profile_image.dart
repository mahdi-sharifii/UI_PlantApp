import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: themeData.primaryColor.withOpacity(0.8),
      ),
      child: ClipOval(
        child: Image.asset(
          "assets/images/profile.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
