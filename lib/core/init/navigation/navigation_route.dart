import 'package:flutter/material.dart';

import '../../../product/constants/navigation/navigation_constants.dart';
import '../../../view/barcode/barcode_page.dart';
import '../../../view/barcode/create_barcode_view.dart';
import '../../../view/barcode/scan_barcode_view.dart';
import '../../../view/barcode_or_qr.dart';
import '../../../view/qr/create_or_scan_page.dart';
import '../../../view/qr/qr_create_view.dart';
import '../../../view/qr/qr_scan_view.dart';

class NavigationRoute {
  static NavigationRoute? _instance;
  static NavigationRoute get instance {
    _instance ??= NavigationRoute._init();
    return _instance!;
  }

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.BARCODE_OR_QR:
        return normalNavigate(const BarcodeOrQR());
      case NavigationConstants.CREATE_OR_SCAN:
        return normalNavigate(const QRPage());
      case NavigationConstants.QR_CREATE:
        return normalNavigate(const QRCreateView());
      case NavigationConstants.QR_SCAN:
        return normalNavigate(const QRScanView());
      case NavigationConstants.BARCODE_PAGE:
        return normalNavigate(const BarcodePage());
      case NavigationConstants.CREATE_BARCODE:
        return normalNavigate(const CreateBarcodeView());
      case NavigationConstants.SCAN_BARCODE:
        return normalNavigate(const ScanBarcodeView());
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Text("Not Found"),
          ),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
