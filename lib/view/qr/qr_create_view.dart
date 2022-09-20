import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/provider/change_theme.dart';
import '../../product/widget/custom_text_field.dart';

class QRCreateView extends StatefulWidget {
  const QRCreateView({Key? key}) : super(key: key);

  @override
  State<QRCreateView> createState() => _QRCreateViewState();
}

class _QRCreateViewState extends State<QRCreateView> {
  final TextEditingController qrController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BarcodeWidget(
              color: context.read<ThemeNotifier>().isLightTheme ? Colors.white : Colors.red,
              data: qrController.text,
              barcode: Barcode.qrCode(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Row(
              children: [
                Expanded(
                    child: CustomTextField(
                  controller: qrController,
                )),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: const Icon(Icons.check),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
