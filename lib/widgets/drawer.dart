import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,

        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                ),

                accountName: Text("User Name", textScaleFactor: 1.2,),
                accountEmail: Text("user@email.com", textScaleFactor: 1.2),
                currentAccountPicture: CircleAvatar(
                    child: Image.asset("assets/images/bookily_logo2.jpeg")
                ),
              ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.home),
            title: Text("Home",
            textScaleFactor: 1.2),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.book),
            title: Text("Library",
              textScaleFactor: 1.2,),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.money_dollar),
            title: Text("Premium",
              textScaleFactor: 1.2,),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.profile_circled),
            title: Text("Account",
              textScaleFactor: 1.2,),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.settings),
            title: Text("Setting",
              textScaleFactor: 1.2,),
          ),



        ],

      ),
    );
  }
}
