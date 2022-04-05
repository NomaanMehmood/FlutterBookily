import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class chat extends StatefulWidget {
  const chat({Key? key}) : super(key: key);
  @override
  _chatState createState() => _chatState();
}

class _chatState extends State<chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2E4149),
      appBar: AppBar(
        title: const Text('Bookily | Chat'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Bookily Community Chat Server",
          style: TextStyle(fontSize: 19, color: Colors.white),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            height: 500,
            width: 400,
            child: Card(
              color: Colors.deepPurple,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
              elevation: 5.0,
              margin: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  ListTile(
                    leading: Icon(Icons.wechat_sharp, size: 60),
                    title: Text(
                        'Bookily Chat Group',
                        style: TextStyle(fontSize: 24.0,
                            color: Colors.white
                        )
                    ),

                    subtitle: Text(
                        "Meet and chat with the Thousands of bookily community around Globe!",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white70,

                        )
                    ),
                  ),
                  SizedBox(height: 50,),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        color: Colors.green,
                        child: Text('Join Now',
                        style: TextStyle(fontSize: 20,),
                        ),
                        onPressed: _launchURL,
                      ),

                    ],
                  ),
                ],

              ),



            ),

          ),
        ],

      ),

    );
  }
}
_launchURL() async {
  const url = 'https://discord.com/invite/JYvRW52Pew';
  if (await canLaunch(url)){
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}



