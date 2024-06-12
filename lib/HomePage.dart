import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qrassignment/CameraBorder.dart';

// MyHomePage is a StatefulWidget that represents the main screen of the app
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String scannedValue = ""; // Holds the value of the scanned QR code
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR'); // Key for QRView
  Barcode? result; // Holds the result of the QR code scan

  // Callback function when QRView is created
  void _onQRViewCreated(QRViewController qrController) {
    qrController.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        scannedValue =
            result == null ? "" : (result!.code == null ? "" : result!.code!);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize =
        MediaQuery.of(context).size; // Get screen size for responsive UI
    return Scaffold(
      backgroundColor: const Color(0xFFF1EFE5),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: screenSize.height * 0.11),
              child: SvgPicture.asset(
                "assets/images/logo.svg",
                height: 66.0,
              ),
            ),
            Column(
              children: [
                // CameraBorder is a custom widget to display border around QR scanner
                CameraBorder(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: QRView(
                      key: qrKey,
                      onQRViewCreated: _onQRViewCreated,
                      overlay: QrScannerOverlayShape(
                          overlayColor: Colors.transparent),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Display the scanned value or a default message
                Text(
                  scannedValue == ""
                      ? "Scanned Data: No Data Scanned Yet"
                      : "Scanned Data: $scannedValue",
                  style: GoogleFonts.roboto(),
                ),
              ],
            ),
            Container(
                margin: EdgeInsets.only(top: screenSize.height * 0.06),
                width: screenSize.width * 0.78,
                child: Column(
                  children: [
                    Text(
                      "Scannen Sie den QR-Code",
                      style: GoogleFonts.roboto(
                          fontSize: 23, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Scannen Sie den QR-Code auf der Unterseite des Gateways, um die Installation fortzusetzen",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        height: 1.2,
                        fontStyle: FontStyle.italic,
                        letterSpacing: 0.1,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF898989),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
