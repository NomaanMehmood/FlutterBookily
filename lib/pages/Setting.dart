import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xff2E4149),
      appBar: AppBar(
        title: Text("Settings", style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white),),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 26, right: 16),
         child: ListView(
           children: [
             Text("Settings",
             style: TextStyle(
               fontWeight: FontWeight.w500,
               fontSize: 25,
               color: Colors.white,


             ),),
             SizedBox(height: 40,),
             Row(
               children: [
                 Icon(Icons.person, color: Colors.white70,),
                 SizedBox(width: 8,),
                 Text("Account Settings" , style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white70),)

               ],
             ),
             Divider(height: 15,thickness: 2, color: Colors.white70,),
             SizedBox(height: 20,),

            GestureDetector(
              onTap: (){
                showDialog(
                    context: context,
                    builder:(BuildContext context){
                      return AlertDialog(
                        backgroundColor:Color(0xff2E4149),
                        title: Text("Change Password?", style:TextStyle(color: Colors.white70,),),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Curent Password", style:TextStyle(color: Colors.white70,)),
                            Text("New Password", style:TextStyle(color: Colors.white70,)),
                            Text("New Password", style:TextStyle(color: Colors.white70,)),

                          ],
                        ),
                        actions: [
                          FlatButton(
                            onPressed:(){
                              Navigator.of(context).pop();
                          },
                          child: Text("Close", style: TextStyle(fontSize: 16, color: Colors.white70),),),
                        ],
                      );

                    }
                );
              },
             child:Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text("Change Password",
                 style: TextStyle(
                   fontSize: 18,
                   fontWeight: FontWeight.w500,
                   color: Colors.white70,
                 ),
                 ),
                 Icon(Icons.arrow_forward_ios, color: Colors.white70,),
               ],
             ),
            ),
             SizedBox(height: 16,),
             GestureDetector(
               onTap: (){
                 showDialog(
                     context: context,
                     builder:(BuildContext context){
                       return AlertDialog(
                         backgroundColor:Color(0xff2E4149),
                         title: Text("Change Email?", style: TextStyle(color: Colors.white70),),
                         content: Column(
                           mainAxisSize: MainAxisSize.min,
                           children: [
                             Text("New Email Address?", style: TextStyle(color: Colors.white70),),

                           ],
                         ),
                         actions: [
                           FlatButton(
                             onPressed:(){
                               Navigator.of(context).pop();
                             },
                             child: Text("Close", style: TextStyle(fontSize: 16, color: Colors.white70),),),
                         ],
                       );

                     }
                 );
               },
               child:Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text("Change Email",
                     style: TextStyle(
                       fontSize: 18,
                       fontWeight: FontWeight.w500,
                       color: Colors.white70,
                     ),
                   ),
                   Icon(Icons.arrow_forward_ios, color: Colors.white70,),
                 ],
               ),
             ),
             SizedBox(height: 16,),
             GestureDetector(
               onTap: (){
                 showDialog(
                     context: context,
                     builder:(BuildContext context){
                       return AlertDialog(
                         backgroundColor: Color(0xff2E4149),

                         title: Text("Privacy", style: TextStyle(color: Colors.white70),),
                         content: Column(
                           mainAxisSize: MainAxisSize.min,
                           children: [
                             Text("This application will not collect any personal information!", style: TextStyle(color: Colors.white70),),

                           ],
                         ),
                         actions: [
                           FlatButton(
                             onPressed:(){
                               Navigator.of(context).pop();
                             },
                             child: Text("Close", style: TextStyle(fontSize: 16, color: Colors.white70),),),
                         ],
                       );

                     }
                 );
               },
               child:Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text("Privacy ",
                     style: TextStyle(
                       fontSize: 18,
                       fontWeight: FontWeight.w500,
                       color: Colors.white70,
                     ),
                   ),
                   Icon(Icons.arrow_forward_ios, color: Colors.white70,),
                 ],
               ),
             ),
           ],
         ),
      ),



    );
  }
}
