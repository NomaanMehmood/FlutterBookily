import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final String bookTitle;
  final String bookDescription;
  final String coverImgPath;
   const BookCard({Key? key, required this.bookTitle, required this.coverImgPath, required this.bookDescription}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 25),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
          width: 200,
      color: Colors.grey,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 100,
                child: Image.asset(coverImgPath),

              ),
              Container(
                padding: EdgeInsets.all(12),
                child:  Text("Read Now"),
                color: Colors.grey[200],
              ),

            ],
          ),
          Text(bookTitle),
          Text(bookDescription),
        ],
      ),


    ),
        )
        );
  }
}
