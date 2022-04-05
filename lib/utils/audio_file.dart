import 'package:flutter/cupertino.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
class AudioFile extends StatefulWidget {

  final AudioPlayer advancedPlayer;
  final String audioPath;
  const AudioFile({Key? key, required this.advancedPlayer, required this.audioPath}) : super(key: key);

  @override
  _AudioFileState createState() => _AudioFileState();
}
class _AudioFileState extends State<AudioFile> {
  Duration _duration= new Duration();
  Duration _position= new Duration();
  final String path= "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3";
  bool isPlaying= false;
  bool isPaused= false;
  bool isRepeat= false;

  Color colour= Colors.black;
  final List <IconData> _icons=
  [
    Icons.play_circle_fill,
    Icons.pause_circle_filled,
  ];
  @override
  void initState(){
    super.initState();
    this.widget.advancedPlayer.onDurationChanged.listen((d) { setState(() {
      _duration=d;
    }); });
    this.widget.advancedPlayer.onAudioPositionChanged.listen((p) {setState(() {
      _position=p;
    });});
    this.widget.advancedPlayer.setUrl(this.widget.audioPath);
    this.widget.advancedPlayer.onPlayerCompletion.listen((event) {
      setState(() {
        _position=Duration(seconds: 0);
        if(isRepeat==true){
          isPlaying=true;
        }
        else{
          isPlaying=false;
          isRepeat=false;
        }

      });

    });
  }
Widget btnStrt(){
    return IconButton(
      padding : const EdgeInsets.only(bottom: 10),
      icon: isPlaying==false?
        Icon(_icons[0], size: 50, color: const Color(0xff2E4149),): Icon(_icons[1], size: 50,color:  const Color(0xff2E4149),),
      onPressed:(){
        if(isPlaying==false) {
              this.widget.advancedPlayer.play(widget.audioPath);
              setState(() {
                isPlaying = true;
              });
        }
        else if(isPlaying==true){
            this.widget.advancedPlayer.pause();
            setState(() {
              isPlaying=false;
            });

        }
      },
    );
}
Widget btnFast(){
    return IconButton(
      icon: const ImageIcon(
        AssetImage("assets/images/fastfrwd.png"),
        size: 28,
          color: Colors.black,
      ),
      onPressed: () {
          this.widget.advancedPlayer.setPlaybackRate(1.5);
    },
    );

}
Widget btnSlow(){
    return IconButton(
      icon: const ImageIcon(
        AssetImage("assets/images/slwfrwd.png"),
        size: 28,
        color: Colors.black,
      ),
      onPressed: () {
          this.widget.advancedPlayer.setPlaybackRate(0.5);
    },
    );

  }
  Widget btnLoop(){
    return IconButton(
      icon: Icon(Icons.loop, size:30, color:colour,),
      onPressed: () {
        if(isRepeat==false){
          this.widget.advancedPlayer.setReleaseMode(ReleaseMode.LOOP);
          color: colour;
          setState(() {
            isRepeat=true;
            colour=Colors.deepPurple;
          });
        //this.widget.advancedPlayer.setPlaybackRate(0.5);
      }
        else if(isRepeat==true){
          this.widget.advancedPlayer.setReleaseMode(ReleaseMode.RELEASE);
          setState(() {
            isRepeat=false;
            colour=Colors.black;
          });
        }

        },
    );

  }

  Widget btnRepeat(){
    return IconButton(
      icon: const ImageIcon(
        AssetImage("assets/images/shuffle.png"),
        size: 28,
      ),
      onPressed: () {
          }

    );

  }

Widget loadAsset() {
  return
    Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          btnLoop(),
          btnSlow(),
          btnStrt(),
          btnFast(),
          btnRepeat(),


        ],
      ),
    );
}
Widget slider() {
    return Slider(
        activeColor: Colors.deepPurple,
        inactiveColor: Colors.grey,
        value: _position.inSeconds.toDouble(),
        min: 0.0,
        max: _duration.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            changeToSecond(value.toInt());
            value = value;
          });
        }
    );
  }
  void changeToSecond(int second){
    Duration newDuration = Duration(seconds: second);
    this.widget.advancedPlayer.seek(newDuration);
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_position.toString().split(".")[0], style: TextStyle(fontSize: 16),),
                Text(_duration.toString().split(".")[0], style: TextStyle(fontSize: 16),),
              ],
            ),
          ),
          slider(),
          loadAsset(),

        ],
      ),
    );
  }
}
