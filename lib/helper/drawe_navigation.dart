import 'package:demo/screen/catagoeries.dart';
import 'package:demo/screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerNavigation extends StatefulWidget {
  const DrawerNavigation({ Key? key }) : super(key: key);

  @override
  _DrawerNavigationState createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child:ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(accountName: Text('Sahil Mujawar'),
                                     accountEmail: Text('sahil@gmail.com'),
                                     decoration: BoxDecoration(color: Colors.blue),
                                    ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Home'),
                    onTap: ()=>Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context)=>HomeScreen())),
                  ),
                  ListTile(
                    leading: Icon(Icons.view_list),
                    title: Text('Catagoeries'),
                    onTap: ()=>Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context)=>CategoriesScreen())),
                  ),
          ],

        ) ,
      ),
    );
  }
}