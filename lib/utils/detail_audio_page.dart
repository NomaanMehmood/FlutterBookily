import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterui/models/book_library.dart';
import 'package:google_fonts/google_fonts.dart';
import 'audio_file.dart';
class DetailAudioPage extends StatefulWidget {
  final Books item;
  const DetailAudioPage({Key? key, required this.item}) : super(key: key);

  @override
  _DetailAudioPageState createState() => _DetailAudioPageState();
}
class _DetailAudioPageState extends State<DetailAudioPage> {
   late AudioPlayer advancedPlayer;

  @override
  void initState(){
    super.initState();
    advancedPlayer= AudioPlayer();
  }
   @override
  Widget build(BuildContext context) {
    final double screenHeight= MediaQuery.of(context).size.height;
    final double screenWidth= MediaQuery.of(context).size.width;
    widget.item;

    return Scaffold(
      backgroundColor: const Color(0xff2E4149),
      body: Stack(

        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenHeight/3,
            child: Container(
                color: const Color(0xff181E36),

            )

          ),
          Positioned(
              top: 0,
              left: 0,
              right: 0,

              child: AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    advancedPlayer.stop();
                    Navigator.of(context).pop();
                  },
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {  },
                  ),

                ],
              )),
          Positioned(
            left: 0,
              right: 0,
              top: screenHeight*0.2,
              height: screenHeight*0.36,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),

                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    SizedBox(height: screenHeight*0.1,),
                    Text(widget.item.title,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.openSans().fontFamily,
                      wordSpacing: 1  ,

                    ),
                    ),
                   Text(widget.item.Description, style: const TextStyle(fontSize: 20),),
                    AudioFile(advancedPlayer:advancedPlayer,audioPath: this.widget.item.audio_file),
                  ],
                ),


          )),
          Positioned(
              top: screenHeight*0.12,
              left: (screenWidth-150) /2,
              right: (screenWidth-150) /2,
              height: screenHeight*0.16,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white, width: 2),
                  color: Colors.blueGrey[600],
                ),
                child: Padding(
                   padding: const EdgeInsets.all(20),
                   child: Container(

                     decoration: BoxDecoration(
                       //borderRadius: BorderRadius.circular(20),
                       shape: BoxShape.circle,
                       border: Border.all(color: Colors.white, width: 1),

                       image: DecorationImage(
                         image: AssetImage(widget.item.Image, ),
                         fit: BoxFit.fill,
                       )
                     ),
                   ),
                ),

          ))
        ],
      ),

    );

  }
}
