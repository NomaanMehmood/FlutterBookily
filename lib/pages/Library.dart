import 'package:flutter/material.dart';
import 'package:flutterui/models/book_library.dart';
import 'package:flutterui/widgets/drawer.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/detail_audio_page.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2E4149),
      appBar: AppBar(
        title:Text(' Bookily| Library'),
        centerTitle: true,
      ),
      body:Column(
       // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(left: 12 ,top: 20),
              alignment: Alignment.topLeft,
              child: Text("Listen Now!", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white70 ,fontSize: 24, fontFamily: GoogleFonts.lato().fontFamily),),

          ),),
          Divider(height: 12,thickness: 2, color: Colors.grey,),
          Expanded(
            flex: 4,
            child:  Container(
              color: Color(0xff2E4149),
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: BookLibraryModel.books_library.length,
              itemBuilder: (context, index){
                // return ItemWidget(items: BookLibraryModel.library[index]);
                final item = BookLibraryModel.books_library[index];
                return  GestureDetector(
                    onTap: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder:((context)=>DetailAudioPage(item: item))),
                  );
                },
                child: Container(
                  child:
                         GridTile(
                  header:Container(
                    child:Image.asset(item.Image, fit: BoxFit.contain,
                    ),
                    padding: const EdgeInsets.all(40),
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  child: Text(item.title,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0, color: Colors.white70),textAlign: TextAlign.center,),
                  footer: Text(item.Description, textAlign: TextAlign.center, style: TextStyle(fontSize: 8, color: Colors.white70),),

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
          ),),

      // New Release Section
      Expanded(
        flex: 5,
        child: Column(

          children: [
            Expanded(
                flex:1,
                child: Container(
                  color: Color(0xff2E4149),
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 12, top: 30),
                  child:Text(
                    "New Release",
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: GoogleFonts.lato().fontFamily
                        , fontWeight: FontWeight.bold,
                        color: Colors.white70
                      ,
                    ),
                  ),
                ),
            ),
            Divider(height: 15,thickness: 2, color: Colors.grey,),
            Expanded(
                flex:4,
                child:  Container(
                  color:Color(0xff2E4149),
                  padding: EdgeInsets.all(22),
                  alignment: Alignment.topLeft,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: BookLibraryModel.books_library.length,
                    itemBuilder: (context, index){
                      // return ItemWidget(items: BookLibraryModel.library[index]);
                      //_____yaha sa neechay grid walay tareeqay sa code kr ra hu; grid na chalay tou oper walay list sa krlaina
                      final item = BookLibraryModel.books_library[index];
                      return GestureDetector(
                          onTap: (){
                        Navigator.push(context,
                          MaterialPageRoute(builder:((context)=>DetailAudioPage(item: item))),
                        );
                      },
                        child:Container(
                              child:GridTile(
                                  header:Container(
                          child:Image.asset(item.Image, fit: BoxFit.contain,
                          ),
                          padding: const EdgeInsets.all(30),
                          decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),

                        child: Text(item.title,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0, color: Colors.white70),textAlign: TextAlign.center,),
                        footer: Text(item.Description, textAlign: TextAlign.center, style: TextStyle(fontSize: 8, color: Colors.white70),),

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
      )
          ],
        )

      ),

        ],

      ),




      drawer: MyDrawer(),
    );
  }
}

