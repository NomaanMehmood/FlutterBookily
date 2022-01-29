import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterui/utils/routes.dart';
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
            onTap: () => moveToHome(context),
            title: Text("Home",
                textScaleFactor: 1.2),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.book),
            onTap: () => moveToLibrary(context),
            title: Text("Library",
              textScaleFactor: 1.2,),
          ),

          ListTile(
            leading: Icon(CupertinoIcons.profile_circled),
            onTap: () => moveToAccount(context),
            title: Text("Account",
              textScaleFactor: 1.2,),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.settings),
            title: Text("Setting",
              textScaleFactor: 1.2,),
          ),
          SizedBox(height:320),
          ListTile(
            leading: Icon(CupertinoIcons.arrow_left_square_fill),
            onTap: () => moveToLogin(context),
            title: Text("LogOut",
              textScaleFactor: 1.2,),
          ),


        ],

      ),
    );
  }

  moveToLibrary(BuildContext context) {
    Navigator.pushNamed(context, MyRoutes.libraryRoute);
  }

  moveToHome(BuildContext context) {
    Navigator.pushNamed(context, MyRoutes.homeRoute);
  }
  moveToAccount(BuildContext context) {
    Navigator.pushNamed(context, MyRoutes.AccountRoute);
  }
  moveToLogin(BuildContext context) {
    Navigator.pushNamed(context, MyRoutes.loginRoute);
  }
}