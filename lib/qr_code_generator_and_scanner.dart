import 'package:flutter/material.dart';
import 'dart:io';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';


class First extends StatefulWidget {
  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  var code = '';
  File? file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [

              Padding(
                padding: EdgeInsets.all(35),
                child: Container(
                  decoration: BoxDecoration(border: Border.all()),
                  child: TextFormField(
                    controller: title,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: ' Code ',
                    ),
                  ),
                ),
              ),
              MaterialButton(
                color: Colors.indigo,
                onPressed: () {
                  setState(() {
                    code = title.text;
                  });
                },
                child: Text(
                  "Create",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              code == ''
                  ? Text('')
                  : BarcodeWidget(
                barcode: Barcode.qrCode(
                  errorCorrectLevel: BarcodeQRCorrectionLevel.high,
                ),
                data: '$code',
                width: 200,
                height: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Second extends StatefulWidget {
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  String? _qrInfo = 'Scan a QR/Bar code';
  bool camState = false;

  qrCallback(String? code) {
    setState(() {
      camState = false;
      _qrInfo = code;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      camState = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (camState == true) {
            setState(() {
              camState = false;
            });
          } else {
            setState(() {
              camState = true;
            });
          }
        },
        child: Icon(Icons.camera),
      ),
      body: camState
          ? Center(
        child: SizedBox(
          height: 1000,
          width: 500,
          child: QRBarScannerCamera(
            onError: (context, error) => Text(
              error.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red),
            ),
            qrCodeCallback: (code) {
              qrCallback(code);
            },
          ),
        ),
      )
          : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Code :" + _qrInfo!,
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class qrCode extends StatefulWidget {
  const qrCode({Key? key}) : super(key: key);

  @override
  State<qrCode> createState() => _qrCodeState();
}

class _qrCodeState extends State<qrCode> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo[900],
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.qr_code,
                  size: 40,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.qr_code_scanner,
                  size: 40,
                ),
              ),
            ],
          ),
          title: Text(
            '  QR / Barcode Scanner',
          ),
        ),
        body: TabBarView(
          children: [
            First(),
            Second(),
          ],
        ),
      ),
    );
  }
}

