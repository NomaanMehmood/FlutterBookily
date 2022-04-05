import 'package:flutter/material.dart';
import 'package:flutterui/models/book_library.dart';
import 'package:flutterui/widgets/drawer.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookily | Library'),
        centerTitle: true,
      ),
      body: GridView.builder(


        itemCount: BookLibraryModel.library.length,
        itemBuilder: (context, index){
          // return ItemWidget(items: BookLibraryModel.library[index]);
          //_____yaha sa neechay grid walay tareeqay sa code kr ra hu; grid na chalay tou oper walay list sa krlaina
          final item = BookLibraryModel.library[index];
         const Padding(
            padding: EdgeInsets.zero,//only(left:20.0),
            child: Text("Recently Added", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),

          );
          return GridTile(


            header:Container(

              child:Image.asset(item.Image, fit: BoxFit.contain,),
              padding: const EdgeInsets.all(40),
              decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
              ),

            ),
            child:Text(item.title,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),textAlign: TextAlign.center,),
            footer: Text(item.Description, textAlign: TextAlign.center),

          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,

        ),
      ),



      drawer: MyDrawer(),
    );
  }
}

