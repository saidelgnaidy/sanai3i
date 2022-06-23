import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sanai3i/shared/const.dart';
import 'package:sanai3i/shared/src/localization/trans.dart';
import 'package:sanai3i/shared/theme/helper.dart';
import 'package:sanai3i/shared/theme/text_theme.dart';
import 'package:sanai3i/view/profile/iconed_text.dart';
import 'package:sanai3i/view/profile/profile_pic.dart';
import 'package:sanai3i/view/widgets/custom_drop.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              KMainContainer(
                padding: const EdgeInsets.all(8).copyWith(top: KHelper.profilePicRadius + 8),
                margin: const EdgeInsets.only(top: KHelper.profilePicRadius),
                child: Column(
                  children: const [
                    KIconedText(title: 'said ahmed mohamed', icon: KHelper.person),
                    SizedBox(height: 6),
                    KIconedText(title: '+2001140230179', icon: KHelper.phone),
                    SizedBox(height: 6),
                    KIconedText(title: 'Flutter developer', icon: KHelper.services),
                    SizedBox(height: 6),
                    KIconedText(title: 'Available', icon: KHelper.available),
                  ],
                ),
              ),
              Positioned(
                top: KHelper.profilePicRadius + 8,
                right: 8,
                child: KIconButton(
                  child: const Icon(KHelper.edit),
                  onPressed: () {},
                ),
              ),
              Positioned(
                top: KHelper.profilePicRadius + 8,
                left: 8,
                child: KIconToDialog(
                  title: '',
                  tag: 'QR',
                  dialog: SingleChildScrollView(
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
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Positioned(
                top: 10,
                child: KProfilePic(),
              ),
            ],
          ),
          const SizedBox(height: 10),
          KMainContainer(
            width: Get.width,
            padding: const EdgeInsets.fromLTRB(8, 5, 8, 4),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    KIconButton(
                      child: const Icon(KHelper.delete),
                      onPressed: () {},
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Test post Body',
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: KTextStyle.of(context).body,
                  ),
                ),
                Container(
                  decoration: KHelper.of(context).outlined,
                  child: Lottie.asset('assets/animations/working.json'),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Text('2022/06/23', style: KTextStyle.of(context).body2),
                  ],
                ),
              ],
            ),
          )
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
