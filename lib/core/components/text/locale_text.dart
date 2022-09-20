import 'package:flutter/material.dart';

import '../../extension/string_extension.dart';

class LocaleText extends StatelessWidget {
  const LocaleText({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text.locale);
  }
}
