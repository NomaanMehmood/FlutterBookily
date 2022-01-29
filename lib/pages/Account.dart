import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutterui/widgets/drawer.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text("Bookily | Accounts"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children:  [
          SizedBox(height: 10,),
          //app bar

          // discover new path
        Padding(
            padding: EdgeInsets.only(left:20.0),
            child: Text("Recently Added", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),

        ),
          SizedBox(height: 20,),
          //search Bar

          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.grey[200]),
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      child: Image.asset('assets/images/SI.png'),
                    ),
                    Expanded(child:  TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search here..",


                      ),
                    ),),

                  ],
                ),
              ),
          ),
          // for you -> job cards

          // recently added -> job tiles

        ],
      ),

      drawer: MyDrawer(),
      );



  }
}
