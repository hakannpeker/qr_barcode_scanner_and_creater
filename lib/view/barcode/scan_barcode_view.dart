import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import '../../core/extension/string_extension.dart';
import '../../core/init/lang/locale_keys.g.dart';

import '../../product/constants/enum/qr_keys.dart';
import '../../product/widget/button_widget.dart';

class ScanBarcodeView extends StatefulWidget {
  const ScanBarcodeView({Key? key}) : super(key: key);

  @override
  State<ScanBarcodeView> createState() => _ScanBarcodeViewState();
}

class _ScanBarcodeViewState extends State<ScanBarcodeView> {
  String barcode = "Unknown";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(LocaleKeys.barcode_result.locale),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(barcode),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            ButtonWidget(
                onPressed: () {
                  scanBarcode();
                },
                text: LocaleKeys.barcode_scan.locale)
          ],
        ),
      ),
    );
  }

  Future<void> scanBarcode() async {
    try {
      final barcode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        "Cancel",
        true,
        ScanMode.BARCODE,
      );
      if (!mounted) return;

      setState(() {
        this.barcode = barcode;
      });
    } on PlatformException {
      barcode = 'Failed to get platform version';
    }
  }
}
