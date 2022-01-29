import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterui/models/book_library.dart';
import 'package:flutterui/widgets/drawer.dart';
import 'package:flutterui/widgets/item_widget.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title: Text('Bookily'),
        centerTitle: true,
      ),
      /*
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.all(25.0),
            child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Bookiley", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.deepPurple),),
                  Text("Recently Added", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.0),)

          ],
            )
      ),
      ),*/
      //Grid view chal ra hai lakin overlap hora hai; ---------------------------- drawer tak comnt kia ha
      body:
      GridView.builder(

          itemCount: BookLibraryModel.library.length,
          itemBuilder: (context, index){
           // return ItemWidget(items: BookLibraryModel.library[index]);
            //_____yaha sa neechay grid walay tareeqay sa code kr ra hu; grid na chalay tou oper walay list sa krlaina
            final item = BookLibraryModel.library[index];
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
/*
class BookilyHeader extends StatelessWidget {
  const BookilyHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BookilyHeader(),
        if(BookLibraryModel.library !=null && BookLibraryModel.library.isNotEmpty)
            BookList()
        else
          Center(
            child: CircularProgressIndicator(),
    )

      ],
    );
  }
}
class BookList extends StatelessWidget {
  const BookList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: BookLibraryModel.library.length,
        itemBuilder: (context, index){
          final books= BookLibraryModel.library[index];
          return BookItem( book: books);
        }
    );
  }
}
class BookItem extends StatelessWidget {
  final Books book;

  const BookItem({Key? key, required this.book}) : assert(book!=null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Image.asset(book.Image),
          Text(book.title),
        ],

      ),
    );
  }
}

*/