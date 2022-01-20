import 'dart:io';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class image_display extends StatefulWidget {
  final List<File> listOfImages;
  const image_display({Key? key, required this.listOfImages}) : super(key: key);

  @override
  _image_displayState createState() => _image_displayState(listOfImages);
}

class _image_displayState extends State<image_display> {
  var images;
  var listOfpdfs;
  final pdf = pw.Document();
  var fileName = "test";

  _image_displayState(_images){images = _images;}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Photos"),
      ),
      body: ListView.builder(
        itemCount: images.length,
        itemBuilder: (BuildContext context, int index){
          return Container(
              height: 400,
              width: double.infinity,
              margin: EdgeInsets.all(8),
              child: Image.file(
                images[index],
                fit: BoxFit.cover,
              )
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.arrow_forward,),
        onPressed: (){
          if (images.isEmpty) return;
          createPDF();
          showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Container(
                height: MediaQuery.of(context).size.height * 0.75,
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                          'Enter name for the pdf : ',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(
                        onChanged: (text){
                          fileName = text;
                        },
                        onEditingComplete: (){
                          print(fileName);
                          savePDF();
                          Navigator.of(context).popUntil((route) => route.isFirst);
                        },
                        showCursor: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          suffixText: ".pdf"
                        ),
                      ),
                    )
                    ],
                  ),
                );
                },
          );
          }

      ),
    );
  }
  createPDF() async{
    for (File f in images)
      createPDFPage(f);
  }
  createPDFPage(_image) async{
    final image = pw.MemoryImage(_image.readAsBytesSync());

    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.undefined,
        build: (pw.Context context){
          return pw.Center(child: pw.Image(image));
        }));
  }

  savePDF() async{
    try {
      Directory dir = Directory('/storage/emulated/0/Download');
      final file = File('${dir.path}/${fileName}.pdf');
      await file.writeAsBytes(await pdf.save());
      showPrintedMessage('success', 'savedToDocument');
    }
    catch (e){
      showPrintedMessage('error',e.toString());
    }
  }
  showPrintedMessage(String title, String msg){
    print(msg);
  }
}
/*
GestureDetector(
onTap: () {
if (capturedImages.isEmpty) return;
Navigator.push(
context,
MaterialPageRoute(
builder: (context) => image_display(listOfImages: capturedImages)
)
);
},
child: CircleAvatar(
child: Icon(
Icons.arrow_forward,
color: Colors.lightBlueAccent,
),
),
),*/