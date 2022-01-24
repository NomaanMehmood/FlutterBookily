import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  int days= 30;
  String name= 'Nouman Mehmood';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookily'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body:Center(
        child:Container(
          child: Text('Well come To $days days of Flutter by $name'),
        ),
      ),
      drawer: Drawer(

      ),


    );
  }
}
