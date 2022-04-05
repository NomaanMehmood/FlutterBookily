import 'package:flutter/material.dart';
import 'package:flutterui/pages/Account.dart';
import 'package:flutterui/pages/Library.dart';
import 'package:flutterui/pages/Setting.dart';
import 'package:flutterui/pages/chat.dart';
import 'package:flutterui/pages/home_page.dart';
import 'package:flutterui/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterui/utils/routes.dart';
import 'package:flutterui/widgets/themes.dart';

import 'pages/premium.dart';
import 'pages/register_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      debugShowCheckedModeBanner: false,
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.loginRoute,
      routes: {
        "/" :(context) => const LoginPage(),
        "/library" :(context) => const LibraryPage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.libraryRoute: (context)=> const LibraryPage(),
        MyRoutes.AccountRoute: (context)=> const AccountPage(),
        MyRoutes.SettingRoute: (context)=> const SettingPage(),
        MyRoutes.registerRoute: (context)=> const RegisterPage(),
        MyRoutes.premiumRoute: (context)=> const premiumPage(),
        MyRoutes.chatRoute:(context)=>const chat(),

      },
      );
  }
}
