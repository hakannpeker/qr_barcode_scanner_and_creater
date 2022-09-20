import 'package:flutter/material.dart';
import '../../core/extension/string_extension.dart';
import '../../core/init/lang/locale_keys.g.dart';

import '../../core/init/navigation/navigation_service.dart';
import '../../product/constants/enum/barcode_keys.dart';
import '../../product/constants/navigation/navigation_constants.dart';
import '../../product/widget/button_widget.dart';

class BarcodePage extends StatelessWidget {
  const BarcodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonWidget(
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) => const CreateBarcodeView(),
                // ));
                NavigationService.instance.navigateToPage(path: NavigationConstants.CREATE_BARCODE);
              },
              text: LocaleKeys.barcode_create.locale,
            ),
            ButtonWidget(
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) => const ScanBarcodeView(),
                // ));
                NavigationService.instance.navigateToPage(path: NavigationConstants.SCAN_BARCODE);

              },
              text: LocaleKeys.barcode_scan.locale
            ),
          ],
        ),
      ),
    );
  }
}

