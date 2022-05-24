import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter_parsed_text/flutter_parsed_text.dart';
import 'package:url_launcher/url_launcher.dart' show  launch;
class QrScan extends StatefulWidget {
  const QrScan({Key? key}) : super(key: key);

  @override
  _QrScanState createState() => _QrScanState();
}

class _QrScanState extends State<QrScan> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? qrController;
  Barcode? barcode;

  @override
  void dispose() {
    
    qrController?.dispose();
    super.dispose();
  }
  @override
  void reassemble() async {
    
    super.reassemble();
    if(Platform.isAndroid){
      await qrController!.pauseCamera();
    }
    qrController!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          buildQrView(context),
          Positioned(bottom: 10,child: buildResult()),
        ],
      ),
    );
  }
  Widget buildResult(){
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white24,
      ),
      child: ParsedText(
        selectable: true,
        alignment: TextAlign.start,
        maxLines: 1,
        text:
        barcode != null ? 'Result : ${barcode!.code}' :'Scan a code',
        parse: <MatchText>[
          MatchText(
              type: ParsedType.URL,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                              ),
              onTap: (url) async {
                url = barcode!.code!;
                await launch(url);
              }),

        ],
      ),
    );
  }



  Widget buildQrView(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: onQRViedCreated,
      overlay: QrScannerOverlayShape(
        borderRadius: 10,
        borderLength: 20,
        borderWidth: 10,
        cutOutSize: MediaQuery.of(context).size.width * 0.8,
        borderColor: Theme.of(context).primaryColor,
      ),
    );
  }

  void onQRViedCreated(QRViewController qrController) {
    setState(() {
      this.qrController = qrController;
    });

    qrController.scannedDataStream.listen((barcode) { setState(() {
      this.barcode=barcode;
    });});

  }
}
