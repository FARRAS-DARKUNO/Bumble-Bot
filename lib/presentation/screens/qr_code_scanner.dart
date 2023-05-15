import 'dart:io';

import 'package:bumble_bot/presentation/global/colors.dart';
import 'package:bumble_bot/presentation/global/fonts.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_custom/persistent-tab-view.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../widgets/button/back_button.dart';
import 'detail_coint.dart';

class QRCodeScanner extends StatefulWidget {
  const QRCodeScanner({Key? key}) : super(key: key);

  @override
  State<QRCodeScanner> createState() => _QRCodeScannerState();
}

class _QRCodeScannerState extends State<QRCodeScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

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
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(),
          ),
          const Expanded(
            flex: 1,
            child: BackButtonCustome(),
          ),
          Expanded(
            flex: 1,
            child: Center(
                child: Text("Scanne QR Code Wallet", style: h3(cPremier))),
          ),
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: (result != null)
                  ? Text('The scanne was successful', style: h3(cBlack))
                  : Text('Scan a code', style: h3(cBlack)),
            ),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    controller.scannedDataStream.listen((scanData) async {
      if (scanData.format == BarcodeFormat.qrcode && result == null) {
        setState(() {
          goNext(context, scanData.code ?? '');
          result = scanData;
        });
      } else {}
      // setState(() {
      //   result = scanData;
      // });
    });
  }

  goNext(BuildContext context, String result) async {
    await pushNewScreen(
      context,
      screen: DetailCoint(resultScanne: result),
      withNavBar: true, // OPTIONAL VALUE. True by default.
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
