enum QRKeys {
  scan("Scan QR Code"),
  create("Create QR Code"),
  startQR("Start QR Scan"),
  result("Scan Result"),
  enterData("Enter the data");

  final String value;
  const QRKeys(this.value);
}
