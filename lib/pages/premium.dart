import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class premiumPage extends StatefulWidget {
  const premiumPage({Key? key}) : super(key: key);

  @override
  _premiumPageState createState() => _premiumPageState();
}

class _premiumPageState extends State<premiumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2E4149),
      appBar: AppBar(
        title: const Text('Bookily | Premium'),
      ),

      body:Column(

        children:[
          const Text('Premium Subscription Plans',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w400
            ),

          ),
          SizedBox(height: 50),
             Container(
        height: 200,
        width: 400,
        child: Card(
          color: Colors.blue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
          elevation: 5.0,
          margin: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                leading: Icon(Icons.album, size: 60),
                title: Text(
                    'Basic Plan',
                    style: TextStyle(fontSize: 30.0,
                    color: Colors.white
                    )
                ),
                subtitle: Text(
                    "5 USD per month",
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey,

                    )
                ),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.green,
                    child: const Text('Purchase'),
                    onPressed: _launchURL,
                  ),

                ],
              ),
            ],

          ),



        ),

      ),
             Container(
            height: 200,
            width: 400,
            child: Card(
              color: Colors.yellow[300],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
              elevation: 5.0,
              margin: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.album, size: 60),
                    title: Text(
                        'Golden Plan',
                        style: TextStyle(fontSize: 30.0,
                            color: Colors.green
                        )
                    ),
                    subtitle: Text(
                        "4.33 USD per month",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.grey,

                        )
                    ),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        color: Colors.green,
                        child: const Text('Purchase'),
                        onPressed: _launchURL,
                      ),

                    ],
                  ),
                ],

              ),
            ),

          ),
             Container(
            height: 200,
            width: 400,
            child: Card(
              color: Colors.deepPurple[300],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
              elevation: 5.0,
              margin: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.album, size: 60),
                    title: Text(
                        'Platinum Plan',
                        style: TextStyle(fontSize: 30.0,
                            color: Colors.white
                        )
                    ),
                    subtitle: Text(
                        "3.50 USD per month",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.grey,
                        )
                    ),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        color: Colors.green,
                        child: const Text('Purchase'),
                        onPressed: _launchURL,
                      ),

                    ],
                  ),
                ],

              ),



            ),

          ),
      ]
    ),



      );

  }
  _launchURL() async {
    const url = 'https://www.paypal.com/pk/home';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  }

