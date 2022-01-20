import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_file_manager/flutter_file_manager.dart';
import 'package:path_provider_ex/path_provider_ex.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          ElevatedButton(
            child: Text('Open file'),
            onPressed: () async {
              final result = await FilePicker.platform.pickFiles();
              if(result == null) return;

              final file = result.files.first;
              openFile(file);
            },
          ),
        ],
      ),
    );
  }
}

