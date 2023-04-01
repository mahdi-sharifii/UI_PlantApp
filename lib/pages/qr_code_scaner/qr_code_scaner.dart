import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:plant_app/pages/qr_code_scaner/camera_page.dart';

import 'my_appbar.dart';

class QrCodeScaner extends StatefulWidget {
  const QrCodeScaner({
    super.key,
    required this.size,
    required this.themeData,
  });
  final Size size;
  final ThemeData themeData;
  @override
  State<QrCodeScaner> createState() => _QrCodeScanerState();
}

class _QrCodeScanerState extends State<QrCodeScaner> {
  @override
  void initState() {
    super.initState();
    Permission.camera.request();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    // final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 90,
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: MyAppBar(
            themeData: themeData,
          ),
        ),
        body: Center(
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(PageTransition(
                  child: const QrCode(), type: PageTransitionType.fade));
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: widget.size.width * 0.5,
                  child: Image.asset("assets/images/code-scan.png"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "برای‌اسکن‌گیاهان,کلیک‌ کنید",
                    style: widget.themeData.textTheme.titleLarge,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
