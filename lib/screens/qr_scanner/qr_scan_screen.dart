
import 'package:flutter/material.dart';
import 'package:pak_saaf/common/scaffold_app_bar.dart';
import 'package:pak_saaf/string_en.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../common/custom_animation.dart';
import '../../utils/global.dart';
import '../main_bottom_nav/main_home_screen.dart';

class QRScanScreen extends StatefulWidget {
  @override
  State<QRScanScreen> createState() => _QRScanScreenState();
}

class _QRScanScreenState extends State<QRScanScreen> {

  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    result = null;
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        if (result!.code!.isNotEmpty){
          points += int.parse(result!.code!);
          Navigator.of(context).pushReplacement(bottomToTop(MainHomeScreen()));
          dispose();

        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: scaffoldAppBar(context, Strings.qr_scanner),
      resizeToAvoidBottomInset: true,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: (result != null)
                  ? Text(
                'Result: ${result!.code}',
                style: TextStyle(fontSize: 20),
              )
                  : Text(
                'Scan a QR code',
                style: TextStyle(fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}



