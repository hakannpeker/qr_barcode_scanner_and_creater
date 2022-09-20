import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/provider/change_theme.dart';
import '../../product/widget/custom_text_field.dart';

class CreateBarcodeView extends StatefulWidget {
  const CreateBarcodeView({Key? key}) : super(key: key);

  @override
  State<CreateBarcodeView> createState() => _CreateBarcodeViewState();
}

class _CreateBarcodeViewState extends State<CreateBarcodeView> {
  final TextEditingController barcodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: BarcodeWidget(
                color: context.read<ThemeNotifier>().isLightTheme ? Colors.white : Colors.red,
                data: barcodeController.text,
                barcode: Barcode.code128(),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Row(
              children: [
                Expanded(child: CustomTextField(controller: barcodeController)),
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
