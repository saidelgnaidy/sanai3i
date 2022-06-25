import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sanai3i/shared/src/localization/trans.dart';
import 'package:sanai3i/shared/theme/colors.dart';
import 'package:sanai3i/shared/theme/text_theme.dart';

class QRCodeView extends StatelessWidget {
  const QRCodeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      child: Column(
        children: [
          Text(
            Tr.get.qr_used_for,
            style: KTextStyle.of(context).reBody,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          QrImage(
            data: FirebaseAuth.instance.currentUser!.uid,
            backgroundColor: KColors.of(context).background.withOpacity(.0),
            foregroundColor: KColors.of(context).rebANDw,
          ),
        ],
      ),
    );
  }
}

class QRScaner extends StatefulWidget {
  const QRScaner({Key? key}) : super(key: key);

  @override
  State<QRScaner> createState() => _QRScanerState();
}

class _QRScanerState extends State<QRScaner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 5,
          child: QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
          ),
        ),
        Expanded(
          flex: 1,
          child: Center(
            child: (result != null) ? Text('Barcode Type: }   Data: ${result!.code}') : const Text('Scan a code'),
          ),
        )
      ],
    );
  }
}
