import 'package:flutter/material.dart';
import '../../core/extension/string_extension.dart';
import '../../core/init/lang/locale_keys.g.dart';

import '../../core/init/navigation/navigation_service.dart';
import '../../product/constants/navigation/navigation_constants.dart';

class QRPage extends StatelessWidget {
  const QRPage({Key? key}) : super(key: key);

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
                //   builder: (context) => const QRCreateView(),
                // ));
                NavigationService.instance.navigateToPage(path: NavigationConstants.QR_CREATE);
              },
              
              text: LocaleKeys.qr_create.locale,
            ),
            ButtonWidget(
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) => QRScanView(),
                // ));
                NavigationService.instance.navigateToPage(path: NavigationConstants.QR_SCAN);
              },
              text: LocaleKeys.qr_scan.locale,
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);
  final VoidCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(shape: const StadiumBorder(), backgroundColor: Theme.of(context).backgroundColor),
      child: Text(text),
    );
  }
}
