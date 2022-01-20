import 'package:e_scan/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import 'actions_screen.dart';
import 'menu_page.dart';
import 'constants.dart';
import 'camera_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.camerasHP}) : super(key: key);

  final List<CameraDescription> camerasHP;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentTab = 0;
  final List<Widget> screens = [
    Home(),
    ActionScreen(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Siddhant's Part
      //---------------
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text(
          titleName,
          style: TextStyle(fontSize: 25.0),
        ),
        actions: [
          Container(
            child: const Icon(Icons.filter_alt_sharp),
            padding: EdgeInsets.only(right: 10.0),
          ),
        ],
      ),
      //---------------

      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: const Icon(
          CupertinoIcons.camera_viewfinder,
          size: 35.0,
        ),
        //TODO add action on pressing camera button
        onPressed: () {
          print("camera page");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CameraScreen(cameras: widget.camerasHP),
              )
          );
        },
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
