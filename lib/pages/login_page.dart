import 'package:flutter/material.dart';
import 'package:flutterui/utils/routes.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // username with welcome
  String name=" ";
  bool changeButton=false;
  final _formkey= GlobalKey<FormState>();

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

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children:[
                Image.asset(
                  "assets/images/bookily_logo1.jpeg",
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                 Text("Welcome $name",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                    child: Column(
                      children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            hintText: "Enter User Name",
                            labelText: "Username"
                        ),

                        validator:(value){
                           if(value!.isEmpty){
                             return "username cannot be empty";
                           }
                           else
                             return null;
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
                          hintText: "Enter Password",
                          labelText: "password",
                        ),

                        validator:(value){
                          if(value!.isEmpty){
                            return "password cannot be empty";
                          }
                          else
                            return null;
                        },
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      //inkwell provides clickable container properties
                      InkWell(
                        onTap: () =>moveToHome(context),


                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width: changeButton?50:150,
                        height: 50,

                        alignment: Alignment.center,
                        child: changeButton? Icon(Icons.done,
                        color: Colors.white,):
                        Text("Login", style:TextStyle(
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
                      )
                      /*
                      ElevatedButton(
                        onPressed: (){
                          Navigator.pushNamed(context, MyRoutes.homeRoute);
                        },
                        child: const Text("Login"),
                        style: TextButton.styleFrom(minimumSize: Size(150.0, 50.0)),
                      )
                      */

                    ],)


                )

              ],
            )
          )

        )
    );
  }
}

