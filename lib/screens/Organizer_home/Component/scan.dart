import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class ScanTopImage extends StatelessWidget {
  const ScanTopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Text(
          "Scan Barcode".toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: kPrimaryColor,

          ),
        ),
        SizedBox(height: defaultPadding),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: SvgPicture.asset("assets/icons/scan.svg"),
            ),
            const Spacer(),
          ],
        ),
        SizedBox(height: defaultPadding),
      ],
    );
  }
}



class ScanQr extends StatefulWidget {
  const ScanQr({super.key});

  @override
  State<ScanQr> createState() => _ScanQrState();
}

class _ScanQrState extends State<ScanQr> {
  @override
  Future<void> scanBarcode() async {
    String barcodeScanResult = await FlutterBarcodeScanner.scanBarcode(
      "#ff6666", // Color for the scan button
      "Cancel",   // Text for the cancel button
      true,       // Show flash icon
      ScanMode.BARCODE, // Specify the scan mode (barcode, QR code, etc.)
    );

    // print("Scanned Barcode: $barcodeScanResult");

    Fluttertoast.showToast(
      msg: "Scanned Barcode: $barcodeScanResult",
    );
  }


  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          const ScanTopImage(),
          Container(
            width: 200,
            child: ElevatedButton(
              onPressed: () => scanBarcode(),
              child: Text('Scan Barcode'),
            ),
          ),
        ],
      ),
    );
  }
}
