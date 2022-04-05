//import 'dart:html';
import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutterui/utils/routes.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  @override
  _RegisterPageState createState() =>_RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  // username with welcome
  String name=" ";
  late dynamic _email, _password, _name;
  bool changeButton=false;
  final _formkey= GlobalKey<FormState>();
  final FirebaseAuth _auth= FirebaseAuth.instance;


  checkAuthentification()async{
    _auth.authStateChanges().listen((user) {
      if(user !=null){
        Navigator.pushNamed(context, MyRoutes.homeRoute);
      }
    });
    @override
    void initState(){
      super.initState();
      this.checkAuthentification();
    }
  }
  moveToHome(BuildContext context) async{
    if(_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }

  }

  registerUser() async{
    if(_formkey.currentState!.validate())
    {
      _formkey.currentState!.save();
      try{
        UserCredential  user = await _auth.createUserWithEmailAndPassword(email: _email, password: _password);
        if(user!=null){
          user.user!.updateDisplayName(_name);
          user.user!.updateProfile(displayName: _name);
          Navigator.pushNamed(context, MyRoutes.homeRoute);
        }


      } catch (e) {
          showError(e.toString());
      }
    }
  }



  showError(String errormessage){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: const Text("Error"),
            content: Text(errormessage),
            actions: [
              FlatButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: Text('OK'),)
            ],
          );
        }
    );
  }



  @override
  Widget build(BuildContext context) {
    return Material(
        color: Color(0xff2E4149),
        child: SingleChildScrollView(
            child: Form(
                key: _formkey,
                child: Column(
                  children:[
                    Image.asset(
                      "assets/images/bookily_logo1.jpeg",
                      fit: BoxFit.cover,
                    ),
                    const Text("Create an Account!",
                    style:TextStyle(fontSize: 18, color: Colors.blueGrey,)
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text("Welcome to Bookily ",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70
                      ),
                    ),

                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                hintText: "Enter your Name", hintStyle:TextStyle(color: Colors.grey),
                                labelText: "Name",labelStyle: TextStyle(color: Colors.white70),
                              ),

                              validator:(value){

                                if(value!.isEmpty){
                                  return "Name cannot be empty";
                                }
                                else
                                  return null;


                              },
                              onSaved: (value) {
                                _name= value;
                              },

                              onChanged: (value){
                                //name= value;
                                setState(() {

                                });
                              },
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                hintText: "Enter your email", hintStyle:TextStyle(color: Colors.grey),
                                labelText: "Email",labelStyle: TextStyle(color: Colors.white70),
                              ),

                              validator:(value){

                                if(value!.isEmpty){
                                  return "email cannot be empty";
                                }
                                else
                                  return null;


                              },
                              onSaved: (value) {
                                _email= value;
                              },

                              onChanged: (value){
                                name= value;
                                setState(() {

                                });
                              },
                            ),

                            TextFormField(
                              obscureText: true,

                              decoration: const InputDecoration(
                                prefixIcon:Icon(Icons.lock),
                                hintText: "Enter Password",hintStyle: TextStyle(color: Colors.grey),
                                labelText: "Password",labelStyle: TextStyle(color: Colors.white70),
                              ),

                              validator:(value){
                                if(value!.isEmpty){
                                  return "Password cannot be empty";
                                }
                                else if(value.length < 6){
                                  return "Minimum 6 character is required";
                                }
                                else
                                  return null;
                              },
                              onSaved: (value)=> _password=value,
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            //inkwell provides clickable container properties
                            InkWell(
                                onTap: () =>registerUser(),

                                child: AnimatedContainer(
                                  duration: const Duration(seconds: 1),
                                  width: changeButton?50:150,
                                  height: 50,

                                  alignment: Alignment.center,
                                  child: changeButton? const Icon(Icons.done,
                                    color: Colors.white,):
                                  const Text("Register", style:TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,

                                  ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurple,
                                    borderRadius: BorderRadius.circular(changeButton? 50:8),
                                  ),


                                )
                            ),
                            const SizedBox(height: 20.0,),
                            // SignInButton(
                            //   Buttons.Google,
                            //   text: "Sign up with Google",
                            //   onPressed: () {
                            //
                            //   },
                            // ),

                            const Text("Already have an account?", style: TextStyle(fontSize: 14, color: Colors.white70),),
                            FlatButton(
                              onPressed: () {
                                Navigator.pushNamed(context, MyRoutes.loginRoute);
                              },
                              child: const Text("Login",
                                style: TextStyle(fontSize: 16, color: Colors.white),
                              )
                              ,
                            ),


                          ],
                        )


                    )

                  ],
                )
            )

        )
    );
  }
}

