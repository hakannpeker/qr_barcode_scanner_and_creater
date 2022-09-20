import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/extension/string_extension.dart';
import '../core/init/lang/locale_keys.g.dart';
import '../core/init/navigation/navigation_service.dart';
import '../core/provider/change_language.dart';
import '../core/provider/change_theme.dart';
import '../product/constants/navigation/navigation_constants.dart';
import 'qr/create_or_scan_page.dart';

class BarcodeOrQR extends StatelessWidget {
  const BarcodeOrQR({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.appbar_title.locale),
        //title:  const LocaleText(text: LocaleKeys.appbar_title),
        leading: IconButton(
            onPressed: () {
              context.read<LanguageNotifier>().changeLanguage(context);
            },
            icon: const Icon(Icons.change_history)),
        actions: [
          IconButton(
              onPressed: () {
                context.read<ThemeNotifier>().changeTheme();
              },
              icon: const Icon(Icons.change_circle))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(LocaleKeys.qr_create.locale),
            ButtonWidget(
                onPressed: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) => const BarcodePage(),
                  // ));
                  NavigationService.instance.navigateToPage(path: NavigationConstants.BARCODE_PAGE);
                },
                text: "BARCODE"),
            ButtonWidget(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const QRPage()));
                },
                text: "QR")
          ],
        ),
      ),
    );
  }
}
