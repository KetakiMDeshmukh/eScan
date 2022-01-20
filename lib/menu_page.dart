import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            child: Text(
              'About Us',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
            ),
          ),
          ListTile(
            leading: Icon(Icons.circle_sharp),
            title: Text('Ketaki',
              style: TextStyle(fontSize: 20,),),
          ),
          ListTile(
            leading: Icon(Icons.circle_sharp),
            title: Text('Anuraag',
              style: TextStyle(fontSize: 20,),),
          ),
          ListTile(
            leading: Icon(Icons.circle_sharp),
            title: Text('Tanmay',
              style: TextStyle(fontSize: 20,),),
          ),
          ListTile(
            leading: Icon(Icons.circle_sharp),
            title: Text('Siddhant',
              style: TextStyle(fontSize: 20,),),
          ),
        ],
      ),
    );
  }
}
