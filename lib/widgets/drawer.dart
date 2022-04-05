import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterui/utils/routes.dart';
import 'package:url_launcher/url_launcher.dart';



class MyDrawer extends StatefulWidget {


  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}


class _MyDrawerState extends State<MyDrawer> {
  final FirebaseAuth _auth= FirebaseAuth.instance;
  User? user;
  bool _isloggedIn= false;
  checkAuthentification() async{
    _auth.authStateChanges().listen((user){
      if(user ==null){
        Navigator.pushNamed(context, MyRoutes.loginRoute);
      }
    });

  }
  getUser()async{
    User firebaseUser = _auth.currentUser!;
    await firebaseUser.reload();
    firebaseUser =_auth.currentUser!;

    if(firebaseUser !=null)
    {
      setState(() {
        this.user= firebaseUser;
        this._isloggedIn=true;
      });
    }

  }
  @override
  void initState() {
    // TODO: implement initState
    this.getUser();
    this.checkAuthentification();
    super.initState();


  }
  @override
  Widget build(BuildContext context) {

    return Drawer(
      backgroundColor: const Color(0xff2E4149),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              decoration: const BoxDecoration(
                color: Color(0xff181E36),
              ),
              accountName: Text("${user?.displayName}", textScaleFactor: 1.2,),
              accountEmail: Text("${user?.email}", textScaleFactor: 1.2),
              currentAccountPicture: CircleAvatar(
                radius: 30.0,
                  child:ClipOval(
                    child:Image.asset("assets/images/profilePic.png", fit: BoxFit.contain,),
                  )

              ),
            ),
          ),
          ListTile(

            leading: const Icon(CupertinoIcons.home,color: Colors.white,),
            onTap: () => moveToHome(context),
            title: const Text("Home",
              textScaleFactor: 1.2, style: const TextStyle(color: Colors.white),),
          ),
          ListTile(
            leading: const Icon(CupertinoIcons.book ,color: Colors.white,),
            onTap: () => moveToLibrary(context),
            title: const Text("Library",
              textScaleFactor: 1.2,style: TextStyle(color: Colors.white),),
          ),
          ListTile(
            leading: const Icon(CupertinoIcons.profile_circled,color: Colors.white,),
            onTap: () => moveToAccount(context),
            title: const Text("Account",
              textScaleFactor: 1.2,style: TextStyle(color: Colors.white),),
          ),
          ListTile(
            leading: const Icon(CupertinoIcons.chat_bubble_2_fill ,color: Colors.white,),
            onTap: () => moveToChat(context),
            title: const Text("Chat Now",
              textScaleFactor: 1.2,style: TextStyle(color: Colors.white),),
          ),
          ListTile(
            leading:Image.asset("assets/images/premium.png",width: 24,height: 24,),
            onTap: () => moveToPremium(context),
            title: const Text("Premium Account",
              textScaleFactor: 1.2,style: TextStyle(color: Colors.white),),
          ),
          ListTile(
            leading: const Icon(CupertinoIcons.settings,color: Colors.white,),
            onTap: () => moveToSetting(context),
            title: const Text("Setting",
              textScaleFactor: 1.2,style: TextStyle(color: Colors.white),),
          ),
          const SizedBox(height:220),
          ListTile(
            leading: const Icon(CupertinoIcons.arrow_left_square_fill, color: Colors.white,),
            onTap: () => logOut(context),
            title: const Text("LogOut",
              textScaleFactor: 1.2,style: const TextStyle(color: Colors.white),),
          ),
        ],
      ),
    );
  }
}
_launchURLApp() async {
  const url = 'https://discord.gg/BDHd8gmC';
  if (!await canLaunch(url)) {
    await launch(url, forceSafariVC: true, forceWebView: true);
  } else {
    throw 'Could not launch $url';
  }
}
moveToLibrary(BuildContext context) {
    Navigator.pushNamed(context, MyRoutes.libraryRoute);
  }
moveToChat(BuildContext context) {
  Navigator.pushNamed(context, MyRoutes.chatRoute);
}
moveToPremium(BuildContext context) {
  Navigator.pushNamed(context, MyRoutes.premiumRoute);
}
  moveToHome(BuildContext context) {
    Navigator.pushNamed(context, MyRoutes.homeRoute);
  }
  moveToAccount(BuildContext context) {
    Navigator.pushNamed(context, MyRoutes.AccountRoute);
  }
  logOut(BuildContext context) {
    final FirebaseAuth _auth= FirebaseAuth.instance;
    _auth.signOut();
    //Navigator.pushNamed(context, MyRoutes.loginRoute);
  }
  moveToSetting(BuildContext context) {
    Navigator.pushNamed(context, MyRoutes.SettingRoute);
  }
