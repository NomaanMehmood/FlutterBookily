import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterui/utils/routes.dart';
import 'package:flutterui/widgets/drawer.dart';


class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  final FirebaseAuth _auth= FirebaseAuth.instance;
  User? user;
  bool _isloggedIn= false;
  static bool showPassword= false;
  checkAuthentification() async{
    _auth.authStateChanges().listen((user){
      if(user ==null){
        Navigator.pushNamed(context, MyRoutes.loginRoute);
      }
    });

  }
  getUser()async{
    User firebaseUser = await _auth.currentUser!;
    await firebaseUser.reload();
    firebaseUser =await _auth.currentUser!;

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
    super.initState();
    this.checkAuthentification();
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text("Accounts"),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {},
                icon: const Icon(
                  Icons.settings,
                  color: Color(0xff181E36),
                ))
          ],
        ),
        body: Container(
            color: Color(0xff2E4149 ),
            padding: EdgeInsets.only(left: 16, top: 24, right: 16),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: ListView(
                children: [
                  Text("Edit Profile",

                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: Colors.white),
                  ),
                  SizedBox(height: 18,),
                  Center(
                      child: Stack(
                        children: [
                          Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 4,
                                  color: Colors.white,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    color: Colors.white.withOpacity(0.1),
                                    offset: Offset(0, 10),
                                  ),
                                ],
                                shape: BoxShape.circle,
                                image: DecorationImage(

                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "assets/images/profilePic.png"),

                                )
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff2E4149),
                                  border: Border.all(
                                    width: 4,
                                    color: Theme
                                        .of(context)
                                        .scaffoldBackgroundColor,
                                  )

                              ),

                              child: Icon(Icons.edit, color: Colors.white,),


                            ),
                          ),

                        ],
                      )
                  ),
                  SizedBox(height: 30,),
                  buildTextField("Name", "${user?.displayName}", false),
                  buildTextField("Email", "${user?.email}", false),
                  buildTextField("Password", "******", true),
                  SizedBox(height: 50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      OutlineButton(
                        padding: EdgeInsets.symmetric(horizontal: 50,),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        color: Colors.red,
                        onPressed: (){
                        },
                        child: Text("Cancel",
                          style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                      ),
                      RaisedButton(
                        padding: EdgeInsets.symmetric(horizontal: 50,),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 2,
                        color: Colors.deepPurple,
                        onPressed: (){},
                        child: Text("Save",
                          style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                      )
                    ],
                  )

                ],
              ),
            )


        ),
        drawer: const MyDrawer(),
      );

  }

  Widget buildTextField( String labeltext, String placeHolder, bool isPassword){
    return Padding(
        padding: EdgeInsets.only(bottom: 35.0),
        child: TextField(
          obscureText: isPassword ,

          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 3),
            suffixIcon: isPassword? IconButton(
                onPressed: (){
                  setState(){
                    showPassword=!showPassword;
                  }
                },
                icon: Icon(Icons.remove_red_eye)
            ): null,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelText: labeltext,
            hintText: placeHolder,
            labelStyle: TextStyle(fontSize:20, color: Colors.white),
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,


            ),

          ),

        )
    );
  }
}




