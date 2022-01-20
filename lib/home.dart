import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'pdf_view.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                    'Open File From Downloads',
                style: TextStyle(
                  fontSize: 20,
                ),),
              ),
              onPressed: () async {
                final result = await FilePicker.platform.pickFiles();
                if(result == null) return;

                final file = result.files.first;

                Navigator.push(
                  context,
                    MaterialPageRoute(
                    builder: (context) => PDFView(filePath: file.path!)
                    )
                   );
                //openFile(file);
              },
            ),
          ),
        ],
      ),
    );
  }
}

