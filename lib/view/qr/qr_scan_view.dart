import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import '../../core/extension/string_extension.dart';
import '../../core/init/lang/locale_keys.g.dart';

import '../../product/constants/enum/qr_keys.dart';
import 'create_or_scan_page.dart';

class QRScanView extends StatefulWidget {
  const QRScanView({Key? key}) : super(key: key);

  @override
  State<QRScanView> createState() => _QRScanViewState();
}

class _QRScanViewState extends State<QRScanView> {
  String qrCode = "Unknown";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(LocaleKeys.qr_result.locale),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(qrCode),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            ButtonWidget(
                onPressed: () {
                  scanQRCode();
                },
                text: LocaleKeys.qr_scan.locale)
          ],
        ),
      ),
    );
  }

  Future<void> scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        "Cancel",
        true,
        ScanMode.QR,
      );
      if (!mounted) return;

      setState(() {
        this.qrCode = qrCode;
      });
    } on PlatformException {
      qrCode = 'Failed to get platform version';
    }
  }
}
