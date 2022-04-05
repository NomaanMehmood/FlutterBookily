import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterui/models/book_library.dart';
import 'package:flutterui/utils/detail_audio_page.dart';
import 'package:flutterui/utils/routes.dart';
import 'package:flutterui/widgets/drawer.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>{

  final FirebaseAuth _auth= FirebaseAuth.instance;
  late  User user;
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
    this.checkAuthentification();
    this.getUser();
    super.initState();
    loadData();
  }
  loadData() async{
    var bookJson= await rootBundle.loadString("assets/files/book_library.json");
    var decodeData= jsonDecode(bookJson);
    var booksData= decodeData["Books"];
    BookLibraryModel.books_library= List.from(booksData)
        .map<Books>((book) => Books.fromMap(book))
        .toList();
    setState(() {

    });


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title: Text('Bookily'),
        centerTitle: true,
      ),

      body:!_isloggedIn? Center(
        child: CircularProgressIndicator(),
      ):Column(
        children: [
          Expanded(
            flex: 3,
              child: Container(
                color: Color(0xff2E4149),
                child: SingleChildScrollView(
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    SizedBox(height: 10,),
                    // Recently added
                    Padding(
                      padding: EdgeInsets.only(left:20.0),
                      child: Text("Welcome to Bookily ${user.displayName}",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),

                    ),
                    SizedBox(height: 10,),
                    //search Bar
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: Container(
                        decoration: BoxDecoration(color: Color(0xff2E4149),
                          border:Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 30,
                              child: Image.asset('assets/images/SI.png'),
                            ),
                            Expanded(
                              child:TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Search here..",
                                  hintStyle: TextStyle(color: Colors.white70),

                                ),
                              ),),
                          ],
                        ),
                      ),
                    ),
                    // for you -> job cards

                    // discover new path
                    Padding(
                      padding: EdgeInsets.only(left:10.0, top: 10.0),
                      child: Text("Read Now!",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white70),
                      ),

                    ),

                  ],
                ),
                ),
              )),

          Expanded(
            flex: 7,
              child:Container(
                color: Color(0xff2E4149),
                child: GridView.builder(
                  itemCount: BookLibraryModel.books_library.length,
                  itemBuilder: (context, index){
                    var item = BookLibraryModel.books_library[index];
                    return
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context,
                        MaterialPageRoute(builder:((context)=>DetailAudioPage(item: item))),
                        );
                      },
                      child:  Container(
                        child: GridTile(
                          header:Container(
                            child:Image.asset(item.Image, fit: BoxFit.contain,),
                            padding: const EdgeInsets.all(40),
                            decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(10)
                            ),

                          ),
                          child:Text(item.title,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white70),textAlign: TextAlign.center,),
                         // footer: Text(item.Description, textAlign: TextAlign.center),

                        ),
                      ),

                    );


                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,

                  ),
                ),
              ),
          ),
        ],
      ),

      drawer: MyDrawer(),
    );
  }
}
