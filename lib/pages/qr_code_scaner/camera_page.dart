import 'dart:io';

import 'package:flutter/material.dart';
import 'package:plant_app/pages/qr_code_scaner/my_appbar.dart';
import 'package:plant_app/pages/qr_code_scaner/qr_overlay.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class QrCode extends StatefulWidget {
  const QrCode({super.key});

  @override
  State<QrCode> createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  final GlobalKey qrKey = GlobalKey();
  Barcode? result;
  QRViewController? controller;
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
          ),
          const QRScannerOverlay(
            overlayColor: Colors.black38,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 35, left: 12, right: 12),
            child: Align(
              alignment: Alignment.topCenter,
              child: MyAppBarCamera(),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(scanData.format.formatName.toString())));
      if (scanData.format.formatName.toString() == "QR_CODE") {
        launchUrl(Uri.parse(scanData.code!));
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
