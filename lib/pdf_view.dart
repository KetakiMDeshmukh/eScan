import 'dart:io';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
//import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

class PDFView extends StatefulWidget {
  final String filePath;
  const PDFView({Key? key, required this.filePath}) : super(key: key);

  @override
  _PDFViewState createState() => _PDFViewState();
}

class _PDFViewState extends State<PDFView> {
  bool _isLoading = true;
  var document;

  /*@override
  void initState() {
    super.initState();
    loadDocument();
  }*/

  /*loadDocument() async {
    document = await PDFDocument.fromFile(widget.file);
    setState(() => _isLoading = false);
  }*/


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "PDF View"
        ),
      ),
      body: Center(
        child: SfPdfViewer.file(
            File(widget.filePath)),
      ),
    );
  }
}
