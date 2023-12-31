import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pak_saaf/common/scaffold_app_bar.dart';
import 'package:pak_saaf/common/toast_message.dart';
import 'package:pak_saaf/models/userModel.dart';
import 'package:pak_saaf/string_en.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../../utils/global.dart';
import '../../utils/progress_dialog.dart';
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
    super.dispose();
    controller?.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    result = null;
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        if (result!.code!.isNotEmpty){
         // points += int.parse(result!.code!);
          controller.stopCamera();

          controller.dispose();
          validateQR(result!.code!);
          /*userName = result!.code!;
          Navigator.of(context).pushReplacement(bottomToTop(MainHomeScreen()));
          dispose();*/

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

  void validateQR(String result) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c)
        {
          return ProgressDialog(message: "Processing, Please wait...",);
        }
    );
    DatabaseReference qrRef = FirebaseDatabase.instance
        .reference()
        .child('check');

    DatabaseReference userRef = FirebaseDatabase.instance
        .reference()
        .child('users')
        .child(currentFirebaseUser!.uid);

    DataSnapshot snapshot = (await qrRef.once()).snapshot; // Access the snapshot property

    if (snapshot.value != null) {
      qrModelCurrentInfo = QRModel.fromSnapshot(snapshot);
      qrKeyString = qrModelCurrentInfo!.key!;
      qrValue = qrModelCurrentInfo!.value!;

    }
    if (result.toString().toLowerCase() == qrKeyString.toLowerCase()){
      if(qrValue == 0){
        Fluttertoast.showToast(msg: "QR code is expired, please scan again");
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return MainHomeScreen();
        }));
      }
      else{
        points+=qrModelCurrentInfo!.value!;
        qrRef.update({'Score': 0}).then((_) {
          // Successfully updated the points
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return MainHomeScreen();
          }));
        }).catchError((error) {
          print("Error updating points: $error");
          toastMessage(context, "Error updating points");
          Navigator.pop(context);
        });

        userRef.update({'points': points}).then((_) {
        }).catchError((error) {
          print("Error updating points: $error");
          toastMessage(context, "Error updating points");
          Navigator.pop(context);
        });


      }

      }
    else{
      Fluttertoast.showToast(msg: "QR code is expired, please scan again");
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return MainHomeScreen();
      }));
    }
}
}



