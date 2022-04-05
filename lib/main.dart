import 'package:flutter/material.dart';
import 'package:flutterui/pages/Account.dart';
import 'package:flutterui/pages/Library.dart';
import 'package:flutterui/pages/home_page.dart';
import 'package:flutterui/pages/login_page.dart';
import 'package:flutterui/utils/routes.dart';
import 'package:flutterui/widgets/themes.dart';
import 'package:google_fonts/google_fonts.dart';

void main(){

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
      },
      );
  }
}
