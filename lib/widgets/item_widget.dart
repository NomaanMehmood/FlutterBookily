import 'package:flutter/material.dart';
import 'package:flutterui/models/book_library.dart';
class ItemWidget extends StatelessWidget {

  final Books items;

  const ItemWidget({Key? key, required this.items}) :
        assert(items!= null),
        super(key:key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child :ListTile(
        onTap: (){
          print("pressed");
        },
      leading: Image.asset(items.Image
        ),
      title: Text(items.title),
      subtitle: Text(items.Description),
    ),
    );
  }
}
