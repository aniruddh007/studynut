import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewer extends StatelessWidget {
  const PdfViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('E - Book' , style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.grey,
        ),
        body: SfPdfViewer.asset('lib/assets/pdf/dbms.pdf'),
      ),
    );
  }
}