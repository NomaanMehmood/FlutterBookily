import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutterui/utils/routes.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // username with welcome
  String name=" ";
  late dynamic _email, _password;
  bool changeButton=false;
  final _formkey= GlobalKey<FormState>();
  final FirebaseAuth _auth= FirebaseAuth.instance;


  checkAuthentification()async{
    _auth.authStateChanges().listen((user) {
      if(user !=null){
        Navigator.pushNamed(context, MyRoutes.homeRoute);
      }
    });
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
  LoginWithDB() async{
    if(_formkey.currentState!.validate()){
      _formkey.currentState!.save();

      try{
        UserCredential user = await _auth.signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.pushNamed(context, MyRoutes.homeRoute);

      }
      catch(e){
        showError(e.toString());
      }


    }

  }
  showError(String errormessage){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Invalid Login Credentials"),
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
                const Text("Login Page",
                    style:TextStyle(fontSize: 18, color: Colors.blueGrey,)
                ),
                const SizedBox(
                  height: 10.0,
                ),
                 Text("Welcome to Bookily",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                    child: Column(
                      children: [
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
                        onTap: () =>LoginWithDB(),

                      child: AnimatedContainer(
                        duration: const Duration(seconds:0),
                        width: changeButton?50:150,
                        height: 50,

                        alignment: Alignment.center,
                        child: changeButton? const Icon(Icons.done,
                        color: Colors.white,):
                        const Text("Login", style:TextStyle(
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
                        SizedBox(height: 20.0,),
                        SignInButton(
                          Buttons.Google,
                          text: "Sign up with Google",
                          onPressed: () {

                          },
                        ),




                     const Text("Are you new to Bookily?", style: TextStyle(color: Colors.white70),),
                      FlatButton(
                        onPressed: () {
                          Navigator.pushNamed(context, MyRoutes.registerRoute);

                        },
                        child: const Text("Register Now",
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

